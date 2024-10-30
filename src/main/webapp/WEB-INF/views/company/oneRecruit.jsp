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
    }
    
  
</style>



</head>
<body>
 <header style="display: flex; justify-content: center; margin-bottom: 20px;">
    <a href="/Company/RecruitInfo">
        <img src="\css\NEXT.png" alt="사이트 로고" style="height: 15em;">
    </a>
</header>
	<div class="container">
        <h1>채용 공고</h1>
        <div class="info-box">
            <div class="info-item">공고제목: <span class="highlight">${companyOneRecruit.RECRUIT_TITLE}</span></div>
            <div class="info-item">모집부문: <span class="highlight">${companyOneRecruit.COMPANY_JOB}</span></div>
            <div class="info-item">모집인원: <span class="highlight">${companyOneRecruit.GETMAN}</span></div>
            <c:if test="${ companyOneRecruit.SKILL_NAME ne null }">
            	<div class="info-item">스킬: <span class="highlight">${ companyOneRecruit.SKILL_NAME }</span></div>
            </c:if>
            <c:if test="${ companyOneRecruit.SKILL_NAME eq null }">
            	<div class="info-item">스킬: <span class="highlight">없음</span></div>
            </c:if>
            <div class="info-item">모집지역: <span class="highlight">${companyOneRecruit.REGION_NAME}</span></div>
            <div class="info-item">상세주소: <span class="highlight">${companyOneRecruit.COMPANY_ADDRESS}</span></div>
            <div class="info-item">회사정보: <span class="highlight">${companyOneRecruit.COMPANY_INFO}</span></div>
            <div class="info-item">회사이름: <span class="highlight">${companyOneRecruit.COMPANY_NAME}</span></div>
            <div class="info-item">마감기한: <span class="highlight">${companyOneRecruit.APPLICATION_DEADLINE}</span></div>
            <div class="info-item">설립일  : <span class="highlight">${companyOneRecruit.COMPANY_ESTABLISH}</span></div>
            <div class="info-item">등록일  : <span class="highlight">${companyOneRecruit.COMPANY_RECRUIT_REGDATE}</span></div>
            <div class="info-item">조회수  : <span class="highlight">${companyOneRecruit.VIEWS}</span></div>
        </div>
        
        <div class="action-buttons">
            <a href="/Company/RecruitUpdateForm?company_recruit_idx=${companyOneRecruit.COMPANY_RECRUIT_IDX}" class="button">수정</a>
            <form action="/Company/DeleteRecruit" method="post" style="display:inline;">
                <input type="hidden" name="company_recruit_idx" value="${companyOneRecruit.COMPANY_RECRUIT_IDX}" />
                <input type="submit" id="company_recruit_delet" class="button" value="삭제">
            </form>
        </div>
	</div>
</body>
</html>
