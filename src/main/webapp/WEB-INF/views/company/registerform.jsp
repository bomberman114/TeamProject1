<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원가입</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
        <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f8ff; /* Light background color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        main {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px; /* Increased width for better usability */
        }
        h2 {
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
            color: #333; /* Darker text color */
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 12px;
            vertical-align: middle;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s, box-shadow 0.3s; /* Smooth transition */
        }
        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #6A5ACD; /* Change border color on focus */
            box-shadow: 0 0 5px rgba(106, 90, 205, 0.5); /* Add shadow on focus */
        }
        button {
            background-color: #6A5ACD;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px; /* Increased font size */
            transition: background-color 0.3s; /* Smooth transition */
        }
        button:hover {
            background-color: #5A4FCF; /* Darker shade on hover */
        }
        #dupResult {
            margin-top: 10px;
            font-weight: bold;
        }
        .green {
            color: green; /* Success color */
        }
        .red {
            color: red; /* Error color */
        }
    </style>

</head>
<body>
  <main>  
    <h2>회원가입</h2>
    <form action="/Company/Register" method="POST" id="form">
    <table>
	 <tr>
      	<td><span class="red">*</span>아이디</td>
      	<td>
      		<input type="text"    name="company_id" />
      		<input type="button"  id="checkDuplication"  value="중복확인" />
      		<span id="dupResult"></span>
      	</td>
     </tr>
	 <tr>
	  	<td><span class="red">*</span>비밀번호</td>
      	<td><input type="password" name="company_passwd" id="pass_wd1" /></td>
     </tr>
     <tr>
      	<td><span class="red">*</span>비밀번호 확인</td>
      	<td><input type="password" id="pass_wd2" /></td>
     </tr>
     <tr>
      	<td><span class="red">*</span>이름</td>
      	<td><input type="text" name="company_user_name" /></td>
     </tr>
     <tr>
      	<td><span class="red">*</span>연락처</td>
      	<td><input type="text" name="company_phone" /></td>
     </tr>
     <tr>
      	<td><span class="red">*</span>회사명</td>
      	<td><input type="text" name="company_name" /></td>
     </tr>
     <tr>
      	<td><span class="red">*</span>사업자등록번호</td>
      	<td><input type="text" name="company_bcode" /></td>
     </tr>
	 <tr>
	 	<td><span class="red">*</span>대표자명</td>
		<td><input type="text" name="company_boss_name" /></td>
	 </tr>
	 	 <tr>
	 	<td><span class="red">*</span>공식 이메일</td>
		<td><input type="email" name="company_email" /></td>
	 </tr>
	 	 <tr>
	 	<td><span class="red">*</span>이메일</td>
		<td><input type="email" name="company_user_email" /></td>
	 </tr>
	 <tr>
	 	<td><span class="red">*</span>설립일</td>
		<td><input type="date" name="company_establish" required /></td>
	 </tr>
	 <tr>
		<td colspan="2">
       		<input type="submit" value="회원가입" />
       	</td>
     </tr>
    
    </table>    
    </form>

	<script>
	    const formEl       		 = document.querySelector('form');
	    const company_idEl       = document.querySelector('[name=company_id]');
	    const passwd1El    		 = document.querySelector('#pass_wd1');
	    const passwd2El    		 = document.querySelector('#pass_wd2');
	    const user_nameEl    	 = document.querySelector('[name=company_user_name]');
	    const phoneEl   	     = document.querySelector('[name=company_phone]');
	    const nameEl   	         = document.querySelector('[name=company_name]');
	    const bcodeEl   	     = document.querySelector('[name=company_bcode]');
	    const boss_nameEl   	 = document.querySelector('[name=company_boss_name]');
	    const emailEl   	     = document.querySelector('[name=company_email]');
	    const user_emailEl   	 = document.querySelector('[name=company_user_email]');
	    const establishEl   	 = document.querySelector('[name=company_estabilsh]');
	    const checkDuplicationEl = document.querySelector('#checkDuplication');
	    let   dupCheckClicked 	 = false;
      
	    checkDuplicationEl.onclick = function() {
	        const company_idInput = company_idEl.value.trim();
	        console.log('User ID Input:', company_idInput); // Debugging line

	        if (company_idInput == '') {
	            alert("아이디를 입력하세요");
	            company_idEl.focus();
	            return;
	        }
	        
	        //fetch('/CompanyUsers/CheckDuplication?company_id=' + company_idInput)
	        fetch('/Company/CheckDuplication?company_id=' + company_idInput)
	        .then((response) => response.text())
	        .then((data) => {
				console.log(company_idInput)
	            if (data.trim() == "가능") {
	            	let html = company_idInput + '은(는) 사용가능한 아이디입니다';
                    dupCheckClicked = true;
                    $('#dupResult').html(html).addClass('green')
	                checkDuplicationEl.setAttribute("data-checked", "true");
	            } else {
	            	let html = company_idInput + '은(는) 사용할 수 없는 아이디입니다'
	                dupCheckClicked = false;
	                $('#dupResult').html(html).addClass('red')
	                checkDuplicationEl.setAttribute("data-checked", "false");
	            }
	        })
	        .catch(error => {
	            console.error('Error during duplication check:', error);
	        });

	    }
	      
	      
	      //공백확인 및 등록
	   	  formEl.onsubmit=function(){
			if(company_idEl.value.trim() == ''){
				alert("아이디를 입력하세요")
				company_idEl.focus();
				return false;
			}
			if(checkDuplicationEl.onclick == false){
				alert("중복확인을 해주세요")
				return false;
			}
			if (passwd1El.value.trim() == ''){
				alert("비밀번호를 입력하세요")
				passwd1El.focus();
				return false;
			}
			if( passwd1El.value.trim() != passwd2El.value.trim() ) {
			   alert('비밀번호와 비밀번호확인이 일치하지 않습니다')
			   passwd2El.focus();
			   return false;
			}
			if(user_nameEl.value.trim() == ''){
				alert("이름를 입력하세요")
				usernameEl.focus();
				return false;
			}
			if(phoneEl.value.trim() == ''){
				alert("연락처를 입력하세요")
				usernameEl.focus();
				return false;
			}
			if(phoneEl.value.trim() == ''){
				alert("연락처를 입력하세요")
				phoneEl.focus();
				return false;
			}
			if(nameEl.value.trim() == ''){
				alert("회사명을 입력하세요")
				nameEl.focus();
				return false;
			}
			if(bcodeEl.value.trim() == ''){
				alert("사업자등록번호를 입력하세요")
				bcodeEl.focus();
				return false;
			}
			if(boss_nameEl.value.trim() == ''){
				alert("대표자명을 입력하세요")
				boss_nameEl.focus();
				return false;
			}
			if(emailEl.value.trim() == ''){
				alert("공식이메일을 입력하세요")
				emailEl.focus();
				return false;
			}
			if(user_emailEl.value.trim() == ''){
				alert("이메일을 입력하세요")
				user_emailEl.focus();
				return false;
			}
			if(company_establishEl.value.trim() == ''){
				alert("설립일을 입력하세요")
				company_establishEl.focus();
				return false;
			}
			if(dupCheckClicked == false ){
				alert('중복아이디입니다.');
				return false;
			};
			
			
			return true;
		  }
    	</script>
	
	</main>
</body>
</html>