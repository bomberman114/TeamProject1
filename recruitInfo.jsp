<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고</title>
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .header {
            background-color: #71f0a9;
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
            font-weight: bold;
        }

        .info-box {
            background-color: #EBFFEE;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 10px solid #ffffff;
        }

        h1 {
            color: #2e8b57;
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
            background-color: #EBFFEE;
            border: 1px solid #ffffff;
            padding: 15px;
            margin-bottom: 5px;
            border-radius: 5px;
            text-align: center;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .btn-details {
            background-color: #2e8b57;
        }

        .btn-delete {
            background-color: #ff4d4d;
        }
        
        /* Link box styling */
        .link-container {
            display: flex;
            justify-content: center;
            margin-bottom: 0px;
            margin-top: 20px;
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
    </style>
</head>

<body>
    <!-- Link Container for Navigation -->
    <div class="link-container">
        <a href="/Company/Info" class="link-box">내 정보</a>
        <a href="/Company/RecruitInfo" class="link-box">우리회사의 채용공고</a>
    </div>

    <!-- Recruitment Management Section -->
    <div class="container">
        <div class="info-box">
            <h1>채용 공고 관리</h1>
            <p class="info-item">내가 올린 채용 공고: <span class="highlight">${recruitCount}</span> 개</p>
        </div>

        <c:if test="${ not empty companyRecruitList }">
            <ul>
                <c:forEach var="recruit" items="${ companyRecruitList }">
                    <li>
                        <p>채용 공고 제목: ${ recruit.recruit_title }</p>
                        <p>채용 공고 날짜: ${ recruit.company_recruit_regdate }</p>
                        <div class="buttons">
                            <!-- Detail and Delete buttons -->
                            <a href="/Company/OneRecruit?company_recruit_idx=${recruit.company_recruit_idx}" class="btn btn-details">상세보기</a>
                            <a href="/Company/DeleteRecruit?company_recruit_idx=${recruit.company_recruit_idx}" class="btn btn-delete" onclick="return confirm('채용 공고를 삭제하시겠습니까?')">삭제</a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${ empty companyRecruitList }">
            <p class="no-offers">내가 올린 채용 공고가 없습니다</p>
        </c:if>
    </div>
</body>	
</html>
