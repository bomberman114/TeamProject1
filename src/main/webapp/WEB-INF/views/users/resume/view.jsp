<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이력서 정보 확인</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
		html, body {
		    height: 100%; /* 전체 높이를 100%로 설정 */
		    margin: 0;
		}
		
		body {
		    font-family: 'Arial', sans-serif;
		    background-color: #EBFFEE; /* 배경색 */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		}
		
		main {
		    max-height: 90vh; /* 최대 높이를 90vh로 설정 */
		    overflow-y: auto; /* 세로 스크롤 가능하게 설정 */
		    background-color: #ffffff; /* 흰색 배경 */
		    padding: 40px;
		    border-radius: 15px;
		    box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
		    width: 100%;
		    max-width: 900px;
		}
		
		h2 {
		    font-size: 30px;
		    text-align: center;
		    margin-bottom: 30px;
		    color: #470065; /* 제목 색상 */
		}
		
		label {
		    font-weight: bold;
		    margin-bottom: 5px;
		    color: #333; /* 검은색 텍스트 */
		}
		
		input[type="text"], input[type="password"], input[type="email"], textarea, select {
		    width: 100%;
		    padding: 12px;
		    border: 1px solid #ccc; /* 연한 회색 테두리 */
		    border-radius: 8px;
		    transition: border-color 0.3s, box-shadow 0.3s;
		}
		
		input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus, textarea:focus, select:focus {
		    border-color: #470065; /* 포커스 시 테두리 색상 */
		    box-shadow: 0 0 8px rgba(71, 0, 101, 0.5);
		}
		
		textarea {
		    height: 150px;
		    resize: vertical;
		}
		
		button, input[type="submit"] {
		    background-color: #470065; /* 버튼 색상 */
		    color: white; /* 흰색 텍스트 */
		    border: none;
		    padding: 14px;
		    border-radius: 8px;
		    cursor: pointer;
		    font-size: 16px;
		    transition: background-color 0.3s;
		    width: 100%;
		}
		
		button:hover, input[type="submit"]:hover {
		    background-color: #333; /* 호버 시 어두운 색상 */
		}
		
		.input-container, .checkbox-group, .form-group {
		    margin-bottom: 20px;
		}
		
		.skill-category {
		    border-top: 2px solid #470065; /* 위쪽에 선 추가 */
		    font-weight: bold;
		    color: #470065;
		    padding-top: 10px; /* 선과 텍스트 사이의 여백 */
		    margin-top: 20px; /* 카테고리와 위쪽 요소 간 여백 */
		}
		
		.skill-item {
		    font-weight: lighter;
		    font-size: 12px;
		    color: #333; /* 검은색 텍스트 */
		}
		
		.skill-item:last-child {
		    margin-bottom: 10px;
		    padding-bottom: 10px;
		}
		
		.address-container input {
		    margin-top: 10px;
		}
		
		/* 링크 스타일 */
		a {
		    color: #470065; /* 링크 색상 */
		    text-decoration: none; /* 밑줄 제거 */
		    font-weight: bold; /* 링크 텍스트 굵게 */
		    display: block; /* 블록 요소로 변경하여 여백 추가 */
		    margin: 10px 0; /* 여백 추가 */
		}
		
		a:hover {
		    color: #333; /* 호버 시 색상 변경 */
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
            <input type="text" name="user_title" value="${userResume.user_title}" readonly />
        </div>
        <div class="form-group">
            <label>이름</label>
            <input type="text" name="user_name" value="${userResume.user_name}" readonly />
        </div>
        <div class="form-group">
            <label>생일</label>
            <input type="text" name="user_birth" value="${userResume.user_birth}" readonly />
        </div>
        <div class="form-group">
            <label>이메일</label>
            <input type="email" name="user_email" value="${userResume.user_email}" readonly />
        </div>
        <div class="form-group">
            <label>연락처</label>
            <input type="text" name="user_phone" placeholder="-없이 입력해주세요" value="${userResume.user_phone}" readonly />
        </div>

        <!-- 스킬 섹션 -->
        <div class="input-container">
            <label>사용 스킬</label>
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
                    <input type="text" name="region_address" id="roadFullAddr" value="${userResume.region_address}" readonly />
                </div>
            </div>
        </div>
        <!-- 자소서 -->
        <div class="form-group">
            <label>자소서</label>
            <textarea name="user_intro" readonly>${userResume.user_intro}</textarea>
        </div>

        <div>
            <a href="/Resume/UpdateResumeForm?user_id=${userLogin.user_id}&user_resume_idx=${userResume.user_resume_idx}">이력서 수정하기</a>
            <a href="/Resume/ResumeList?user_id=${userLogin.user_id}">이력서 목록</a>
            <a href="/Resume/DeleteResume?user_id=${userLogin.user_id}&user_resume_idx=${userResume.user_resume_idx}">이력서 삭제하기</a>
        </div>
    </main>


</body>
</html>
