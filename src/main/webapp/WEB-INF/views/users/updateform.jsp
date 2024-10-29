<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>
		h2 {
		text-align: center;
		}
		body {
            background-color: #EBFFEE; 
        }
        table {
            margin: 20px auto;
            background-color: white; 
            border-radius: 8px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
        th, td {
            padding: 15px; 
        }
        input[type="button"] {
            background-color: #470065; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            padding: 10px 20px; /
            cursor: pointer; 
            transition: background-color 0.3s;
        }
        input[type="button"]:hover {
            background-color: #5a0072;
        }
</style>
</head>
<body>
  <main>  
    <h2>회원 수정</h2>
    <form action="/Users/Update"  method="POST">
    <table>
     <tr>
      <td>아이디</td>
      <td><input type="text" name="user_id" value="${ user.user_id }" readonly/></td>
      <!-- primary key가 외래키로 쓰일때는 수정하는것이 아니기때무에 수정x -->
     </tr>
     <tr>
      <td>새 비밀번호</td>
      <td><input type="password" name="user_passwd" id="passwd1" value="${ user.user_passwd }" required/></td>
     </tr>
      <tr>
      <td>새 비밀번호 확인</td>
      <td><input type="password" id="passwd2" value="${ user.user_passwd }" required/></td>
     </tr>
     <tr>
      <td>이름</td>
      <td><input type="text" name="user_name" value="${ user.user_name }" required/></td>
     </tr>
      <tr>
	 	<td>연락처</td>
		<td><input type="text" name="user_phone" value="${ user.user_phone }" placeholder="-없이 입력해주세요" required />
	 </tr>
     <tr>
	    <td>이메일</td>
	    <td>
	        <input type="email" id="user_email" name="user_email" value="${ user.user_email }" placeholder="이메일 입력" />
	    </td>
	    <td>
	        <select id="email_domain" onchange="updateEmail()" >
	            <option value="" selected>직접입력</option> <!-- 기본 선택값으로 설정 -->
	            <option value="gmail.com">gmail.com</option>
	            <option value="naver.com">naver.com</option>
	            <option value="kakao.com">kakao.com</option>
	            <option value="yahoo.com">yahoo.com</option>
	            <option value="outlook.com">outlook.com</option>
	            <option value="green.com">green.com</option>
	        </select>
	    </td>
	</tr>
     <tr>
        <td colspan="2">
        <td><input type="submit" value="수정완료" /></td>
     </tr>
    
    </table>    
    </form>
  
    <script>
       
       function updateEmail() {
           var emailInput = document.getElementById('user_email');
           var domainSelect = document.getElementById('email_domain');

           var selectedDomain = domainSelect.value;

           if (selectedDomain) {
               emailInput.value = emailInput.value.split('@')[0] + '@' + selectedDomain;
           } else {
               emailInput.value = emailInput.value.split('@')[0]; // 도메인 제거
           }
       }

    </script> 
  
  </main>
</body>
</html>