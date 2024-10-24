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
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            text-align : center;
        }

        .header {
            background-color: #2e8b57;
            color: white;
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
            text-align: center;
        }

        .highlight {
            font-weight: bold;
            color: #2e8b57;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: #e6ffe6;
            border: 1px solid #b3ffb3;
            padding: 10px;
            margin-bottom: 5px;
            border-radius: 5px;
        }

        .no-offers {
            font-size: 18px;
            color: #2e8b57;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">내 회사 정보</div>
    <div class="container">
        <h1>회사 정보</h1>
        <div class="info-box">
            <div class="info-item">회사 ID: <span class="highlight">${companyUser.companyId}</span></div>
            <div class="info-item">회사 이름: <span class="highlight">${companyUser.companyName}</span></div>
            <div class="info-item">대표자: <span class="highlight">${companyUser.companyBossName}</span></div>
            <div class="info-item">전화번호: <span class="highlight">${companyUser.companyPhone}</span></div>
            <div class="info-item">이메일: <span class="highlight">${companyUser.companyEmail}</span></div>
            <div class="info-item">설립일: <span class="highlight">${companyUser.companyEstablish}</span></div>
            <div class="info-item">등록일: <span class="highlight">${companyUser.companyRegDate}</span></div>
        </div>
    </div>
</body>
</html>