<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 작성</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background-color: #EBFFEE;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    font-weight: bold;
}

h1 {
    font-size: 36px;
    margin-bottom: 40px;
    
}

.input-container {
    margin-bottom: 20px;
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ced4da;
    border-radius: 4px;
}

textarea {
    resize: vertical;
    height: 80px;
}

.save-button {
    width: 100%;
    padding: 10px;
    background-color: #343a40;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

.save-button:hover {
    background-color: #495057;
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

select {
    width: 100%;
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #ced4da;
    background-color: #f8f9fa;
    font-size: 16px;
    color: #495057;
    appearance: none; /* 기본 화살표 제거 */
    background-image: url('data:image/svg+xml;utf8,<svg fill="%23495057" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>'); /* 화살표 추가 */
    background-repeat: no-repeat;
    background-position: right 10px center;
    background-size: 12px;
    cursor: pointer;
    position: relative; /* 아래로 펼쳐지도록 설정 */
    z-index: 1; /* 다른 요소들과의 충돌 방지 */
}

select:focus {
    border-color: #80bdff;
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    z-index: 2; /* 포커스 시 드롭다운이 맨 위로 나오도록 */
}
</style>

<script type="text/javascript">
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
    }
</script>

</head>
<body>
  <div class="container">
        <h1>채용공고 수정</h1>
        
        <form action="/Company/RecruitUpdate" id="form">
        	<div class="input-container">
        		<input type="hidden" name="company_id" value="${ companyOneRecruit.COMPANY_ID }">
        		<input type="hidden" name="company_recruit_idx" value="${ companyOneRecruit.COMPANY_RECRUIT_IDX }">
	            공고제목<input type="text" placeholder="제목" name="recruit_title" value="${ companyOneRecruit.RECRUIT_TITLE }">
	            회사이름<input type="text" placeholder="회사이름" name="company_name" value="${ companyOneRecruit.COMPANY_NAME }" readonly="readonly">

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

	            모집부문<input type="text" placeholder="모집부문" name="company_job" value="${ companyOneRecruit.COMPANY_JOB }">
	            모집인원<input type="text" placeholder="모집인원" name="getman" value="${ companyOneRecruit.GETMAN }">
		        근무지역<select name="region_idx">
		            <option>---지역선택----</option>
	            	<c:forEach var="regionList" items="${ regionList }">
		            	<option value="${ regionList.region_idx }"
                        	<c:if test="${ companyOneRecruit.REGION_IDX eq regionList.region_idx }">selected</c:if>
		            	>${ regionList.region_name }</option>
	            	</c:forEach>
		        </select><br><br>
	            상세근무주소    <input type="text" placeholder="근무주소" name="company_address" value="${ companyOneRecruit.COMPANY_ADDRESS }">
	            채용공고기간    <input type="text" placeholder="채용공고기간" name="application_deadline" value="${ companyOneRecruit.APPLICATION_DEADLINE }">
	            회사설립일      <input type="text" placeholder="회사설립일" name="company_establish" value="${ companyOneRecruit.COMPANY_ESTABLISH }">
	            회사설명        <textarea placeholder="회사설명" name="company_info">${ companyOneRecruit.COMPANY_INFO }</textarea>
        	</div>
        	<input class="save-button" type="submit" value="공고수정">
        </form>
    </div>
</body>
</html>