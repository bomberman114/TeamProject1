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
</head>
<body>
  <div class="container">
        <h1>채용공고</h1>
        <p>We ship within 2 working days</p>
        
        <div class="input-container">
        	<form action="">
	            <input type="hidden"  name="company_id" value="${ company_id }">
	            <input type="text" placeholder="제목" name="recruit_title">
	            <input type="text" placeholder="기술스택" name="skill_stack">
	            <input type="text" placeholder="모집부문" name="company_job">
	            <input type="text" placeholder="모집인원" name="getman">
	            <c:forEach var="regionList" items="${ regionList }">
		            <select name="region_idx">
		            	<option value="${ regionList.region_idx }">${ regionList.region_name }</option>
		            </select>
	            </c:forEach>
	            <input type="text" placeholder="근무위치" name="region_idx">
	            <input type="text" placeholder="근무지역" name="company_address">
	            <input type="text" placeholder="채용공고기간" name="application_deadline">
	            <input type="text" placeholder="회사설립일" name="company_establish">
	            <textarea placeholder="회사설명" name="company_info"></textarea>
            </form>
        </div>
        
        <button class="save-button">Save shipping information</button>
    </div>
</body>
</html>