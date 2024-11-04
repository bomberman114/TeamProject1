<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인이력서목록</title>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet">  
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <style>
        body {
            font-family: "Jua", serif;
            background-color: #ffffff;/* 배경색 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            margin: 0;
        }

        main {
            background-color: #ffffff; /* 흰색 배경 */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            width: 100%;
            max-width: 900px;
         
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #470065; /* 제목 색상 */
        }

        table {
            width: 100%;
            border-collapse: collapse; /* 테두리 겹침 제거 */
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* 아래쪽 테두리 */
        }

        th {
            background-color: #470065; /* 헤더 배경색 */
            color: white; /* 헤더 텍스트 색상 */
        }

        tr:hover {
            background-color: #f1f1f1; /* 행에 마우스 오버 시 색상 */
        }

        a {
            color: #470065; /* 링크 색상 */
            text-decoration: none; /* 밑줄 제거 */
            font-weight: bold; /* 링크 굵게 */
        }

        a:hover {
            text-decoration: underline; /* 호버 시 밑줄 추가 */
        }

        .new-resume {
            text-align: center; /* 중앙 정렬 */
            margin-top: 20px;
        }

        .new-resume a {
            background-color: #470065; /* 버튼 색상 */
            color: white; /* 버튼 텍스트 색상 */
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .new-resume a:hover {
            background-color: #5A4FCF; /* 호버 시 색상 */
        }
        
        header {
    		text-align: center;
    	 

        }
    </style>
    <script>
        function confirmDeletion(user_title) {
            return confirm("이력서 " + user_title + "을(를) 정말 삭제하시겠습니까?");
        }
        
   
    </script>
<body>
    <header class="logo-container">
        <a href="/">
    		<img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>

    <main style="margin-top: 40px;">  <!-- 여백 추가 --> 
        <h2>내 이력서 목록</h2>
        <input type="hidden" name="user_id" value="${userLogin.user_id}">
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>지원 상태</th>
                    <th>지원일</th>
                    <th>지원공고</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="resume" items="${userResumeList}">
				    <tr>
				        <td>${resume['USER_RESUME_IDX']}</td>
				        <td><a href="/Resume/ViewResume?user_id=${userLogin.user_id}&user_resume_idx=${resume['USER_RESUME_IDX']}">${resume['USER_TITLE']}</a></td>
				        <td>${resume['USER_RESUME_REGDATE']}</td>
				        <td>${resume['APPLICATION_STATUS']}</td>
				        <td>${resume['APPLIED_DATE']}</td>
				        <td><a href="/Common/IncrementView?company_recruit_idx=${resume['COMPANY_RECRUIT_IDX']}">${resume['RECRUIT_TITLE']}</a></td>
				        <td><a href="/Resume/UpdateResumeForm?user_id=${userLogin.user_id}&user_resume_idx=${resume['USER_RESUME_IDX']}">수정</a></td>
				        <td>
				            <a href="/Resume/DeleteResume?user_id=${userLogin.user_id}&user_resume_idx=${resume['USER_RESUME_IDX']}" 
				               onclick="return confirmDeletion('${resume['USER_TITLE']}');">삭제</a>
				        </td>
				    </tr> 
				</c:forEach>	    
            </tbody>
        </table>
        <div class="new-resume">
            <a href="/Resume/RegisterResumeForm?user_id=${userLogin.user_id}">새 이력서 작성하기</a>
        </div>
    </main>
</body>
</html>
