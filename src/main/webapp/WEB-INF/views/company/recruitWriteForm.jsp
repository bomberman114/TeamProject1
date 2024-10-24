<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    font-size: 24px;
    margin-bottom: 10px;
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

</style>
<script type="text/javascript">
	const skill_nameEl = document.getquerySelector('skill_name'); 	
	let skill_name = skill_nameEl.value;
	console.log(skill_name);
</script>
</head>
<body>
  <div class="container">
        <h1>채용공고</h1>
        
        <form action="/Company/RecruitWrite">
        	<div class="input-container">
	            <input type="hidden"  name="company_id" value="${ companyUserVo.company_id }">
	            공고제목<input type="text" placeholder="제목" name="recruit_title">
	            회사이름<input type="text" placeholder="회사이름" name="company_name" value="${ companyUserVo.company_name }">
	           <p>백엔드</p>
				<c:forEach var="skillList" items="${ skillList }">
				    <c:if test="${ skillList.skill_stack eq '백엔드'}">
				        <div>
				            <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
				            <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
				        </div>
				    </c:if>    
				</c:forEach>
				
				<p>프론트엔드</p>
				<c:forEach var="skillList" items="${ skillList }">
				    <c:if test="${ skillList.skill_stack eq '프론트엔드'}">
				        <div>
				            <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
				            <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
				        </div>
				    </c:if>    
				</c:forEach>
				
				<p>데이터베이스</p>
				<c:forEach var="skillList" items="${ skillList }">
				    <c:if test="${ skillList.skill_stack eq '데이터베이스'}">
				        <div>
				            <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
				            <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
				        </div>
				    </c:if>    
				</c:forEach>
				
				<p>모바일</p>
				<c:forEach var="skillList" items="${ skillList }">
				    <c:if test="${ skillList.skill_stack eq '모바일'}">
				        <div>
				            <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
				            <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
				        </div>
				    </c:if>    
				</c:forEach>
				
				<p>협업툴</p>
				<c:forEach var="skillList" items="${ skillList }">
				    <c:if test="${ skillList.skill_stack eq '협업툴'}">
				        <div>
				            <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }">
				            <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
				        </div>
				    </c:if>    
				</c:forEach><br>
	            모집부문<input type="text" placeholder="모집부문" name="company_job">
	            모집인원<input type="text" placeholder="모집인원" name="getman">
		        근무지역<select name="region_idx">
	            	<c:forEach var="regionList" items="${ regionList }">
		            	<option value="${ regionList.region_idx }">${ regionList.region_name }</option>
	            	</c:forEach>
		        </select><br><br>
	            근무주소    <input type="text" placeholder="근무주소" name="company_address">
	            채용공고기간<input type="text" placeholder="채용공고기간" name="application_deadline">
	            회사설립일  <input type="text" placeholder="회사설립일" name="company_establish">
	            회사설명    <textarea placeholder="회사설명" name="company_info"></textarea>
        	</div>
        	<input class="save-button" type="submit" value="공고저장">
         </form>
        
    </div>
</body>
</html>