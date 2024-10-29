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
    </style>
    <script type="text/javascript">
    const company_recruit_deletEl =document.getElementById("company_recruit_delet");

    company_recruit_deletEl.addEventListener('click', function(event) {
        event.preventDefault(); // 기본 폼 제출 방지
        alert('삭제');
    });
    </script>
</head>
<body>
	<div class="container">
        <h1>채용 공고</h1>
        <div class="info-box">
            <div class="info-item">공고제목: <span class="highlight">${companyOneRecruit.RECRUIT_TITLE}</span></div>
            <div class="info-item">모집부문: <span class="highlight">${companyOneRecruit.COMPANY_JOB}</span></div>
            <div class="info-item">모집인원: <span class="highlight">${companyOneRecruit.GETMAN}</span></div>
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
            <form action="/DeleteRecruit" method="post" style="display:inline;">
                <input type="hidden" name="company_recruit_idx" value="${companyOneRecruit.COMPANY_RECRUIT_IDX}" />
                <input type="submit" id="company_recruit_delet"  class="button" value="삭제">
            </form>
    	</div>
	</div>
</body>
</html>
