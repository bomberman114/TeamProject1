<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인이력서목록</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
    <script>
        function confirmDeletion(user_title) {
            return confirm("이력서"  + user_title + "을(를) 정말 삭제하시겠습니까?");
        }
    </script>
</head>
<body>
    <main>  
<%--         <%@include file="/WEB-INF/include/pagingmenus.jsp" %>
 --%>    
        <h2>내 이력서 목록</h2>
         <input type="hidden" name="user_id" value="${ userLogin.user_id }">
        <table>
            <tr>
                <td>번호</td>
                <td>제목</td>
                <td>작성일</td>
                <td>삭제</td>
                <td>수정</td>
            </tr>
            <tr>
                <td colspan="4">
                    <a href="/User/RegisterResumeForm?user_id=${ userLogin.user_id }">새 이력서 작성하기</a>
                </td>
            </tr>
            <c:forEach var="resume" items="${userResumeList}">
                <tr>
                    <td>${resume.user_resume_idx}</td>
                    <td><a href="/User/ViewResume?user_id=${ userLogin.user_id }&user_resume_idx=${resume.user_resume_idx}">${resume.user_title}</a></td>
                    <td>${resume.user_resume_regdate}</td>
                    <td>
                        <a href="/User/DeleteResume?user_id=${ userLogin.user_id }&user_resume_idx=${resume.user_resume_idx}" 
                           onclick="return confirmDeletion('${resume.user_resume_idx}');">삭제</a>
                    </td>
                    <td><a href="/Users/UpdateResume?user_resume_idx=${resume.user_resume_idx}">수정</a></td>
                </tr> 
            </c:forEach>       
        </table>
    </main>
</body>
</html>
