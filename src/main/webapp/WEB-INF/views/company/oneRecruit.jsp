<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고</title>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 
    <style>
        body {
            background-color: #ffffff;
            font-family: "Jua", sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #EBFFEE;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            font-weight: bold;
            font-size: 22px;
        }

        .info-box {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 18px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
            text-align: left;
        }

        h1 {
            color: #470065;
            font-size: 35px;
            margin-bottom: 20px;
        }

        .info-item {
            font-size: 18px;
            margin: 10px 0;
            font-weight: bold;
            text-align: left;
        }

        .highlight {
            font-weight: bold;
            color: #2e8b57;
        }

        /* 공통 버튼 스타일: a와 button에 동일 적용 */
        .button,
        .button-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #EBFFEE;
            color: #470065;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            font-weight: bold;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
            text-align: center;
            border: none;  /* 버튼 테두리 제거 */
            font-family: "Jua", sans-serif;  /* 동일한 폰트 */
        }

        .button:hover,
        .button-link:hover {
            background-color: #495057;
            color: #ffffff;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .logo-container {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .logo-container img {
            height: 80px;
        }

        footer {
            text-align: center;
            font-family: "Jua", sans-serif;
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header class="logo-container">
        <a href="/Company/RecruitInfo">
    		<img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
    <div class="container">
        <h1>채용 공고</h1>
        <div class="info-box">
            <div class="info-item">공고제목: <span class="highlight">${companyOneRecruit.RECRUIT_TITLE}</span></div>
            <div class="info-item">모집부문: <span class="highlight">${companyOneRecruit.COMPANY_JOB}</span></div>
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
            <div class="info-item">설립일: <span class="highlight">${companyOneRecruit.COMPANY_ESTABLISH}</span></div>
            <div class="info-item">등록일: <span class="highlight">${companyOneRecruit.COMPANY_RECRUIT_REGDATE}</span></div>
            <div class="info-item">조회수: <span class="highlight">${companyOneRecruit.VIEWS}</span></div>
               <div class="action-buttons">
            <a href="/Company/RecruitUpdateForm?company_recruit_idx=${companyOneRecruit.COMPANY_RECRUIT_IDX}" class="button">수정</a>
            <form action="/Company/DeleteRecruit" method="post" style="display:inline;">
                <input type="hidden" name="company_recruit_idx" value="${companyOneRecruit.COMPANY_RECRUIT_IDX}">
                <input type="submit" class="button" value="삭제">
        </div>
  
            </form>
        </div>
    </div>

    <footer>
        <p>이메일 : help@arabojob.co.kr | Fax : 02-0000-0000(대표)</p>
    </footer>
</body>
</html>