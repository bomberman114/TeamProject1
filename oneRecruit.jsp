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
</head>
<body>
	<div class="container">
        <h1>채용 공고</h1>
        <div class="info-box">
            <div class="info-item">공고제목: <span class="highlight">${companyRecruitVo.recruit_title}</span></div>
            <div class="info-item">모집부문: <span class="highlight">${companyRecruitVo.company_job}</span></div>
            <div class="info-item">모집인원: <span class="highlight">${companyRecruitVo.getman}</span></div>
            <div class="info-item">모집지역: <span class="highlight">${companyRecruitVo.region_idx}</span></div>
            <div class="info-item">상세주소: <span class="highlight">${companyRecruitVo.company_address}</span></div>
            <div class="info-item">회사정보: <span class="highlight">${companyRecruitVo.company_info}</span></div>
            <div class="info-item">회사이름: <span class="highlight">${companyRecruitVo.company_name}</span></div>
           
            <div class="info-item">마감기한: <span class="highlight">${companyRecruitVo.application_deadline}</span></div>
            <div class="info-item">설립일  : <span class="highlight">${companyRecruitVo.company_establish}</span></div>
            <div class="info-item">등록일  : <span class="highlight">${companyRecruitVo.company_recruit_regdate}</span></div>
            <div class="info-item">조회수  : <span class="highlight">${companyRecruitVo.views}</span></div>
          
        </div>
        
         <div class="action-buttons">
            <a href="/EditRecruit?company_recruit_idx=${companyRecruitVo.company_recruit_idx}" class="button">수정</a>
            <form action="/DeleteRecruit" method="post" style="display:inline;">
                <input type="hidden" name="company_recruit_idx" value="${companyRecruitVo.company_recruit_idx}" />
                <button type="submit" class="button">삭제</button>
            </form>
    	</div>
	</div>
</body>
</html>
