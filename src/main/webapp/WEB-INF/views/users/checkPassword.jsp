<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<script
	src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
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

input[type="submit"]:hover {
	background-color: #5a0072;
}
</style>
</head>
<body>
	<main>
		<h1></h1>
		<h2 class="text-center">회원 정보</h2>
		<form action="/Users/CheckPassword" method="POST">
			<input type="hidden" name="user_id" value="${param.user_id}" />
			<table class="table table-bordered">
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="inputPassword" required /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="확인" id="check" />
					</td>
				</tr>
			</table>
		</form>
		<script>
	      // 서버에서 전달된 error 메시지가 있을 경우 alert로 출력
	      <%if (request.getAttribute("error") != null) {%>
	        alert("<%=request.getAttribute("error")%>
				");
			<%}%>
			
		</script>
	</main>
</body>
</html>
