<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<div>
			<c:forEach var="companyRecruit" items="${ companyRecruitList }">
				<input type="hidden" name="company_recruit_idx" value="${companyRecruit.company_recruit_idx }">
				<div>${ companyRecruit.idx }</div>
			</c:forEach>
		</div>
	</main>

	
</body>
</html>