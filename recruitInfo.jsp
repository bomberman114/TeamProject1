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
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            background-color: #ffffff;
        }
        
        h2 {
        	color:green;
         	font-size: 40px;
        
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
            border: 10px solid #ffffff;
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

        /* 버튼 스타일 추가 */
        .button-link {
           background-color: #EBFFEE;
            color: green;
            padding: 10px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            width: 70px;
            margin: 10px;
            text-decoration: none;
            border: 1px solid;
            cursor: pointer;
        }

        .button-link:hover {
            background-color: #1c5f40;
        }
    </style>
</head>
<body>
    <!-- 링크 박스를 컨테이너 위로 이동 -->
    <div class="link-container">
        <a href="/Company/Info" class="link-box">내 정보</a>
        <a href="/Company/RecruitInfo" class="link-box">우리회사의 채용공고</a>
    </div>

    <div class="container">
        <div class="info-box">

            회사 이름:<span class="highlight">${ companyUserVo.company_name }</span>    
            회사 아이디:<span class="highlight">${ companyUserVo.company_id }</span>
        </div>

        <div class="info-box">
            <h1>채용 공고 관리</h1>
            <p class="info-item">내가 올린 채용 공고: <span class="highlight">${recruitCount}</span> 개 </p>
        </div>

        <c:if test="${ not empty companyRecruitList }">
            <ul>
                <c:forEach var="recruit" items="${ companyRecruitList }">
                    <li>
                        <span>
                            <!-- 채용공고 제목 링크 -->
                           
                                채용 공고 제목: ${ recruit.recruit_title }
                            </a><br><br>
                            
                            <!-- 채용공고 날짜 -->
                            채용 공고 날짜: ${ recruit.company_recruit_regdate }<br><br/>
                            
                            <!-- 버튼 타입의 링크 추가 -->
                            <a href="/Company/OneRecruit?company_recruit_idx=${recruit.company_recruit_idx}" class="button-link">상세 보기</a>
                            <p> </p>
                        </span>
                    </li>
                    <br/>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${ empty companyRecruitList }">
            <p class="no-offers">내가 올린 채용 공고가 없습니다</p>
        </c:if>

        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?nowpage=${currentPage - 1}&pageSize=${pageSize}">이전</a>
            </c:if>

            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="?nowpage=${i}&pageSize=${pageSize}" class="${i == currentPage ? 'active' : ''}">${i}</a>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="?nowpage=${currentPage + 1}&pageSize=${pageSize}">다음</a>
            </c:if>
        </div>
    </div>
</body>
</html>
