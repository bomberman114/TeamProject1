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
    <h2>로그인</h2>
    <form action="/Users/Login"  method="POST">
    <table>
     <tr>
      <td>아이디</td>
      <td>
      <input type="text"  name="user_id" value="admin" required/>     
      </td>
     </tr>
     <tr>
      <td>암호</td>
      <td><input type="password" name="user_passwd" value="1234" required/></td>
     </tr>
     <tr>
      <td colspan="2">
       <input type="submit" value="로그인" />
       <input type="button" value="회원가입" id="goList" />
      </td>
     </tr>
    
    </table>    
    </form>
  
    <script>
       const  goList = document.getElementById('goList')
       goList.onclick = function() {
          location.href = '/Users/RegisterForm'
       }    
       
    </script> 
  </main>
</body>
</html>















