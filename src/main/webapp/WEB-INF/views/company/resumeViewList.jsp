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
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet">    
    <style>
        body {
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            text-align: center;
            font-family: "Jua", serif; /* 기존 스타일에 맞춰 폰트 변경 */
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
            background-color: #EBFFEE; /* 기존 스타일 유지 */
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            font-weight: bold;
        }

        .info-box {
            background-color: #ffffff; /* 기존 스타일 유지 */
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15); 
        }

        h1 {
            color: #470065; /* 제목 색상 변경 */
            font-size: 35px;
            margin-bottom: 20px;
        }

        h2 {
            color: #2e8b57; /* 제목 색상 변경 */
            font-size: 28px;
            margin-bottom: 20px;
        }

        .info-item {
            font-size: 18px;
            margin: 10px 0;
            text-align: center; /* 왼쪽 정렬 */
            margin-left: 30px; /* 기존 스타일 유지 */
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
            background-color: #FFFFFF;
            border: 10px solid #ffffff;
            padding: 10px;
            margin-bottom: 5px;
            border-radius: 5px;
             box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15); 
           
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
            margin: 20px 0; /* 박스와의 간격 조정 */
        }

        .link-box {
            background-color: #ffffff;
            color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            width: 200px;
            margin: 10px;
            cursor: pointer;
            text-decoration: none;
         
        }

        .link-box:hover {
            background-color: #DFF5E1; /* 호버 시 색상 변경 */
        }

        footer {
            text-align: center;
            font-family: "Jua", serif;
            margin-top: 20px; /* 하단 여백 추가 */
        }
    </style>
</head>
<body>
    <header class="logo-container">
        <a href="/">
            <img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>

    <div class="container">
        <div class="info-box">
            <h2>회사 정보</h2>
            <p>회사 이름: <span class="highlight">${ companyUserVo.company_name }</span></p>
            <p>회사 아이디: <span class="highlight">${ companyUserVo.company_id }</span></p>
        </div>

        <div class="info-box">
            <h1>채용 공고 이력서 관리</h1>
            <p class="info-item">현받은 이력서 갯수: <span class="highlight">${recruitCount}</span> 개</p>
        </div>

        <c:if test="${ not empty recruitResumeList }">
            <ul>
                <c:forEach var="resume" items="${ recruitResumeList }">
                    <li>
                        <span><a href="/Company/OneResumeView?user_resume_idx=${resume.USER_RESUME_IDX}&company_recruit_idx=${resume.COMPANY_RECRUIT_IDX}">이력서 제목: ${ resume.USER_TITLE }</a><br>
                        이력서 상태: ${resume.APPLICATION_STATUS}<br>
                        이력서 넣은 날짜: ${ resume.USER_RESUME_REGDATE }</span>
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${ empty recruitResumeList }">
            <p class="no-offers">내가 받은 이력서가 없습니다</p>
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
        <span>이메일 : help@arabojob.co.kr<br/> Fax : 02-0000-0000(대표)</span><br/>
    </footer>
</body>
</html>
