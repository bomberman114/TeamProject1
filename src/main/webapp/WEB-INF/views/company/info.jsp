<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사 정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet">    
    
    <style>
        body {
            background-color: #ffffff;
    
            margin: 0;
            padding: 0;
            text-align: center;
            font-family: "Jua", serif;
        }

        .header {
            background-color: #ffffff;
            color: black;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            border-bottom: 2px solid #470065;
            
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #EBFFEE;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            
        }

        .info-box {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 18px;
            text-align: left;
            padding-bottom: 10px; 
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15); 
          
        }

        h1 {
            color: #470065;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .info-item {
            font-size: 18px;
            margin: 10px 0;
            margin-left: 30px;
            font-weight: bold;
            text-align: left;
        }

        .highlight {
            color: #2e8b57;
        }

        .link-container {
      		display: flex;
      	    justify-content: center;
      	    margin: 20px 0;
       	    max-width: 600px; /* 고정된 최대 너비 */
       	    width: 100%; /* 화면 크기에 따라 적응 */
       		margin: 0 auto;
        
   	    }



 	    .link-box {
            flex: 1;
            max-width: 280px; /* 각 링크 박스의 고정된 최대 너비 */
            background-color: #EBFFEE;
            color: #470065;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin: 10px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
        
        }

        .link-box:hover {
            background-color: #DFF5E1;
        }

        .no-offers {
            font-size: 18px;
            color: #2e8b57;
            margin-top: 20px;
        }

    	.button {  
            background-color: #EBFFEE;
            color: #470065;
            padding: 10px 20px;
            border-radius: 8px;
            text-align: center;
            font-size: 20px;
            margin: 10px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
            border: none; /* 테두리 제거 */
            font-weight: bold;
        
    	}

   		.button:hover {
            background-color: #495057;
    	}
     
        form {
            text-align: center;
        }
        
              
        footer {
            text-align: center;
            font-family: "Jua", serif;
        }
      
        .logo-container {
            margin-top: 20px; 
            margin-bottom: 10px;
            text-align: center;
        }
      
    </style>
</head>
<body>
    <header class="logo-container">
        <a href="/">
    		<img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
    <div class="link-container">
   		<a href="/Company/RecruitInfo" class="link-box">우리회사의 채용공고</a>
    	<a href="/Company/Info" class="link-box">내 정보
    </a>
</div>
    <div class="container">
        <h1>내 회사 정보</h1>
        <div class="info-box">
        <form action="/Company/InfoUpdateForm?company_id=${companyUserVo.company_id}" METHOD="POST">
            <div class="info-item">회사 ID: <span class="highlight">${companyUserVo.company_id}</span></div>
            <div class="info-item">회사 이름: <span class="highlight">${companyUserVo.company_name}</span></div>
            <div class="info-item">대표자: <span class="highlight">${companyUserVo.company_boss_name}</span></div>
            <div class="info-item">전화번호: <span class="highlight">${companyUserVo.company_phone}</span></div>
            <div class="info-item">이메일: <span class="highlight">${companyUserVo.company_email}</span></div>
            <div class="info-item">설립일: <span class="highlight">${companyUserVo.company_establish}</span></div>
            <div class="info-item">등록일: <span class="highlight">${companyUserVo.company_regdate}</span></div>
            <input type="submit" class="button" value="수정"/>
            </form>
        </div>
    </div>
<footer>    
    <br/><span>이메일 : help@arabojob.co.kr, Fax : 02-0000-0000(대표)</span><br/>
    <span>(주)아라보잡, 그린구 그린로 00길 00, 0층, 대표 : 조현길</span><br/>
	<span>사업자등록 : 000-00-00000, 직업정보제공사업 : 그린 그린 제 0000-0호</span><br/>
	<span>Copyright (c) (주)아라보잡. All rights reserved.</span>
	<p></p>
</footer>
</body>
</html>