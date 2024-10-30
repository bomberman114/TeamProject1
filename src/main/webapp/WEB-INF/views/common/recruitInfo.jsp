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

       .link-container {
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
       }

       .resume-item {
            margin: 10px 0;
       }
    </style>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            const resumeListEl = document.getElementById('resumeList');
            const linkContainer = document.querySelector('.link-container'); // link-container 요소 가져오기
            const company_recruit_idxEl = document.getElementById('company_recruit_idx');
			let company_recruit_idx = company_recruit_idxEl.value;
			
            resumeListEl.onclick = function(event) {
                event.preventDefault(); // 기본 링크 클릭 동작 방지

                // AJAX 요청
                fetch('/Resume/ResumeListSubmit')
                    .then(response => response.json())
                    .then(data => {
                        console.log(data); // 서버에서 받은 데이터 처리

                        // linkContainer 초기화
                        linkContainer.innerHTML = '';

                        // 데이터가 있는 경우
                        if (data && data.length > 0) {
                            data.forEach((resume, index) => {
                            	console.log(company_recruit_idx);
                            	//alert(resume.user_title);
                                // 이력서 제목과 체크박스를 포함하는 HTML 생성
                                const resumeItem = document.createElement('div');
                                resumeItem.className = 'resume-item';
                                resumeItem.innerHTML = 
                                	'<input type="radio" name="selectedResume" id="resume' + index + 
                                    '" value="' + resume.user_resume_idx + '">' + 
                                    '<label for="resume' + index + '">' + resume.user_title + '</label>' +
                                    '<a href="/Resume/ResumeSubmit?user_resume_idx=' + resume.user_resume_idx +'&company_recruit_idx=' + company_recruit_idx + '">이력서내기</a>';
                                linkContainer.appendChild(resumeItem);
                            });
                        } else {
                            alert("이력서가 없습니다.");
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
    <div class="container">
        <h1>채용공고</h1>
        <div class="info-box">
	            <input type="hidden" id="company_recruit_idx" value="${ companyOneRecruit.COMPANY_RECRUIT_IDX }">
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
        
        <div class="link-container">
            <!-- 이력서 제목과 체크박스가 여기에 동적으로 추가됩니다. -->
        </div>
        <c:if test="${message eq '지원가능'}">
        	<a href="#" id="resumeList">이력서 들고오기</a>
    	</c:if>
    	<c:if test="${ message eq '지원불가능' }">
    		<div>${ message }</div>
    	</c:if>
    </div>
</body>
</html>
</html>