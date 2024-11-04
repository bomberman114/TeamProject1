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
         body {

            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ffffff;
            color: #333;
            margin: 0;
            padding: 0;
        }

           
       header {

            background-color: #ffffff;
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;      

       }
      
        .logo-container {
           margin-bottom: 10px;
           text-align: center;
       }


        .logo-container img {
            height: 180px;
        }
        

      .nav-menu {
          width: 100%;
          padding: 0;
          background-color: white;
          display: flex;
          justify-content: flex-end;
          align-items: center;
          padding-top: 5px;
      }
         
      nav ul {
          list-style: none;
          display: flex;
          gap: 25px; /* 버튼 간 간격 */
          margin: 0;
          padding: 0;
          padding-right: 10px;
          align-items: center; /* 수직 정렬 */
      }


       nav a {
    text-decoration: none;
    color: #470065;
    font-weight: 600;
    transition: color 0.3s ease;
    padding: 10px 15px; /* 패딩을 추가하여 버튼 크기 조정 */
    display: inline-block; /* 버튼 형태로 만들기 위해 inline-block 설정 */
    border-radius: 5px; /* 모서리 둥글게 */
    font-size: 30px; /* 글자 크기 조정 */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important; /* !important 추가 */
}


       nav a:hover {

          color: #333;
          background-color: #f0f0f0; /* 호버 시 배경색 추가 */
      }

        .container {
            display: flex;
            flex: 1;
            position: relative;
            font-size: 20px;
            font-weight: bold;
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
            width: 250px; /* 사이드바 너비 */
            background-color: #ffffff; /* 배경색 */
            padding: 20px; /* 패딩 */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15); /* 그림자 효과 */
            position: fixed; /* 고정 위치 */
            top: 0; /* 상단 정렬 */
            left: -350px; /* 화면 밖으로 숨김 */
            height: 100%; /* 전체 높이 */
            transition: left 0.3s ease; /* 애니메이션 효과 */
            z-index: 1000; /* 다른 요소 위에 표시 */
        }

      
         .sidebar.active {
            left: 0; /* 사이드바 표시 */
        }

        .sidebar button {
            background-color: #EBFFEE; /* 버튼 색상 */
          color: #470065; /* 텍스트 색상 */
          border: none; /* 테두리 없음 */
          border-radius: 5px; /* 모서리 둥글게 */
          padding: 10px 0; /* 패딩 (좌우 여백 제거) */
          cursor: pointer; /* 커서 변경 */
          margin-bottom: 20px; /* 버튼과 다른 요소 간 여백 */
          transition: background-color 0.3s ease; /* 호버 효과 */
          box-shadow: 0 0 5px rgba(71, 0, 101, 0.4);
          font-weight: bold;
          font-size: 30px; /* 글자 크기 조정 */
          width: 100%; /* 버튼의 너비를 100%로 설정 */
          max-width: 250px; /* 최대 너비 설정 (사이드바 너비와 동일) */
      }
      

        .sidebar button:hover {
            background-color: #333; /* 호버 시 색상 변경 */
            color: white; /* 호버 시 텍스트 색상 변경 */
        }

        .sidebar p {
            margin: 10px 0; /* 각 항목 간 여백 */
        }

      
      .sidebar a {
          text-decoration: none; /* 링크 밑줄 제거 */
          color: #470065; /* 링크 색상 */
          font-weight: 600; /* 링크 텍스트 굵게 */
          transition: color 0.3s ease; /* 색상 변화 애니메이션 */
      }
      
      .sidebar a:hover {
          color: #333; /* 호버 시 색상 변경 */
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
          grid-template-columns: repeat(3, 1fr); /* 한 줄에 3개 표시 */
          gap: 20px;
          max-width: 1200px;
          margin: 0 auto;
          padding: 20px;
         
      }

      .card {
          background-color: #EBFFEE;
          padding: 20px; /* 패딩 조정 */
          border: 1px solid #ddd;
          border-radius: 15px;
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
          transition: transform 0.2s ease, box-shadow 0.2s ease;
          color: #333;
          text-align: center;
          height: 250px; /* 카드 높이 조정 */
          display: flex;
          flex-direction: column;
          justify-content: space-between; /* 내용과 버튼 사이의 공간 조정 */
          text-decoration: none;
          font-family: "Jua", serif; /* 인기공고 글씨체 변경 */
          
          
      }
      
      .card h3 {
          font-size: 20px; /* 제목 크기 조정 */
          color: #470065; /* 제목 색상 */
          margin: 0;
          font-family: "Jua", serif;
      }
      
      .card p {
          font-size: 16px; /* 설명 텍스트 크기 조정 */
          color: #555; /* 설명 색상 */
          margin: 10px 0; /* 여백 추가 */
      }
      
      .card .company-name {
          font-weight: bold; /* 회사 이름 굵게 */
          font-size: 20px;
          font-family: "Jua", serif;  /* 인기공고 글씨체 변경 */
          
      }
      .card .recruit-title{
         font-size: 30px;
          font-family: "Jua", serif; /* 인기공고 글씨체 변경 */
      }
      .card:hover {
          transform: scale(1.05);
          box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
      }
      
      .popular {
          font-size: 28px; /* 크기 조정 */
          color: #470065; /* 텍스트 색상 */
          text-align: center; /* 중앙 정렬 */
          margin: 20px 0; /* 위아래 여백 조정 */
          border-bottom: 2px solid #470065; /* 아래쪽에 밑줄 추가 */
          padding-bottom: 10px; /* 밑줄과 텍스트 사이 여백 추가 */
          font-weight: bold; /* 글씨 굵게 */
          text-transform: uppercase; /* 대문자 변환 */
          letter-spacing: 1px; /* 글자 간격 조정 */
          font-family: "Jua", serif; /* 인기공고 글씨체 변경 */
          
          
      }
      
      .login-menu {
         background-color: #ffffff;
         text-align: right;
      
      
      }
      
      h2{

         font-family: "Nanum Brush Script", cursive;;
         color:black;
         font-size:40px;
         
      }
      .highlight {
          color: #00B300; /* 선명한 초록색 */
          font-weight: bold; /* 굵게 설정 */
          text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2); /* 약간의 그림자 효과 */
      }

      
      footer {
      text-align: center;
      font-family: "Jua", serif;

      padding-bottom: 10px; /* 밑줄과 텍스트 사이 여백 추가 */
      }
      

      
    </style>
</head>
<body>
   <nav class="nav-menu">
    <% if ((Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser")) { %>
        <button class="menu-toggle" id="menu-toggle">☰</button>
    <% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
        <button class="menu-toggle" id="menu-toggle">☰</button>
    <% } %>   
    <nav>
        <ul>
            <% if ((Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser")) { %>
                <li><a href="/Users/Logout">로그아웃</a></li>
            <% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
                <li><a href="/Company/Logout">로그아웃</a></li>
            <% } %>
            <% if ((Boolean) request.getAttribute("logInUser") && (Boolean) request.getAttribute("logInCompanyUser")) {%>
                <li><a href="/Users/LoginForm">로그인</a></li>
            <% } %>
        </ul>
    </nav>
</nav>
    <header>
   
    </header>
    
    <div class="logo-container">
        <br/>
        <a href="/">
         <img src="https://raw.githubusercontent.com/bomberman114/TeamProject1/develop/src/main/resources/static/img/NEXT.png" alt="사이트 로고">
        </a>
    </div>
    <% if (!((Boolean) request.getAttribute("logInUser")) || !((Boolean) request.getAttribute("logInCompanyUser"))) {%>
    <div class="container">
   <div class="sidebar" id="sidebar">
    <button id="close-menu">닫기</button>
    <div class="button-container">
        <% if ((Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser")) { %>
            <button onclick="location.href='/Users/View?user_id=${ userLogin.user_id }'">내 정보</button>
            <button onclick="location.href='/Resume/RegisterResumeForm?user_id=${ userLogin.user_id }'">이력서 작성하기</button>
            <button onclick="location.href='/Resume/ResumeList?user_id=${ userLogin.user_id }'">이력서 목록</button>
        <% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
            <button onclick="location.href='/Company/Info?company_id=${ companyUserLogin.company_id }'">내 정보</button>
            <button onclick="location.href='/Company/RecruitInfo?company_id=${ companyUserLogin.company_id }'">채용 공고 관리</button>
            <button onclick="location.href='/Company/RecruitWriteForm?company_id=${ companyUserLogin.company_id }'">채용 공고 등록</button>
        <% } %>
    </div>
</div>
   <% } %>   

    <main>

      <h2>
          구인구직, <span class="highlight">알아보JOB</span>에서 한 번에!
      </h2>

        <div class="search-container">
           <form action="/Common/RecruitSearch" method="get">
            <input type="text" name="recruit_title" placeholder="⌕    찾고 싶은 채용공고를 검색하세요">
            </form>
        </div>


      <div class="popular">인기공고</div>
      <div class="grid-container">
      
        <% if ( ( (Boolean) request.getAttribute("logOutUser") && (Boolean) request.getAttribute("logInCompanyUser") )
        		||  ( (Boolean) request.getAttribute("logInUser") && (Boolean) request.getAttribute("logInCompanyUser") ) ) { %>
         <c:forEach var="companyRecruit" items="${companyRecruitList}">
            <a
               href="/Common/IncrementView?company_recruit_idx=${companyRecruit.company_recruit_idx}"
               class="card">
               <h3 class="company-name">${companyRecruit.company_name}</h3>
               <p class="recruit-title">${companyRecruit.recruit_title}</p>
               <p>지원종료일: ${companyRecruit.application_deadline}</p> <!-- 등록일 추가 -->
            </a>
         </c:forEach>
        <% } else if ((Boolean) request.getAttribute("logOutCompanyUser") && (Boolean) request.getAttribute("logInUser")) { %>
         <c:forEach var="companyRecruit" items="${companyRecruitList}">
            <a
               href="/Company/OneRecruit?company_recruit_idx=${companyRecruit.company_recruit_idx}"
               class="card">
               <h3 class="company-name">${companyRecruit.company_name}</h3>
               <p class="recruit-title">${companyRecruit.recruit_title}</p>
               <p>지원종료일: ${companyRecruit.application_deadline}</p> <!-- 등록일 추가 -->
            </a>
         </c:forEach>
   <% } %>   
      </div>
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
    
    <footer>
    <br/><span>이메일 : help@arabojob.co.kr, Fax : 02-0000-0000(대표)</span><br/>
    <span>(주)아라보잡, 그린구 그린로 00길 00, 0층, 대표 : 조현길</span><br/>
   <span>사업자등록 : 000-00-00000, 직업정보제공사업 : 그린 그린 제 0000-0호</span><br/>
   <span>Copyright (c) (주)아라보잡. All rights reserved.</span>
   <p></p>
   </footer>
    

</body>
</html>

