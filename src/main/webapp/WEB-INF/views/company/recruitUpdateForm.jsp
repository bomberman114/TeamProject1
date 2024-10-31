<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff;
            font-family: "Jua", sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #EBFFEE;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            font-weight: bold;
        }

        h1 {
            color: #470065;
            font-size: 36px;
            margin-bottom: 20px;
        }

        .input-container {
            margin-bottom: 20px;
            text-align: left;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            margin-bottom: 15px;
            font-size: 16px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            height: 80px;
        }

        .save-button {
            width: 100%;
            padding: 12px;
            background-color: #343a40;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .save-button:hover {
            background-color: #495057;
        }

        .category-bar {
            cursor: pointer;
            padding: 12px;
            background-color: #eee;
            border-radius: 8px;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
            color: #495057;
            border: 1px solid #ced4da;
        }

        .category-bar:hover {
            background-color: #ddd;
        }

        .checkbox-group {
            display: none;
            flex-wrap: wrap;
            padding: 10px;
        }

        .checkbox-group label {
            margin-right: 20px;
            margin-bottom: 10px;
        }

        .checkbox-group input {
            margin-right: 5px;
        }

        select {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ced4da;
            background-color: #f8f9fa;
            font-size: 16px;
            color: #495057;
            cursor: pointer;
            appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="%23495057" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 12px;
        }

        select:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        
        
        footer {
            text-align: center;
            font-family: "Jua", sans-serif;
            padding: 20px;
            margin-top: 20px;
        }
        
        textarea {
            font-family: "Jua", serif; /* 원하는 폰트로 변경 */
            font-size: 16px; /* 폰트 크기도 조정할 수 있습니다 */      
            color: #333; /* 텍스트 색상 조정 */
            padding: 10px; /* 내부 여백 조정 */
            border: 1px solid #ccc; /* 테두리 색상 조정 */
            border-radius: 5px; /* 모서리 둥글게 */
            box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            width: 100%; /* 폭을 100%로 설정 */
            box-sizing: border-box; /* 패딩과 테두리를 포함한 박스 모델 사용 */
        }
        input[type="text"] {
            font-family: "Jua", serif; /* 원하는 폰트로 변경 */
            font-size: 16px; /* 폰트 크기도 조정할 수 있습니다 */      
            color: #333; /* 텍스트 색상 조정 */
            padding: 10px; /* 내부 여백 조정 */
            border: 1px solid #ccc; /* 테두리 색상 조정 */
            border-radius: 5px; /* 모서리 둥글게 */
            box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            width: 100%; /* 폭을 100%로 설정 */
            box-sizing: border-box; /* 패딩과 테두리를 포함한 박스 모델 사용 */
        }
        
        
    </style>

    <script type="text/javascript">
        function toggleSection(sectionId, element) {
            var section = document.getElementById(sectionId);
            var icon = element.querySelector(".toggle-icon");
            if (section.style.display === "none" || section.style.display === "") {
                section.style.display = "block";
                icon.textContent = "▲";
            } else {
                section.style.display = "none";
                icon.textContent = "▼";
            }
        }
        
        window.onload = function(){
        	
       	 const today = new Date().toISOString().split('T')[0];  // 현재 날짜를 'yyyy-MM-dd' 형식으로 가져옴

            // 오늘부터 가능하도록 설정 (채용공고기간)
            const applicationDeadlineEl = document.querySelector('[name=application_deadline]');
            applicationDeadlineEl.setAttribute("min", today);

            // 현재까지의 날짜만 가능하도록 설정 (회사설립일)
            const companyEstablishEl = document.querySelector('[name=company_establish]');
            companyEstablishEl.setAttribute("max", today);
       	
       	const formEl = document.querySelector('#form');
       			formEl.onsubmit = function(event){
       			//event.preventDefault(); // 기본 제출 동작을 막음
       	        const regionSelect           = document.getElementById('regionSelect');
       	        const recruit_titleEl        = document.querySelector('[name=recruit_title]');
       	        const company_nameEl         = document.querySelector('[name=company_name]');
       	        const company_jobEl          = document.querySelector('[name=company_job]');
       	        const getmanEl               = document.querySelector('[name=getman]');
       	        const company_addressEl      = document.querySelector('[name=company_address]');
       	        const application_deadlineEl = document.querySelector('[name=application_deadline]');
       	        const company_establishEl    = document.querySelector('[name=company_establish]');
       	        const company_infoEl         = document.querySelector('[name=company_info]');
       	        if (recruit_titleEl.value == "") {
       	            alert("공고제목을 입력하세요.");
       	            recruit_titleEl.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	        if (regionSelect.value == "") {
       	            alert("지역을 선택하세요.");
       	            regionSelect.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	       
       	        if (company_jobEl.value == "") {
       	            alert("모집부분을 입력하세요.");
       	            company_jobEl.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	        if (getmanEl.value == "") {
       	            alert("모집인원을 입력하세요.");
       	            getmanEl.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	        if (company_addressEl.value == "") {
       	            alert("상세주소를 입력하세요.");
       	            company_addressEl.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	        if (application_deadlineEl.value == "") {
       	            alert("채용공고기간 입력하세요.");
       	            application_deadlineEl.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	        if (company_establishEl.value == "") {
       	            alert(" 회사설립일을 립력하세요.");
       	            company_establishEl.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	        if (company_infoEl.value == "") {
       	            alert("회사설명을 입력하세요.");
       	            company_infoEl.focus();  // 지역 선택 dropdown에 포커스를 줌
       	            return false;  // form 제출 방지
       	        }
       	        return true;  // 선택된 경우 form 제출
       		
       	};
       	
       };
    </script>
</head>
<body>
    <header class="logo-container">
        <a href="/Company/OneRecruit?company_recruit_idx=${companyOneRecruit.COMPANY_RECRUIT_IDX}">
    		<img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
<body>
    <div class="container">
        <h1>채용공고 수정</h1>
        
        <form action="/Company/RecruitUpdate" id="form">
            <div class="input-container">
                <input type="hidden" name="company_id" value="${ companyOneRecruit.COMPANY_ID }">
                <input type="hidden" name="company_recruit_idx" value="${ companyOneRecruit.COMPANY_RECRUIT_IDX }">
                
                <label>공고제목</label>
                <input type="text" placeholder="제목" name="recruit_title" value="${ companyOneRecruit.RECRUIT_TITLE }">
                
                <label>회사이름</label>
                <input type="text" placeholder="회사이름" name="company_name" value="${ companyOneRecruit.COMPANY_NAME }" readonly="readonly">

                <!-- 백엔드 섹션 -->
                <div class="category-bar" onclick="toggleSection('backendSkills', this)">
                    <span>백엔드</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="backendSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '백엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                                <c:forEach var="skillListCheck" items="${ companyOneRecruit.SKILL_NAME }">
                                    <c:if test="${ skillListCheck eq skillList.skill_name }">checked</c:if>
                                </c:forEach> />
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
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                                <c:forEach var="skillListCheck" items="${ companyOneRecruit.SKILL_NAME }">
                                    <c:if test="${ skillListCheck eq skillList.skill_name }">checked</c:if>
                                </c:forEach> />
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
                               <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                               <c:forEach var="skillListCheck" items="${ companyOneRecruit.SKILL_NAME }">
                                    <c:if test="${ skillListCheck eq skillList.skill_name }">checked</c:if>
                                   </c:forEach> />
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
                               <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                               <c:forEach var="skillListCheck" items="${ companyOneRecruit.SKILL_NAME }">
                                    <c:if test="${ skillListCheck eq skillList.skill_name }">checked</c:if>
                                   </c:forEach> />
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
                               <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                               <c:forEach var="skillListCheck" items="${ companyOneRecruit.SKILL_NAME }">
                                    <c:if test="${ skillListCheck eq skillList.skill_name }">checked</c:if>
                                   </c:forEach> />
                               <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                           </div>
                       </c:if>    
                   </c:forEach>
               </div>

                <!-- 추가된 기타 섹션들 생략 -->

                <label>모집부문</label>
                <input type="text" placeholder="모집부문" name="company_job" value="${ companyOneRecruit.COMPANY_JOB }">

                <label>모집인원</label>
                <input type="number" placeholder="모집인원" name="getman" value="${ companyOneRecruit.GETMAN }">
				<br><br>
                <label>근무지역</label>
                <select name="region_idx">
                    <option value="">---지역선택----</option>
                    <c:forEach var="regionList" items="${ regionList }">
                        <option value="${ regionList.region_idx }"
                        <c:if test="${ companyOneRecruit.REGION_IDX eq regionList.region_idx }">selected</c:if>>
                        ${ regionList.region_name }</option>
                    </c:forEach>
                </select>

                <label>상세근무주소</label>
                <input type="text" placeholder="근무주소" name="company_address" value="${ companyOneRecruit.COMPANY_ADDRESS }">

                <label>채용공고기간</label>
                <input type="date" placeholder="채용공고기간" name="application_deadline" value="${ companyOneRecruit.APPLICATION_DEADLINE }">
				<br><br>
                <label>회사설립일</label>
                <input type="date" placeholder="회사설립일" name="company_establish"
      				 value="<fmt:formatDate value='${companyOneRecruit.COMPANY_ESTABLISH}' pattern='yyyy-MM-dd'/>">				<br><br>
                <label>회사설명</label>
                <textarea placeholder="회사설명" name="company_info">${ companyOneRecruit.COMPANY_INFO }</textarea>
            </div>
            <input class="save-button" type="submit" value="공고수정">
        </form>
    </div>
    
    
    <footer>
        <p>이메일 : help@arabojob.co.kr <br/> Fax : 02-0000-0000(대표)</p>
    </footer>
</body>
</html>