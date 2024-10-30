<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="styles.css">
    <title>사이트</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #EBFFEE;
            margin: 0;
            padding: 0;
        }

header {
    background-color: #ffffff;
    padding: 20px;
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 중앙 정렬 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    z-index: 10; /* 헤더가 항상 위에 오도록 설정 */
}
.logo-container {
    margin-bottom: 20px; /* 로고와 네비게이션 간의 간격 조정 */
    text-align: center; /* 로고 중앙 정렬 */
    width: 100%; /* 전체 너비 사용 */
    height: 15em; /* 로고 높이 설정 */
    overflow: hidden; /* 잘라내기 */
}

.logo-container img {
    object-fit; /* 비율 유지하며 잘라내기 */
}

header img {
    height: 15em; /* 로고 높이 조정 */
}
.nav-container {
    display: flex; /* 수평 정렬을 위한 flexbox 사용 */
    flex-direction: unset;
    justify-content: space-between; /* 공간을 균등하게 배분 */
    align-items: center; /* 수직 중앙 정렬 */
    width: 100%; /* 전체 너비 사용 */
}
        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        nav a {
            text-decoration: none;
            color: #4a4a4a;
            font-weight: 500;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #470065; /* 호버 색상 */
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
            margin: 0; /* 여백 초기화 */
        }

        .sidebar {
            width: 250px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: -250px; /* 기본적으로 숨김 */
            height: 100%;
            transition: left 0.3s;
            z-index: 1000; /* 오버레이 위치 조정 */
        }

        .sidebar.active {
            left: 0; /* 사이드바 표시 */
        }

        main {
            flex: 1;
            text-align: center;
            padding: 40px;
            margin-left: 20px; /* 여백 추가 */
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
            position: relative; /* 상대 위치 설정 */
            margin: 20px 0;
        }

        .search-container input {
            padding: 10px 40px 10px 20px; /* 오른쪽 패딩 추가 */
            border: 1px solid #ccc;
            border-radius: 30px; /* 둥근 모서리 */
            width: 500px; /* 너비 조절 */
            height: 50px;
            outline: none; /* 포커스 시 테두리 제거 */
            transition: border 0.3s; /* 테두리 전환 효과 */
            font-size: 16px; /* 폰트 크기 조절 */
        }

        .search-container input:focus {
            border: 1px solid #470065; /* 포커스 시 테두리 색상 변경 */
            box-shadow: 0 0 5px rgba(71, 0, 101, 0.5); /* 테두리 그림자 추가 */
        }

        .search-button {
            right: 10px; /* 오른쪽 여백 */
            top: 50%; /* 세로 중앙 정렬 */
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            border: none;
            background-color: transparent; /* 배경색을 투명으로 설정 */
            color: #470065; /* 텍스트 색상 유지 */
            cursor: pointer;
            font-size: 36px; /* 아이콘 크기 조절 */
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 한 줄에 3개 */
            gap: 20px; /* 각 카드 사이의 여백 */
            max-width: 1200px; /* 최대 너비 설정 */
            margin: 0 auto; /* 중앙 정렬 */
            padding: 20px; /* 여백 추가 */
        }

        .grid-container a {
            text-decoration: none; /* 링크의 기본 밑줄 제거 */
        }

        .card {
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px; /* 둥근 모서리 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s; /* 호버 효과를 위한 트랜지션 추가 */
        }

        .card:hover {
            transform: scale(1.05); /* 호버 시 확대 효과 */
        }
    </style>
</head>
<body>
    <header>
    <div class="logo-container">
        <a href="/">
            <img src="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/NEXT.png?raw=true" alt="사이트 로고" style="height: 15em;"> <!-- 로고 크기 조정 -->
        </a>
    </div>
<p></p>
        <nav>
            <ul>
                <li><a href="/Post/PostHome">커뮤니티</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="#">Pricing</a></li>
                <li><a href="#">Contact</a></li>

            <% if ((Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser")) { %>
                <li><a href="/Users/Logout">로그아웃</a></li>
            <% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
                <li><a href="/Company/Logout">로그아웃</a></li>
            <% } %>
                
                
                <% if ((Boolean) request.getAttribute("logInUser") && (Boolean) request.getAttribute("logInCompanyUser")){%>
                <li><a href="/Users/LoginForm">로그인</a></li>
                <li><a href="/Users/RegisterForm">회원가입</a></li>
            <% } %>

                <li><a href="/User/RegisterResumeForm?user_id=${ userLogin.user_id }">이력서 작성</a></li>
                <li><a href="/User/ResumeList?user_id=${ userLogin.user_id }">이력서 목록</a></li>
                

            </ul>
        </nav>
        <button class="menu-toggle" id="menu-toggle">☰</button>
    </header>
    
    <div class="container">
        <div class="sidebar" id="sidebar">
            <button id="close-menu">닫기</button>
                <p><a href="/Company/Info?company_id="${companyUserLogin.company_id}>회사 정보</a></p>
                <p><a href="/Users/View?user_id=${userLogin.user_id}">개인 정보</a></p>
   
            <p><a href="#">메뉴 항목 3</a></p>
             <p><a href="/Company/CompanyDelete?company_id=${ companyUserLogin.company_id }">탈태</a></p>
        </div>

        
        <main>
            <h1>사이트 ~~ 배경은 사진 넣거나 맘대로</h1>
            <h2>Subtitle</h2>

            <div class="search-container">
                <input type="text" placeholder="찾고 싶은 채용공고를 검색하세요">
                <button class="search-button">⌕</button>
            </div>

            <div class="grid-container">
               <c:forEach var="companyRecruitList" items="${ companyRecruitList }">     
                   <a href="" class="card">${ companyRecruitList.company_name }<br>${ companyRecruitList.recruit_title }</a>
                   <!--  회사이름, 공고이름 -->
               </c:forEach>      
            </div>
        </main>
    </div>

    <script>
        const menuToggle = document.getElementById('menu-toggle');
        const sidebar = document.getElementById('sidebar');

        menuToggle.addEventListener('click', () => {
            sidebar.classList.toggle('active');
        });

        const closeMenu = document.getElementById('close-menu');
        closeMenu.addEventListener('click', () => {
            sidebar.classList.remove('active');
        });
    </script>

</body>
</html>


