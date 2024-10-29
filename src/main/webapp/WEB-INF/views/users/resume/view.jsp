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
 	    html, body {
	    height: 100%; /* 전체 높이를 100%로 설정 */
	    margin: 0;
		}

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
		    max-height: 90vh; /* 최대 높이를 90vh로 설정 */
		    overflow-y: auto; /* 세로 스크롤 가능하게 설정 */
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
        
		.skill-category:first-line {
			border-top:2px solid black; 
		    font-weight: bold;
		    color: #6A5ACD;
		}
		
/* 		.skill-item {
		    border-bottom: 2px solid black; 
		    margin-bottom: 10px;
		    padding-bottom: 10px;
		} */

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
        <h2>내 이력서</h2>
         <input type="hidden" name="user_id" value="${user_id}">
         <input type="hidden" name="user_resume_idx" value="${userResume.user_resume_idx}">
            <div class="form-group">
            	<label>이력서 제목</label>
                <input type="text" name="user_title" value = "${userResume.user_title}"readonly />
            </div>
            <div class="form-group">
                <label> 이름</label>
                <input type="text" name="user_name" value = "${userResume.user_name}" readonly/>
            </div>
            <div class="form-group">
                <label> 생일</label>
                <input type="text" name="user_birth" value ="${userResume.user_birth}" readonly/>
            </div>
            <div class="form-group">
                <label> 이메일</label>
                <input type="email" name="user_email" value="${userResume.user_email}" readonly/>
            </div>
            <div class="form-group">
                <label> 연락처</label>
                <input type="text" name="user_phone" placeholder="-없이 입력해주세요" value="${userResume.user_phone}" readonly/>
            </div>

			<!-- 스킬 섹션 -->
			<div class="input-container">
			    <label> 사용 스킬</label>
			    <c:forEach var="skill" items="${selectedSkills}">
			        <c:if test="${skill.skill_stack != previousSkillStack}">
			            <div class="skill-category">${skill.skill_stack}</div>
					    <c:set var="previousSkillStack" value="${skill.skill_stack}" />
					</c:if>
					        <div class="skill-item">
					            <label for="skill_name_${skill.skill_name}">${skill.skill_name}</label>
					        </div>
			    </c:forEach>
			</div>
				
            <!-- 지역 및 주소 -->
            <div class="input-container">
                <div class="address-container">
                    <label>근무 희망 지역</label>
                    <select name="region_idx" class="readonly" onChange="this.selectedIndex = this.initialSelect;">
                        <c:forEach var="region" items="${regionList}">
                            <option value="${userResume.region_idx}">${region.region_name}</option>
                        </c:forEach>
                    </select>
                    <label>거주지 상세 주소</label>
                    <div class="form-group">
                	<input type="text" name="region_address" id="roadFullAddr" value="${userResume.region_address}" readonly/>
                    </div>
                </div>
            </div>
            <!-- 자소서 -->
            <div class="form-group">
                <label>자소서</label>
                <textarea name="user_intro" readonly>${userResume.user_intro}</textarea>
            </div>

            <div>
       			<a href="/Resume/DeleteResume?user_id=${userLogin.user_id}&user_resume_idx=${userResume.user_resume_idx}">이력서 삭제하기</a>
       			<a href="/Resume/UpdateResumeForm?user_id=${userLogin.user_id}&user_resume_idx=${userResume.user_resume_idx}">이력서 수정하기</a>
       			<a href="/Resume/ResumeList?user_id=${userLogin.user_id}">이력서 목록</a>
            </div>
    </main>

</body>
</html>
