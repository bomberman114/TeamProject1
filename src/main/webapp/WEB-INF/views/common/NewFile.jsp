<%
		String id = (String)session.getAttribute("id");
		UserVO userVo = getUserbyId(user_id);
		
	%>
	<nav class="navbar navbar-default">
	 <div class="navbar-header">
	  <button type="button" class="navbar-toggle collapsed"
	  	data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
	  	aria-expanded="false">
		 	<span class="icon-bar"></span>
		 	<span class="icon-bar"></span>
		 	<span class="icon-bar"></span>
		 </button>
		 <a class="navbar-brand" href="main.jsp">AR 웹페이지</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		 <ul class="nav navbar-nav">
		  <li class="active"><a href="main.jsp">메인</a>
		 </ul>
		 
		 <ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
		   <a href="#" class="dropdown-toggle"
		   	data-toggle="dropdown" role="button" aria-haspopup="true"
		   	aria-expanded="false"><%=id %>님 환영합니다.<span class="caret"></span>
		   </a>
		   <ul class="dropdown-menu">
		   	<li><a href="logoutAction.jsp">로그아웃</a></li>
		   	<li><a href="modifyForm.jsp">회원정보수정</a></li>
		   	<li><a href="deleteForm.jsp">회원탈퇴</a></li>
		   </ul>
		  </li>
		 </ul>
		</div>
	</nav>
	<div class="container">
	 <form method="post" action="deleteProc.jsp" name="delete" onsubmit="return checkPass()">
	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr>
	     <th colspan="3"><h4>회원탈퇴</h4></th>
	    </tr>
	   </thead>
	    <tbody>
	    <tr>
	      <td style="width:110px;"><h5>아이디</h5></td>
	      <td><h5><%=vo.getId() %></h5>
	      <input type="hidden" name="id" value="vo.getId()%>"></td>
	     </tr>
		 <tr>
	      <td style="width:150px;"><h5>비밀번호입력 : </h5></td>
	      <td colspan="3"><input class="form-control" id="userPassword1" type="password" name="pass" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
	     </tr>
	   	<tr>
			<td colspan="2" align="center">
			<input class="btn btn-primary" type="button" value="회원탈퇴" onClick="inputCheck()"/>&nbsp;&nbsp;
			<input class="btn btn-primary" type="reset" value="취소" onclick="javascript:window.location='main.jsp'">
			</td>
			<td style="text-align: left;" colspan="3"><h5 style="color: red;" id="passwordCheckMessage"></h5>   
		</tr>				
  			</tbody>
  		</table>
	</form>
  </div>
</body>
</html>
출처: https://arang95.tistory.com/43 [AR삽질러:티스토리]