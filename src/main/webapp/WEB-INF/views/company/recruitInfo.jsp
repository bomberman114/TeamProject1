<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고</title>
        <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet"> 
<style>

        body {
            background-color: #ffffff;
            font-family: "Jua", serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #EBFFEE;
            font-size: 22px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
        }

        .info-box {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 18px;
            padding-bottom: 10px;
           
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
        }

        h1 {
            color: #470065;
            font-size: 35px;
            margin-bottom: 20px;
        }
        
        .info-item {
            font-size: 18px;
            margin: 10px 0;
            text-align: center;
            font-weight: bold;
        }

        .highlight {
            font-weight: bold;
            color: #2e8b57;
        }

        .link-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            max-width: 600px;
            width: 100%;
            margin: 0 auto;
        }

        .link-box {
            flex: 1;
            max-width: 280px;
            background-color: #EBFFEE;
            color: #470065;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin: 10px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
        }

        .link-box:hover {
            background-color: #DFF5E1;
        }

        .button-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #EBFFEE;
            color: #470065;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            margin-top: 10px;
            text-align: center;
            cursor: pointer;
            font-weight: bold;
            border: none;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
        }

        .button-link:hover {
            background-color: #495057;
            color: #ffffff;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: #ffffff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: left;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            
        }

        .no-offers {
            font-size: 18px;
            color: #2e8b57;
            text-align: center;
            margin-top: 20px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            padding: 8px 12px;
            margin: 0 5px;
            background-color: #EBFFEE;
            color: #470065;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .pagination a.active {
            background-color: #470065;
            color: #ffffff;
        }

        .pagination a:hover {
            background-color: #495057;
            color: #ffffff;
        }

        footer {
            text-align: center;
            font-family: "Jua", serif;
            padding-top: 20px;
            margin-top: 20px;
        }
        
        .logo-container {
            margin-top: 20px; 
            margin-bottom: 10px;
            text-align: center;
        }
        
    </style>
</head>
<body>
    <header class="logo-container">
        <a href="/">
    		<img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>

    <div class="link-container">
        <a href="/Company/RecruitInfo" class="link-box">채용 공고 관리</a>
        <a href="/Company/Info" class="link-box">내 정보</a>
        <a href="/Company/RecruitWriteForm" class="link-box">채용 공고 등록</a>
    </div>
		 
    <div class="container">
    <h1>채용 공고 관리</h1>
        <div class="info-box">
         	<p></p>
            회사 이름 : <span class="highlight">${ companyUserVo.company_name }</span>&nbsp;&nbsp;    
            회사 아이디 : <span class="highlight">${ companyUserVo.company_id }</span>
            <p class="info-item">내가 올린 채용 공고: <span class="highlight">${recruitCount}</span> 개</p>
            <p></p>
        </div>

    <c:if test="${ not empty companyRecruitList }">
        <ul>
            <c:forEach var="recruit" items="${ companyRecruitList }" varStatus="status">
                <li>
                    <p>번호 : ${status.index + 1} 번</p>
                    <p>제목 : ${ recruit.recruit_title }</p>
                    <p>날짜 : ${ recruit.company_recruit_regdate }</p>
                    <a href="/Company/OneRecruit?company_recruit_idx=${recruit.company_recruit_idx}" class="button-link">상세 보기</a>
                </li>
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
    <footer>    
        <p>이메일 : help@arabojob.co.kr<br/> Fax : 02-0000-0000(대표)</p>
    </footer>
</body>
</html>