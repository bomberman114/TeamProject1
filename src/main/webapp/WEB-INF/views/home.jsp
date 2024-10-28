<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이트</title>
</head>
<style>
   

body {
    font-family: Arial, sans-serif;
    background-color: #e0f7fa;
    margin: 0;
    padding: 0;
}

header {
    background-color: #ffffff;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

nav ul {
    list-style: none;
    display: flex;
    gap: 20px;
}

nav a {
    text-decoration: none;
    color: #6a1b9a;
}

main {
    text-align: center;
    padding: 40px;
}

h1 {
    font-size: 36px;
    font-weight: bold;
}

h2 {
    font-size: 24px;
    color: #555;
}

.button-container {
    margin: 20px 0;
}

button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    margin: 0 10px;
    cursor: pointer;
}

button:first-child {
    background-color: #4caf50;
    color: white;
}

button:last-child {
    background-color: #8c9eff;
    color: white;
}

.search-container {
    margin: 20px 0;
}

.search-container input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.search-button {
    padding: 10px;
    border: none;
    background-color: #6a1b9a;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
}

.card {
    background-color: white;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

</style>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="#">Pricing</a></li>
                <li><a href="#">Contact</a></li>
                <% if ((Boolean) request.getAttribute("logInUser")) {%>
                <li><a href="/Users/LoginForm">로그인</a></li>
                <% } %>
                <% if ((Boolean) request.getAttribute("logOutUser")) {%>
                <li><a href="/Users/Logout">로그아웃</a></li>
                <li><a href="/Users/RegisterForm">회원가입</a></li>
                <% } %>
                <% if ((Boolean) request.getAttribute("admin")) { %>
                    <li><a href="/Users/List">회원목록</a></li>
                <% } %>
                <li><a href="/User/RegisterResumeForm?user_id=${login.user_id}">이력서 작성</a></li>
                <li><a href="/User/ResumeList?user_id=${login.user_id}">이력서 목록</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <h1>사이트 ~~ 배경은 사진 넣거나 맘대로</h1>
        <h2>Subtitle</h2>

        <div class="search-container">
            <input type="text" placeholder="공고검색창">
            <button class="search-button">🔍</button>
        </div>

        <div class="grid-container">
            <div class="card">인기공고 1<br>Title<br>Description</div>
            <div class="card">인기공고 2<br>Title<br>Description</div>
            <div class="card">인기공고 3<br>Title<br>Description</div>
            <div class="card">인기공고 4<br>Title<br>Description</div>
            <div class="card">인기공고 5<br>Title<br>Description</div>
            <div class="card">인기공고 6<br>Title<br>Description</div>
        </div>
    </main>

</body>
</html>