<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인회원가입</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            font-size: medium;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        main {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 900px;
        }

        h2 {
            font-size: 30px;
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"], input[type="email"], textarea, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus, textarea:focus, select:focus {
            border-color: #6A5ACD;
            box-shadow: 0 0 8px rgba(106, 90, 205, 0.5);
        }

        textarea {
            height: 150px;
            resize: vertical;
        }

        button, input[type="submit"] {
            background-color: #6A5ACD;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            width: 100%;
        }

        button:hover, input[type="submit"]:hover {
            background-color: #5A4FCF;
        }

        .input-container, .checkbox-group, .form-group {
            margin-bottom: 20px;
        }

        .skill-category {
            font-weight: bold;
            color: #6A5ACD;
            margin-bottom: 10px;
        }

        .checkbox-group {
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .address-container input {
            margin-top: 10px;
        }

        #dupResult {
            margin-top: 10px;
            font-weight: bold;
        }

        .green {
            color: green;
        }

        .red {
            color: red;
        }

        @media (max-width: 768px) {
            main {
                padding: 20px;
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <main>
        <h2>내 이력서</h2>
        <form action="/User/ResumeRegister" method="POST" id="form">
            <div class="form-group">
                <label><span class="red">*</span> 제목</label>
                <input type="text" name="user_title" required />
                <input type="button" id="checkDuplication" value= "${user_title}"/>
                <span id="dupResult"></span>
            </div>
            <div class="form-group">
                <label><span class="red">*</span> 이름</label>
                <input type="text" name="user_name" id="user_name" value = "${user_name}" required />
            </div>
            <div class="form-group">
                <label><span class="red">*</span> 생일</label>
                <input type="text" name="user_birth" value ="${ user_birth}"required />
            </div>
            <div class="form-group">
                <label><span class="red">*</span> 이메일</label>
                <input type="email" name="user_email" value="${ user_email}" required />
            </div>
            <div class="form-group">
                <label><span class="red">*</span> 연락처</label>
                <input type="text" name="user_phone" placeholder="-없이 입력해주세요" value="${ user_phone}"required />
            </div>

            <!-- 스킬 섹션 -->
            <div class="input-container">
                <div class="skill-category">백엔드</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '백엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="skill-category">프론트엔드</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '프론트엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="skill-category">데이터베이스</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '데이터베이스'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="skill-category">모바일</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '모바일'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="skill-category">협업툴</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '협업툴'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <!-- 지역 및 주소 -->
            <div class="input-container">
                <div class="address-container">
                    <label>지역</label>
                    <select name="region_idx">
                        <c:forEach var="region" items="${regionList}">
                            <option value="${region.region_idx}">${region.region_name}</option>
                        </c:forEach>
                    </select>
                    <label>상세주소</label>
                    <input type="text" name="company_address" />
                </div>
            </div>

            <!-- 자소서 -->
            <div class="form-group">
                <label><span class="red">*</span> 자소서</label>
                <textarea name="user_content" required></textarea>
            </div>

            <div>
       <input type="button" value="목록" id="goList" />
            </div>
        </form>
    </main>

    <script>
    const  goList = document.getElementById('goList')
    goList.onclick = function() {
       location.href = '/Users/List'
    } 
    // 서버에서 전달된 error 메시지가 있을 경우 alert로 출력
    <% if (request.getAttribute("error") != null) { %>
      alert("request.getAttribute("error")");
    <% } %>
    </script>
</body>
</html>
