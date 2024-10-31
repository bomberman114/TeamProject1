<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>기업 로그인</title>
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png?raw=true" />
    <style>
        body {
            background-color: #e0f7e9;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
      .logo-container { 
         text-align: center; 
         margin-bottom: 20px; 
      }
        .logo-container img {
            height: 100px;
            width: 150px;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 500px;
            text-align: center;
        }
        .title {
            font-size: 18px;
            margin-bottom: 20px;
            color: #470065;
        }
        .toggle {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .toggle button {
            background-color: #6a1b9a;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            flex: 1;
            margin: 0 5px;
            font-size: 20px;
        }
        .toggle button:hover, .toggle input[type="button"]:hover {
            background-color: #470065;
        }
        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
        .btn {
            background-color: #6a1b9a;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px;
            cursor: pointer;
            width: 100%;
            margin: 10px 0;
            font-size: 20px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #470065;
        }
    </style>
</head>

<body>
    <form action="/Company/Login" method="POST">
            <div class="logo-container">
                <a href="/">
                    <img src="https://raw.githubusercontent.com/bomberman114/TeamProject1/develop/src/main/resources/static/img/NEXT.png" alt="사이트 로고">
                </a>
            </div>
        <div class="container">
            <div class="toggle">
                <button type="button" onclick="location.href='/Users/LoginForm'">개인회원</button>
                <button type="button" onclick="location.href='/Company/LoginForm'">기업회원</button>
            </div>

        <div class="title">기업회원 로그인</div>
        <div style="color: red">${ loginFalseMessage }</div>
        <input type="text" name="company_id" placeholder="아이디" />
        <input type="password" name="company_passwd" placeholder="비밀번호" />
        <input type=submit value="로그인" />
        <button class="btn" type=button onclick="location.href='/Company/RegisterForm'">회원가입</button>
    </div>
   </form>

</body>
</html>
