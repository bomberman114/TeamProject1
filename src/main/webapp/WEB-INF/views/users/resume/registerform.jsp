<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이력서 작성하기</title>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet">  
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
       header {
       margin-top:40px;
    text-align: center;
    margin-bottom: 40px; /* 로고와 내용 사이 간격 추가 */
  
}

html, body {
    height: 100%; /* 전체 높이를 100%로 설정 */
    margin: 0; /* 기본 마진 제거 */
    overflow-y: scroll; /* 전체 페이지에 수직 스크롤바를 항상 표시 */
}

body {
    font-family: "Jua", serif;
    background-color: #ffffff; /* 배경색을 흰색으로 변경 */
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 중앙 정렬 */
}

main {
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 50%; /* 메인 요소의 너비를 90%로 설정 (기존 100%에서 줄임) */
    max-width: 500px; /* 최대 너비는 그대로 유지 */
    background-color: #ffffff; /* 흰색 배경 */
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

.input-container, .checkbox-group, .form-group {
    margin-bottom: 20px;
    width: 100%; /* 부모 요소 너비를 70%로 설정 (기존 80%에서 줄임) */
}

input[type="text"], input[type="password"], input[type="email"], textarea, select {
    width: calc(100% - 24px); /* 패딩 및 테두리를 고려하여 너비를 조정 */
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

button, input[type="submit"] {
    background-color: #470065; /* 보라색 배경 */
    color: white; /* 흰색 텍스트 */
    border: none;
    padding: 14px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
    width: 100%;
}

button:hover, input[type="submit"]:hover {
    background-color: #5A4FCF; /* 호버 시 색상 */
}

.skill-category {
    border-top: 2px solid #470065; /* 위쪽에 선 추가 */
    font-weight: bold;
    color: #470065;
    padding-top: 10px; /* 선과 텍스트 사이의 여백 */
    margin-top: 20px; /* 카테고리와 위쪽 요소 간 여백 */
}

.category-bar {
    cursor: pointer;
    padding: 10px;
    background-color: #eee;
    border-radius: 4px;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border: 1px solid;
    font-weight: bold;
}

.category-bar:hover {
    background-color: #ddd;
}

.checkbox-group {
    display: none; /* 기본적으로 숨김 */
    flex-wrap: wrap;
}

.checkbox-group label {
    margin-right: 20px;
    margin-bottom: 10px;
}

.checkbox-group input {
    margin-right: 5px;
}

.logo-link {
    background-color: transparent; /* 로고 링크의 배경색을 투명으로 설정 */
}

    </style>
</head>
<body>
    <header class="logo-container">
        <a href="/Users/View?user_id=${userLogin.user_id}" class="logo-link">
            <img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
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
                    <option value="" selected>직접입력</option>
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
                <!-- 백엔드 섹션 -->
                <div class="category-bar" onclick="toggleSection('backendSkills', this)">
                    <span>백엔드</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="backendSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '백엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>    
                    </c:forEach>
                </div>

                <!-- 프론트엔드 섹션 -->
                <div class="category-bar" onclick="toggleSection('frontendSkills', this)">
                    <span>프론트엔드</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="frontendSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '프론트엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>
                                 </c:forEach>
                </div>

                <!-- 데이터베이스 섹션 -->
                <div class="category-bar" onclick="toggleSection('dbSkills', this)">
                    <span>데이터베이스</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="dbSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '데이터베이스'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>    
                    </c:forEach>
                </div>

                <!-- 모바일 섹션 -->
                <div class="category-bar" onclick="toggleSection('mobileSkills', this)">
                    <span>모바일</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="mobileSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '모바일'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>    
                    </c:forEach>
                </div>

                <!-- 협업툴 섹션 -->
                <div class="category-bar" onclick="toggleSection('collaborationTools', this)">
                    <span>협업툴</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="collaborationTools" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '협업툴'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>    
                    </c:forEach>
                </div>

                <!-- 지역 및 주소 -->
                <div class="input-container">
                    <div class="address-container">
                        <label><span class="red"></span>근무 희망 지역</label>
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
                    <label><span class="red"></span> 자기 소개서</label>
                    <textarea name="user_intro" required></textarea>
                </div>


                <div class="action-container">
                    <input type="submit" value="이력서 등록" onclick="return validateCheckbox()" />
                </div>
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
        
        function toggleSection(sectionId, element) {
            var section = document.getElementById(sectionId);
            var icon = element.querySelector(".toggle-icon");
            if (section.style.display === "none" || section.style.display === "") {
                section.style.display = "block";  // 섹션을 보여줍니다.
                icon.textContent = "▲";  // 펼쳐진 상태로 아이콘 변경.
            } else {
                section.style.display = "none";  // 섹션을 숨깁니다.
                icon.textContent = "▼";  // 닫힌 상태로 아이콘 변경.
            }
        };

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