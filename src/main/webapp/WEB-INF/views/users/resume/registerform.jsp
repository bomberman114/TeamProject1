<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인회원가입</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
		html, body {
		    height: 100%; /* 전체 높이를 100%로 설정 */
		    margin: 0; /* 기본 마진 제거 */
		}
		
		body {
		    font-family: 'Arial', sans-serif;
		    background-color: #EBFFEE; /* 배경색 */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh; /* 전체 높이 설정 */
		}
		
		main {
		    max-height: 90vh; /* 최대 높이를 90vh로 설정 */
		    overflow-y: auto; /* 세로 스크롤 가능하게 설정 */
		    background-color: #ffffff; /* 흰색 배경 */
		    padding: 40px;
		    border-radius: 15px;
		    box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
		    width: 100%;
		    max-width: 900px;
		}
		
		h2 {
		    font-size: 30px;
		    text-align: center;
		    margin-bottom: 30px;
		    color: #470065; /* 제목 색상 */
		}
		
		label {
		    font-weight: bold;
		    margin-bottom: 5px;
		    color: #333; /* 검은색 텍스트 */
		}
		
		input[type="text"], input[type="password"], input[type="email"], textarea, select {
		    width: 100%;
		    padding: 12px;
		    border: 1px solid #ccc; /* 연한 회색 테두리 */
		    border-radius: 8px;
		    transition: border-color 0.3s, box-shadow 0.3s;
		}
		
		input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus, textarea:focus, select:focus {
		    border-color: #470065; /* 포커스 시 테두리 색상 */
		    box-shadow: 0 0 8px rgba(71, 0, 101, 0.5);
		}
		
		textarea {
		    height: 150px;
		    resize: vertical;
		}
		
		button, input[type="submit"], a {
		    background-color: #470065; /* 버튼 색상 */
		    color: white; /* 흰색 텍스트 */
		    border: none;
		    padding: 14px;
		    border-radius: 8px;
		    cursor: pointer;
		    font-size: 16px;
		    transition: background-color 0.3s;
		    width: 100%;
		    text-decoration: none; /* 링크 기본 스타일 */
		}
		
		button:hover, input[type="submit"]:hover, a:hover {
		    background-color: #5A4FCF; /* 호버 시 색상 */
		}
		
		.input-container, .checkbox-group, .form-group {
		    margin-bottom: 20px;
		}
		
		.skill-category {
		    border-top: 2px solid #470065; /* 위쪽에 선 추가 */
		    font-weight: bold;
		    color: #470065;
		    padding-top: 10px; /* 선과 텍스트 사이의 여백 */
		    margin-top: 20px; /* 카테고리와 위쪽 요소 간 여백 */
		}
		
		.skill-item {
		    font-weight: lighter;
		    font-size: 12px;
		    color: #333; /* 검은색 텍스트 */
		}
		
		.skill-item:last-child {
		    margin-bottom: 10px;
		    padding-bottom: 10px;
		}
		
		.address-container input {
		    margin-top: 10px;
		}
		
		/* 링크 스타일 */
		a {
		    color: #470065; /* 링크 색상 */
		    text-decoration: none; /* 밑줄 제거 */
		    font-weight: bold; /* 링크 텍스트 굵게 */
		    display: block; /* 블록 요소로 변경하여 여백 추가 */
		    margin: 10px 0; /* 여백 추가 */
		}
		
		a:hover {
		    color: #333; /* 호버 시 색상 변경 */
		}
		
		/* 결과 메시지 스타일 */
		#dupResult {
		    margin-top: 10px;
		    font-weight: bold;
		}
		
		.green {
		    color: green; /* 성공 메시지 색상 */
		}
		
		.red {
		    color: red; /* 오류 메시지 색상 */
		}

    </style>
</head>
<body>
    <main>
        <h2>이력서 작성하기</h2>
        <form action="/Resume/RegisterResume" method="POST" id="form">
         <input type="hidden" name="user_id" value="${user_id}">
             <div class="form-group">
                <label><span class="red">*</span> 제목</label>
                <input type="text" name="user_title" required />
            </div>
            <div class="form-group">
                <label><span class="red">*</span>이름</label>
                <input type="text" name="user_name" value="${user_name}" readonly />
            </div>
            <div class="form-group">
                <label><span class="red">*</span>생일</label>
                <input type="date" id="dateInput" required />
    			<input type="text" name="user_birth" id="textOutput" placeholder="YYYY-MM-DD" required readonly/>
            </div>
            <div class="form-group">
	           	<label><span class="red">*</span>이메일</label>
			        <input type="email" id="user_email" name="user_email" value="${user_email}" placeholder="이메일 입력" required/>
			        <select id="email_domain" onchange="updateEmail()">
			            <option value="" selected>직접입력</option> <!-- 기본 선택값으로 설정 -->
			            <option value="gmail.com">gmail.com</option>
			            <option value="naver.com">naver.com</option>
			            <option value="kakao.com">kakao.com</option>
			            <option value="yahoo.com">yahoo.com</option>
			            <option value="outlook.com">outlook.com</option>
			            <option value="green.com">green.com</option>
			        </select>
            </div>
            
            <div class="form-group">
                <label><span class="red">*</span>연락처</label>
                <input type="text" name="user_phone" value="${user_phone}" readonly />
            </div>
        
            <div class="input-container"><span class="red">*</span>사용 스킬
                <div class="skill-category">백엔드</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '백엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="skill-category">프론트엔드</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '프론트엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="skill-category">데이터베이스</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '데이터베이스'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="skill-category">모바일</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '모바일'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="skill-category">협업툴</div>
                <div class="checkbox-group">
                    <c:forEach var="skillList" items="${skillList}">
                        <c:if test="${skillList.skill_stack eq '협업툴'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${skillList.skill_name}" />
                                <label for="skill_name_${skillList.skill_name}">${skillList.skill_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <!-- 지역 및 주소 -->
            <div class="input-container">
                <div class="address-container">
                    <label><span class="red">*</span>근무 희망 지역</label>
                    <select name="region_idx">
                        <c:forEach var="region" items="${regionList}">
                            <option value="${region.region_idx}">${region.region_name}</option>
                        </c:forEach>
                    </select>
                    <label><span class="red">*</span>거주지 상세 주소</label>
                    <div class="form-group">
                	<input type="text" name="region_address" id="roadFullAddr" required/>
                    </div>
					<button type="button" onclick="searchAddress()">주소 검색</button>
                </div>
            </div>

            <!-- 자소서 -->
            <div class="form-group">
                <label><span class="red">*</span> 자소서</label>
                <textarea name="user_intro" required>ㄴㄷㄹ</textarea>
            </div>

            <div class="action-container">
                <input type="submit" value="이력서 등록"  onclick="return validateCheckbox()" />
            	<a href="/Resume/ResumeList?user_id=${userLogin.user_id}">이력서 목록</a>
            </div>
        </form>
    </main>

    <script>
    function searchAddress() {
        window.open("/Resume/SearchAddress","pop","width=570,height=430, scrollbars=yes, resizable=yes");
    }
    function jusoCallBack(roadFullAddr){
    document.getElementById('roadFullAddr').value = roadFullAddr;
    }
    
    const dateInput = document.getElementById('dateInput');
    const textOutput = document.getElementById('textOutput');

    dateInput.addEventListener('change', function() {
        const selectedDate = new Date(dateInput.value);
        
        const formattedDate = String(selectedDate.getFullYear()) + '년 ' +
                              String(selectedDate.getMonth() + 1) + '월 ' +
                              String(selectedDate.getDate()) + '일';

        textOutput.value = formattedDate;
        console.log(typeof(textOutput.value), textOutput.value)
    });
   
    
    function updateEmail() {
        var emailInput = document.getElementById('user_email');
        var domainSelect = document.getElementById('email_domain');

        var selectedDomain = domainSelect.value;

        if (selectedDomain) {
            emailInput.value = emailInput.value.split('@')[0] + '@' + selectedDomain;
        } else {
            emailInput.value = emailInput.value.split('@')[0]; // 도메인 제거
        }
    }
    

    /* 스킬 필수 선택 */
	    function validateCheckbox() {
	        const checkboxes = document.querySelectorAll('input[name="skill_name"]');
	        const isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
	
	        if (!isChecked) {
	            alert("사용 스킬 중 하나 이상을 선택해주세요.");
	            
	            return false;
	        }
	        return true;
	    }
	</script>
	
</body>
</html>
