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
    <form action="/Company/Update"  method="POST">
    <table>
     <tr>
      <td>아이디</td>
      <td><input type="text" name="company_id" value="${company.company_id}" readonly/></td>
      <!-- primary key가 외래키로 쓰일때는 수정하는것이 아니기때무에 수정x -->
     </tr>
     <tr>
      <td>새 비밀번호</td>
      <td><input type="password" name="company_passwd" id="passwd1" value="${company.company_passwd}" /></td>
     </tr>
      <tr>
      <td>새 비밀번호 확인</td>
      <td><input type="password" id="passwd2" value="${company.company_passwd}" /></td>
     </tr>
     <tr>
      <td>이름</td>
      <td><input type="text" name="company_name" value="${company.company_name}" /></td>
     </tr>
      <tr>
	 	<td>연락처</td>
		<td><input type="text" name="company_phone" value="${company.company_phone}" placeholder="-없이 입력해주세요" >
	 </tr>
     <tr>
      	<td>BCODE</td>
      	<td><input type="number" name="company_bcode" value="${company.company_bcode}" /></td>
      	<!-- <td><select><option>@gmail.com</option></select></td>  -->
     </tr>
     <tr>
      <td>BOSS_NAME</td>
      <td><input type="text" name="company_boss_name" value="${company.company_boss_name}" /></td>
     </tr>
     <tr>
      <td>email</td>
      <td><input type="text" name="company_email" value="${company.company_email}" /></td>
     </tr>
	 <tr>
      <td>user_email</td>
      <td><input type="text" name="company_user_email" value="${company.company_user_email}" /></td>
     </tr>
	 <tr>
      <td>establish</td>
      <td><input type="date" name="company_establish" value="${company.company_establish}" /></td>
     </tr>
     <tr> 
     <tr>
        <td colspan="2">
        <td><a href="/CompanyUsers/View?company_id=${CompanyUser.company_id}">완료</a></td>
     </tr>
     </tr>
    
    </table>    
    </form>
     
       // 서버에서 전달된 error 메시지가 있을 경우 alert로 출력
       <% if (request.getAttribute("error") != null) { %>
         alert("request.getAttribute("error")");
       <% } %>
    </script> 
  
  </main>
</body>
</html>