<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보</title>
    <style>
    body {
    background-color: #ffffff;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
	}

	.header {
    background-color: #ffffff;
    color: black;
    padding: 20px;
    text-align: center;
    font-size: 24px;
    font-weight: bold;
	}

	.container {
    max-width: 1000px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
	}

	.info-box {
    background-color: #e6ffe6;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    border: 1px solid #b3ffb3;
	}

	h1 {
    color: #2e8b57;
    text-align: center;
    font-size: 28px;
    margin-bottom: 20px;
	}

	.info-item {
    font-size: 18px;
    margin: 10px 0;
    text-align: left;
    margin-left: 30px;
    font-weight: bold;
	}

	.highlight {
    font-weight: bold;
    color: #2e8b57;
	}

	/* 링크 박스가 컨테이너 밖에 위치하게 수정 */
	.link-container {
    display: flex;
    justify-content: center;
    margin-bottom: 0px;
    margin-top: 20px; /* 박스와의 간격 조정 */
	}

	.link-box {
    background-color: #EBFFEE;
    color: green;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    width: 200px;
    margin: 10px;
    cursor: pointer;
    text-decoration: none;
    border: 1px solid;
	}

	.link-box:hover {
    background-color: #EBFFEE;
	}

	.no-offers {
    font-size: 18px;
    color: #2e8b57;
    text-align: center;
    margin-top: 20px;
	}

	button {
	margin :0;
	padding :0.5rem 1rem;
	display :inline-block;
	width   :auto;
	border  :none;
	border-radius : 4px;
	background-color: #EBFFEE;
	border: 1px solid;
	
	}

	</style>
</head>
<body>
    <!-- 링크 박스를 컨테이너 위로 이동 -->
    <div class="link-container">
        <a href="/Company/RecruitInfo" class="link-box">우리회사의 채용공고</a>
        <a href="/Company/Info" class="link-box">내 정보</a>
    </div>

    <div class="header"></div>

    <!-- "내 회사 정보" 컨테이너 -->
    <div class="container">
        <h1>내 회사 정보</h1>

        <div class="info-box">
            <div class="info-item">회사 ID: <span class="highlight">${companyUserVo.company_id}</span></div>
            <div class="info-item">회사 이름: <span class="highlight">${companyUserVo.company_name}</span></div>
            <div class="info-item">대표자: <span class="highlight">${companyUserVo.company_boss_name}</span></div>
            <div class="info-item">전화번호: <span class="highlight">${companyUserVo.company_phone}</span></div>
            <div class="info-item">이메일: <span class="highlight">${companyUserVo.company_email}</span></div>
            <div class="info-item">설립일: <span class="highlight">${companyUserVo.company_establish}</span></div>
            <div class="info-item">등록일: <span class="highlight">${companyUserVo.company_regdate}</span></div>
        </div>
           <form action="/Company/InfoEdit" method="get">
        <button type="submit" name="upDate">수정</button>
    </form>
    </div>
</body>
</html>