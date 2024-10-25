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

    <div class="header">내가 올린 채용 공고</div>

    <div class="container">
        <div class="info-box">
        	<h2>회사 정보</h2>
        <p>회사 이름:<span class="highlight">${ companyUserVo.company_name }</span></p>
        	<p>회사 아이디:<span class="highlight">${ companyUserVo.company_id }</span>
  
  		<div class="info-box">
            <h1>채용 공고 관리</h1>
            <p class="info-item">내가 올린 채용 공고 수: <span class="highlight">${recruitCount}</span> 개 </p>
				<span class="highlight">페이지 당 개수${fn:length( companyRecruitList) }</span> 개
            </div>
            
            <c:if test="${ not empty companyRecruitList }">
                <ul>
                    <c:forEach var="recruit" items="${ companyRecruitList }">
                        <li>
                        	<span>채용 공고 제목: ${ recruit.recruit_title }<br></br>
                   				  채용 공고 날짜: ${ recruit.company_recruit_regdate }
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
    </div>
</body>
</html>
