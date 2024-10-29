<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보</title>
    <style>
       body {
    background-color: #ffffff;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
}

.header {
    background-color: #ffffff;
    color: black;
    padding: 20px;
    text-align: center;
    font-size: 24px;
    font-weight: bold;
}

.container {
    max-width: 1000px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

.info-box {
    background-color: #e6ffe6;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    border: 1px solid #b3ffb3;
}

h1 {
    color: #2e8b57;
    text-align: center;
    font-size: 28px;
    margin-bottom: 20px;
}

.info-item {
    font-size: 18px;
    margin: 10px 0;
    text-align: left;
    margin-left: 30px;
    font-weight: bold;
}

.highlight {
    font-weight: bold;
    color: #2e8b57;
}

/* 링크 박스가 컨테이너 밖에 위치하게 수정 */
.link-container {
    display: flex;
    justify-content: center;
    margin-bottom: 0px;
    margin-top: 20px; /* 박스와의 간격 조정 */
}

.link-box {
    background-color: #EBFFEE;
    color: green;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    width: 200px;
    margin: 10px;
    cursor: pointer;
    text-decoration: none;
    border: 1px solid;
}

.link-box:hover {
    background-color: #EBFFEE;
}

.no-offers {
    font-size: 18px;
    color: #2e8b57;
    text-align: center;
    margin-top: 20px;
}
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    const resumeListEl = document.getElementById('resumeList');

    resumeListEl.onclick = function(event) {
        event.preventDefault(); // 기본 링크 클릭 동작 방지
        //alert('ajax');

        // AJAX 요청을 보낼 부분
        // AJAX 요청
        fetch('/User/ResumeListSubmit')
            .then(response => response.json())
            .then(data => {
                console.log(data); // 서버에서 받은 데이터 처리

                // 데이터가 있는 경우와 없는 경우에 따른 alert 메시지
                if (data && data.length > 0) {
                   
                	
                	
                	
                } else {
                    alert("이력서 없습니다.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("데이터 요청 중 오류가 발생했습니다.");
            });
    };
});

 
</script>
</head>
<body>
    <!-- 링크 박스를 컨테이너 위로 이동 -->
    <div class="link-container">
    </div>

    <div class="header"></div>

    <!-- "내 회사 정보" 컨테이너 -->
    <div class="container">
        <h1>채용공고</h1>
        <div class="info-box">
	            <div class="info-item">채용공고 제목: <span class="highlight">${companyOneRecruit.RECRUIT_TITLE}</span></div>
	            <div class="info-item">회사 이름: <span class="highlight">${companyOneRecruit.COMPANY_NAME}</span></div>
	            <div class="info-item">스킬: <span class="highlight">${ companyOneRecruit.SKILL_NAME }</span></div>
	            <div class="info-item">모집부문: <span class="highlight">${companyOneRecruit.COMPANY_JOB}</span></div>
	            <div class="info-item">모집인원: <span class="highlight">${companyOneRecruit.GETMAN}</span></div>
	            <div class="info-item">근무지역: <span class="highlight">${companyOneRecruit.REGION_NAME}</span></div>
	            <div class="info-item">근무위치: <span class="highlight">${companyOneRecruit.COMPANY_ADDRESS}</span></div>
	            <div class="info-item">기업정보: <span class="highlight">${companyOneRecruit.COMPANY_INFO}</span></div>
	            <div class="info-item">접수기간: <span class="highlight">${companyOneRecruit.APPLICATION_DEADLINE}</span></div>
	            <div class="info-item">기업설립일: <span class="highlight">${companyOneRecruit.COMPANY_ESTABLISH}</span></div>
        </div>
        
        <a href="#"  id="resumeList" >지원하기</a>
        
        
    </div>
</body>
</html>