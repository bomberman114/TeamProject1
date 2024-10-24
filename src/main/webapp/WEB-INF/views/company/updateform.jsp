<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
</head>
<body>
  <main>  
    <h2>회원 수정</h2>
    <form action="/Users/Update"  method="POST">
    <table>
     <tr>
      <td>아이디</td>
      <td><input type="text" name="user_id" value="${user.user_id}" readonly/></td>
      <!-- primary key가 외래키로 쓰일때는 수정하는것이 아니기때무에 수정x -->
     </tr>
     <tr>
      <td>새 비밀번호</td>
      <td><input type="password" name="user_passwd" id="passwd1" value="${user.user_passwd}" /></td>
     </tr>
      <tr>
      <td>새 비밀번호 확인</td>
      <td><input type="password" id="passwd2" value="${user.user_passwd}" /></td>
     </tr>
     <tr>
      <td>이름</td>
      <td><input type="text" name="user_name" value="${user.user_name}" /></td>
     </tr>
      <tr>
	 	<td>연락처</td>
		<td><input type="text" name="user_phone" value="${user.user_phone}" placeholder="-없이 입력해주세요" >
	 </tr>
     <tr>
      	<td>이메일</td>
      	<td><input type="email" name="user_email" value="${user.user_email}" /></td>
      	<td><select><option>@gmail.com</option></select></td>
     </tr>
      <td colspan="3">
       <input type="submit" value="수정" />
       <input type="button" value="목록" id="goList" />
      </td>
     </tr>
    
    </table>    
    </form>
  
    <script>
       const  goList = document.getElementById('goList')
       goList.onclick = function() {
          location.href = '/Users/List'
       } 
       // 서버에서 전달된 error 메시지가 있을 경우 alert로 출력
       <% if (request.getAttribute("error") != null) { %>
         alert("request.getAttribute("error")");
       <% } %>
    </script> 
  
  </main>
</body>
</html>