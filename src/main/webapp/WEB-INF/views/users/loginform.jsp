<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>

    <style>
        body {
            background-color: #e0f7e9;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
        }
        .title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .toggle {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .toggle button {
            background-color: #d1c4e9;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            background-color: #6a1b9a;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            width: 100%;
            margin: 10px 0;
        }
        .btn:hover {
            background-color: #4a148c;
        }
    </style>
</head>

<body>
    <form action="/Users/Login"  method="POST">
    <div class="container">
        <div class="toggle">
            <button type="button" onclick="location.href='/Users/LoginForm'">개인회원</button>
            <button type="button" onclick="location.href='/Company/LoginForm'">기업회원</button>
        <!-- 페이지를 따로 빼야함 -->
        </div>
        <div class="title">ALGO JJOB</div>
        <div class="title">개인회원 로그인</div>
        <div style="color: red">${ loginFalseMessage }</div>
        <input type="text" name="user_id" placeholder="아이디" />
        <input type="password" name="user_passwd" placeholder="비밀번호" />
        <input type=submit class="btn" value="로그인"/>
        <button class="btn" type=button onclick="location.href='/Users/RegisterForm'">회원가입</button>
    </div>
   </form>

</body>
</html>















