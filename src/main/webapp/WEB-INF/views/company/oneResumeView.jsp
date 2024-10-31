<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고 상세화면</title>
        <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <style>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background-color: #EBFFEE;;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        font-weight: bold;
    }

    h1 {
        font-size: 48px;
        margin-bottom: 40px;
        font-weight: bold;
        color : green;
      
    }

    .info-box {
        margin-bottom: 20px;
    }

    .info-item {
        margin-bottom: 10px;
    }

    .highlight {
        color: black;
        font-weight: bold;
        font-size : 24px;
    }

    .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #343a40;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-size: 16px;
        margin-right: 10px;
        text-align: center;
        cursor: pointer;
    }

    .button:hover {
        background-color: #495057;
    }

    .action-buttons {
        margin-top: 20px;
        text-align: center;
    }
    
  
</style>
    
    

    <script type="text/javascript">
    </script>

</head>
<body>
	<div class="container">
        <h1>채용 공고 이력서 확인</h1>
        <div class="info-box">

            <div class="info-item">이력서제목: <span class="highlight">${resumeResponMap.USER_TITLE}</span></div>
            <div class="info-item">이메일: <span class="highlight">${resumeResponMap.USER_EMAIL}</span></div>
            <div class="info-item">지원자 이름: <span class="highlight">${resumeResponMap.USER_NAME}</span></div>
            <div class="info-item">지원자 휴대폰번호: <span class="highlight">${resumeResponMap.USER_PHONE}</span></div>
            <div class="info-item">지원자 나이: <span class="highlight">${resumeResponMap.USER_BIRTH}</span></div>
            <c:if test="${ resumeResponMap.SKILL_NAME ne null }">
            	<div class="info-item">스킬: <br><span class="highlight">${ resumeResponMap.SKILL_NAME }</span></div>
            </c:if>
            <c:if test="${ resumeResponMap.SKILL_NAME eq null }">
            	<div class="info-item">스킬: <span class="highlight">없음</span></div>
            </c:if>
            <div class="info-item">지역: <span class="highlight">${resumeResponMap.REGION_NAME}</span></div>
            <div class="info-item">상세주소: <br><span class="highlight">${resumeResponMap.REGION_ADDRESS}</span></div>
            <div class="info-item">자소서: <br><span class="highlight">${resumeResponMap.USER_INTRO}</span></div>
            <div class="info-item">지원일자  : <span class="highlight">${resumeResponMap.APPLIED_DATE}</span></div>
            <div class="info-item">현재지원상태  : <span class="highlight">${resumeResponMap.APPLICATION_STATUS}</span></div>
        </div>
        
         <div class="action-buttons">
            <form action="/Company/ChangeApplicationStatus" method="post" style="display:inline;">
			    <input type="hidden" name="applications_idx" value="${resumeResponMap.APPLICATIONS_IDX}" />
			    <input type="hidden" name="user_resume_idx" value="${resumeResponMap.USER_RESUME_IDX}" />
			    <input type="hidden" name="company_recruit_idx" value="${resumeResponMap.COMPANY_RECRUIT_IDX}" />
			    
			    <div class="info-item">지원상태 변경:</div>
			    <label><input type="radio" name="application_status" value="서류검토중"
			     <c:if test="${resumeResponMap.APPLICATION_STATUS == '서류검토중'}">checked</c:if>>
			     서류검토중</label><br>
			    <label><input type="radio" name="application_status" value="면접중"
			    <c:if test="${resumeResponMap.APPLICATION_STATUS == '면접중'}">checked</c:if>>
			     면접중</label><br>
			    <label><input type="radio" name="application_status" value="합격"
			    <c:if test="${resumeResponMap.APPLICATION_STATUS == '합격'}">checked</c:if>>
			     합격</label><br>
			    <label><input type="radio" name="application_status" value="불합격"
			     <c:if test="${resumeResponMap.APPLICATION_STATUS == '불합격'}">checked</c:if>>
			     불합격</label><br>
			    <br>
			    <input type="submit" class="button" value="지원상태 수정">
			</form>
    	</div>
	</div>
</body>
</html>
