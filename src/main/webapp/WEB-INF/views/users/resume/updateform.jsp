<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet"> 
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: "Jua", serif;
            font-size: bold;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        main {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
            width: 50%;
            max-width: 600px;
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
            gap: 5px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"], input[type="email"], textarea, select {
            width: 100%; /* 모든 인풋 박스 너비를 100%로 설정 */
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
    </style>
</head>
<body>
    <main>
        <h2>이력서 수정하기</h2>
        <form action="/Resume/UpdateResume?user_resume_idx=${userResume.user_resume_idx}" method="POST" id="form">
            <input type="hidden" name="user_id" value="${userResume.user_id}">
            <input type="hidden" name="user_resume_idx" value="${userResume.user_resume_idx}">
            <div class="form-group">
                <label>이력서 제목</label>
                <input type="text" name="user_title" value="${userResume.user_title}" required />
            </div>
            <div class="form-group">
                <label><span class="red">*</span> 이름</label>
                <input type="text" name="user_name" value="${userResume.user_name}" readonly />
            </div>
            <div class="form-group">
                <label><span class="red">*</span>생일</label>
                <input type="date" id="dateInput" />
                <input type="text" name="user_birth" id="textOutput" value="${userResume.user_birth}" placeholder="YYYY-MM-DD" required />
            </div>
            <div class="form-group">
                <label><span class="red">*</span>이메일</label>
                <input type="email" id="user_email" name="user_email" value="${userResume.user_email}" placeholder="이메일 입력" required />
                <select id="email_domain" onchange="updateEmail()">
                    <option value="" selected>직접입력</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="naver.com">naver.com</option>
                    <option value="kakao.com">kakao.com</option>
                    <option value="yahoo.com">yahoo.com</option>
                    <option value="outlook.com">outlook.com</option>
                    <option value="green.com">green.com</option>
                </select>
            </div>
            <div class="form-group">
                <label><span class="red">*</span> 연락처</label>
                <input type="text" name="user_phone" value="${userResume.user_phone}" readonly />
            </div>

            <!-- 스킬 섹션 -->
            <div class="input-container"><span class="red">*</span>사용 스킬
                <div class="skill-category">백엔드</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '백엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" 
                                       <c:if test="${fn:contains(selectedSkills, skillList.skill_name)}">checked</c:if> />
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
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" 
                                       <c:if test="${fn:contains(selectedSkills, skillList.skill_name)}">checked</c:if> />
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
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" 
                                       <c:if test="${fn:contains(selectedSkills, skillList.skill_name)}">checked</c:if> />
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
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" 
                                       <c:if test="${fn:contains(selectedSkills, skillList.skill_name)}">checked</c:if> />
                             
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
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" 
                                       <c:if test="${fn:contains(selectedSkills, skillList.skill_name)}">checked</c:if> />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

  <!-- 지역 및 주소 -->
<div class="input-container">
    <div class="address-container">
        <label><span class="red">*</span>근무 희망 지역</label>
        <select name="region_idx" style="width: 100%; box-sizing: border-box;"> <!-- box-sizing 추가 -->
            <c:forEach var="region" items="${regionList}">
                <option value="${region.region_idx}">${region.region_name}</option>
            </c:forEach>
        </select>
        <label><span class="red">*</span>거주지 상세 주소</label>
        <div class="form-group">
            <input type="text" name="region_address" id="roadFullAddr" value="${userResume.region_address}" required style="width: 100%; box-sizing: border-box;"/> <!-- box-sizing 추가 -->
        </div>
        <button type="button" onclick="searchAddress()" style="width: 100%; box-sizing: border-box;">주소 검색</button> <!-- box-sizing 추가 -->
    </div>
</div>

<!-- 자소서 -->
<div class="form-group">
    <label><span class="red">*</span> 자소서</label>
    <textarea name="user_intro" required style="width: 100%; box-sizing: border-box;"></textarea> <!-- box-sizing 추가 -->
</div>

<div>
    <input type="submit" value="저장" onclick="return validateCheckbox()" style="width: 100%; box-sizing: border-box;"/> <!-- box-sizing 추가 -->
</div>

        </form>
    </main>

    <script>
        function searchAddress() {
            window.open("/Resume/SearchAddress", "pop", "width = 570, height = 430, scrollbars = yes, resizable = yes");
        }
        function jusoCallBack(roadFullAddr){
            document.getElementById('roadFullAddr').value = roadFullAddr;
        }

        const dateInput = document.getElementById('dateInput');
        const textOutput = document.getElementById('textOutput');

        dateInput.addEventListener('change', function() {
            const selectedDate = new Date(dateInput.value);
            
            const formattedDate = String(selectedDate.getFullYear()) + '년 ' +
                                  String(selectedDate.getMonth() + 1) + '월 ' +
                                  String(selectedDate.getDate()) + '일';

            textOutput.value = formattedDate;
        });

        function updateEmail() {
            var emailInput = document.getElementById('user_email');
            var domainSelect = document.getElementById('email_domain');

            var selectedDomain = domainSelect.value;

            if (selectedDomain) {
                emailInput.value = emailInput.value.split('@')[0] + '@' + selectedDomain;
            } else {
                emailInput.value = emailInput.value.split('@')[0]; // 도메인 제거
            }
        }

        /* 스킬 필수 선택 */
        function validateCheckbox() {
            const checkboxes = document.querySelectorAll('input[name="skill_name"]');
            const isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);

            if (!isChecked) {
                alert("사용 스킬 중 하나 이상을 선택해주세요.");
                return false; // 폼 제출 중단
            }
            return true; // 폼 제출 진행
        }
    </script>
</body>
</html>
                                
