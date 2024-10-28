<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원가입</title>
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
    <form action="/Users/Register" method="POST" id="form">
    <table>
	 <tr>
      	<td><span class="red">*</span>아이디</td>
      	<td>
      		<input type="text"    name="user_id" />
      		<input type="button"  id="checkDuplication"  value="중복확인" />
      		<span id="dupResult"></span>
      	</td>
     </tr>
	 <tr>
	  	<td><span class="red">*</span>비밀번호</td>
      	<td><input type="password" name="user_passwd" id="pass_wd1" /></td>
     </tr>
     <tr>
      	<td><span class="red">*</span>비밀번호 확인</td>
      	<td><input type="password" id="pass_wd2" /></td>
     </tr>
     <tr>
      	<td><span class="red">*</span>이름</td>
      	<td><input type="text" name="user_name" /></td>
     </tr>
	 <tr>
	 	<td><span class="red">*</span>연락처</td>
		<td><input type="text" name="user_phone" placeholder="-없이 입력해주세요">
	 </tr>
	<tr>
	    <td>이메일</td>
	    <td>
	        <input type="email" id="user_email" name="user_email" placeholder="이메일 입력" required />
	    </td>
	    <td>
	        <select id="email_domain">
	            <option value="" selected>직접입력</option> <!-- 기본 선택값으로 설정 -->
	            <option value="gmail.com">gmail.com</option>
	            <option value="naver.com">naver.com</option>
	            <option value="kakao.com">kakao.com</option>
	            <option value="yahoo.com">yahoo.com</option>
	            <option value="outlook.com">outlook.com</option>
	        </select>
	    </td>
	</tr>
	 <tr>
		<td colspan="2">
       		<input type="submit" value="등록" />
       		<input type="button" value="목록" id="goList" />
       	</td>
     </tr>
    
    </table>    
    </form>

	<script>
	    const formEl       		 = document.querySelector('form');
	    const useridEl     		 = document.querySelector('[name=user_id]');
	    const passwd1El    		 = document.querySelector('#pass_wd1');
	    const passwd2El    		 = document.querySelector('#pass_wd2');
	    const usernameEl   	     = document.querySelector('[name=user_name]');
	    const phoneEl   	     = document.querySelector('[name=user_phone]');
	    const checkDuplicationEl = document.querySelector('#checkDuplication');
	    let   dupCheckClicked 	 = false;
	    
	    const emailInput = document.getElementById('user_email');
	    const emailDomain = document.getElementById('email_domain');

	    // 도메인 선택 시 입력값 업데이트
	    emailDomain.addEventListener('change', function() {
	        const selectedDomain = this.value;
	        if (selectedDomain) {
	            emailInput.value = emailInput.value.split('@')[0] + '@' + selectedDomain;
	        } else {
	            emailInput.value = emailInput.value.split('@')[0]; // 직접 입력
	        }
	    });
	    
	    checkDuplicationEl.onclick = function() {
	        const useridInput = useridEl.value.trim();
	        console.log('User ID Input:', useridInput); // Debugging line

	        if (useridInput == '') {
	            alert("아이디를 입력하세요");
	            useridEl.focus();
	            return;
	        }
	        
	        fetch('/Users/CheckDuplication?user_id=' + useridInput)
	        .then((response) => response.text())
	        .then((data) => {
				console.log(useridInput)
	            if (data.trim() == "가능") {
	            	let html = useridInput + '은(는) 사용가능한 아이디입니다';
                    dupCheckClicked = true;
                    $('#dupResult').html(html).addClass('green')
	                checkDuplicationEl.setAttribute("data-checked", "true");
	            } else {
	            	let html = useridInput + '은(는) 사용할 수 없는 아이디입니다'
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
			if(useridEl.value.trim() == ''){
				alert("아이디를 입력하세요")
				useridEl.focus();
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
			if(usernameEl.value.trim() == ''){
				alert("이름를 입력하세요")
				usernameEl.focus();
				return false;
			}
			if(phoneEl.value.trim() == ''){
				alert("연락처를 입력하세요")
				usernameEl.focus();
				return false;
			}
			return true;
		  }
	      const  goListEl = document.getElementById('goList')
	      goListEl.onclick = function() {
	         location.href = '/home'
	      }
    	</script>
	
	</main>
</body>
</html>