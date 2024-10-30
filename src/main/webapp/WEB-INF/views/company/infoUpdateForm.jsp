<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보 수정</title>
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
            text-align: center;
        }

        .info-box {
            background-color: #e6ffe6;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #b3ffb3;
            font-weight: bold;
            font-size: 18px;
            text-align: left;
        }

        h1 {
            color: #2e8b57;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .info-item {
            font-size: 18px;
            margin: 10px 0;
            margin-left: 30px;
            font-weight: bold;
            text-align: left;
        }

        .highlight {
            color: #2e8b57;
        }

        .link-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .link-box {
            background-color: #EBFFEE;
            color: green;
            padding: 20px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            width: 200px;
            margin: 10px;
            text-align: center;
            text-decoration: none;
            border: 1px solid;
            cursor: pointer;
        }

        .link-box:hover {
            background-color: #DFF5E1;
        }

        .no-offers {
            font-size: 18px;
            color: #2e8b57;
            margin-top: 20px;
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

        form {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
    <h1>회사 정보 수정</h1>
        <div class="info-box">
        <form action="/Company/InfoUpdate" method="POST">
                <div class="info-item">회사 ID: <input type="text" name="company_id" value="${companyUserVo.company_id}" readonly /></div>
                <div class="info-item">회사 이름: <input type="text" name="company_name" value="${companyUserVo.company_name}" /></div>
                <div class="info-item">대표자: <input type="text" name="company_boss_name" value="${companyUserVo.company_boss_name}" /></div>
                <div class="info-item">전화번호: <input type="text" name="company_phone" value="${companyUserVo.company_phone}" /></div>
                <div class="info-item">이메일: <input type="text" name="company_email" value="${companyUserVo.company_email}" /></div>
                <div class="info-item">설립일: <input type="text" name="company_establish" value="${companyUserVo.company_establish}" /></div>
                <div class="info-item">등록일: <input type="text" name="company_regdate" value="${companyUserVo.company_regdate}" readonly /></div>
                <input type="submit" class="button" value="저장" />
            </form>
        </div>
    </div>
</body>
</html>