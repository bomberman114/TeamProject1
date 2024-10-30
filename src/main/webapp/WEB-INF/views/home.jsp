<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알아보JOB</title>
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png?raw=true" />
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Nanum+Brush+Script&family=Poor+Story&display=swap" rel="stylesheet">

  <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #ffffff; color: #333; margin: 0; padding: 0; }
        header { background-color: #ffffff; padding: 10px; display: flex; flex-direction: column; align-items: center; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border-bottom: 2px solid #EBFFEE; }
        .logo-container {
            margin-top: 20px;
            text-align: center;
            z-index:1;
        }

        .logo-container img {
            height: 180px;
            z-index:2;
        }

        .nav-menu {
            width: 100%;
            padding: 0;
            background-color: #EBFFEE;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding-top: 5px;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 25px;
            margin: 0;
            padding: 0;
            padding-right: 10px;
        }

        nav a {
            text-decoration: none;
            color: #470065;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #333;
        }

        .logsession {
            padding-right: 10px;
        }

        .container {
            display: flex;
            flex: 1;
            position: relative;
        }

        .menu-toggle {
            cursor: pointer;
            background: none;
            border: none;
            font-size: 24px;
            color: #470065;
            padding: 10px;
            margin: 0;
        }

        .sidebar {
            width: 250px; 
            background-color: #ffffff; 
            padding: 20px; 
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15); 
            position: fixed; 
            left: -250px; 
            height: 100%; 
            transition: left 0.3s ease; 
            z-index: 3;
            top:0;
        }

        .sidebar.active {
            left: 0; 
        }

        .sidebar button {
            background-color: #470065; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            padding: 10px; 
            cursor: pointer; 
            margin-bottom: 20px; 
            transition: background-color 0.3s ease; 
        }

        .sidebar button:hover {
            background-color: #333; 
        }

        .sidebar p {
            margin: 15px 0; 
        }

        .sidebar a {
            text-decoration: none; 
            color: #470065; 
            font-weight: 600; 
            transition: color 0.3s ease; 
        }

        .sidebar a:hover {
            color: #333; 
        }

        main {
            flex: 1;
            text-align: center;
            padding: 40px;
            margin-left: 20px;
        }

        h1 {
            font-size: 36px;
            font-weight: bold;
            color: #470065;
        }

        h2 {
            font-size: 24px;
            color: #555;
        }

        .search-container {
            position: relative;
            margin: 20px 0;
        }

        .search-container input {
            padding: 12px 40px 12px 20px;
            border: 2px solid #ccc;
            border-radius: 25px;
            width: 500px;
            height: 50px;
            outline: none;
            transition: border 0.3s ease;
            font-size: 16px;
            color: #333;
        }

        .search-container input:focus {
            border-color: #470065;
            box-shadow: 0 0 5px rgba(71, 0, 101, 0.4);
        }

        .search-button {
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background-color: transparent;
            color: #470065;
            cursor: pointer;
            font-size: 28px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); 
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .card {
            background-color: #EBFFEE;
            padding: 20px; 
            border: 1px solid #ddd;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            color: #333;
            text-align: center;
            height: 250px; 
            display: flex;
            flex-direction: column;
            justify-content: space-between; 
            text-decoration: none;
            font-family: "Jua", serif; 
        }

        .card h3 {
            font-size: 20px; 
            color: #470065; 
            margin: 0;
            font-family: "Jua", serif;
        }

        .card p {
            font-size: 16px; 
            color: #555; 
            margin: 10px 0; 
        }

        .card .company-name {
            font-weight: bold; 
            font-size: 20px;
            font-family: "Jua", serif;  
        }

        .card .recruit-title {
            font-size: 30px;
            font-family: "Jua", serif; 
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        .popular { /* 인기공고 텍스트 부분 */
            font-size: 28px; 
            color: #470065; 
            text-align: center; 
            margin: 20px 0; 
            border-bottom: 2px solid #470065; 
            padding-bottom: 10px; 
            font-weight: bold; 
            text-transform: uppercase; 
            letter-spacing: 1px; 
            font-family: "Jua", serif; 
        }

        .login-menu {
            background-color: #ffffff;
            text-align: right;
        }
		
		h2{
		font-family: "Nanum Brush Script", cursive;
		color:black;
		font-size:40px;
		}
		.highlight {
    color: #00B300; /* 선명한 초록색 */
    font-weight: bold; /* 굵게 설정 */
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2); /* 약간의 그림자 효과 */
}
    </style>
</head>
<body>
    <header>
	 <nav class="nav-menu">
		<% if ((Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser")) { %>
			<button class="menu-toggle" id="menu-toggle">☰</button>
		<% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
			<button class="menu-toggle" id="menu-toggle">☰</button>
		<% } %>   
        <nav class="logsession">
            <ul>
				
            	<!-- 개인과 기업 로그인 상태 처리 -->
				<% if ((Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser")) { %>
				    <li><a href="/Users/Logout">로그아웃</a></li>
				<% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
				    <li><a href="/Company/Logout">로그아웃</a></li>
				<% } %>
                
                <% if ((Boolean) request.getAttribute("logInUser") && (Boolean) request.getAttribute("logInCompanyUser")) {%>
                <li><a href="/Users/LoginForm">로그인</a></li>
                <!-- <li><a href="/Users/RegisterForm">회원가입</a></li> -->
                <% } %>
            </ul>
        </nav>
	</nav>     		
   
    </header>
    
    <div class="logo-container">
        <a href="/">
			<img src="https://raw.githubusercontent.com/bomberman114/TeamProject1/develop/src/main/resources/static/img/NEXT.png" alt="사이트 로고">
        </a>
    </div>
    <% if (!((Boolean) request.getAttribute("logInUser")) || !((Boolean) request.getAttribute("logInCompanyUser"))) {%>
    <div class="container">
		<div class="sidebar" id="sidebar">
		    <button id="close-menu">닫기</button>
		    <% if ((Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser")) { %>
		        <p><a href="/Users/View?user_id=${ userLogin.user_id }">내 정보</a></p>
		        <p><a href="/Resume/RegisterResumeForm?user_id=${ userLogin.user_id }">새 이력서 작성하기</a></p>
		        <p><a href="/Resume/ResumeList?user_id=${ userLogin.user_id }">내 이력서 목록</a></p>
		    <% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
		        <p><a href="/Company/Info?company_id=${ companyUserLogin.company_id }">회사 정보</a></p>
		    <% } %>
		</div>
	<% } %>	

    <main>
<h2>
    구인구직, <span class="highlight">알아보JOB</span>에서 한 번에!
</h2>        <div class="search-container">
            <input type="text" placeholder="찾고 싶은 채용공고를 검색하세요">
            <button class="search-button">⌕</button>
        </div>

		<div class="popular">인기공고</div>
		<div class="grid-container">
			<c:forEach var="companyRecruit" items="${companyRecruitList}">
				<a
					href="/Common/IncrementView?company_recruit_idx=${companyRecruit.company_recruit_idx}"
					class="card">
					<h3 class="company-name">${companyRecruit.company_name}</h3>
					<p class="recruit-title">${companyRecruit.recruit_title}</p>
					<p>지원종료일: ${companyRecruit.application_deadline}</p> <!-- 등록일 추가 -->
				</a>
			</c:forEach>
		</div>
    </main>
    </div>
    <script>
        const menuToggle = document.getElementById( 'menu-toggle' );
        const sidebar = document.getElementById( 'sidebar' );

        menuToggle.addEventListener( 'click', () => {
            sidebar.classList.toggle( 'active' );
        });

        const closeMenu = document.getElementById( 'close-menu' );
        closeMenu.addEventListener( 'click', () => {
            sidebar.classList.remove( 'active' );
        });
    </script>

</body>
</html>