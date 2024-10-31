<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&display=swap" rel="stylesheet">    
    <script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
      <style>
        body {
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            text-align: center;
            font-family: "Jua", serif;
        }

        .header {
            background-color: #ffffff;
            color: black;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            border-bottom: 2px solid #470065;
            
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #EBFFEE;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            
        }

        .info-box {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 18px;
            text-align: left;
            padding-bottom: 10px; 
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15); 
          
        }

        h1 {
            color: #470065;
            font-size: 35px;
            margin-bottom: 20px;
        }

        .info-item {
            font-size: 18px;
            margin: 10px 0;
            margin-left: 30px;
            font-weight: bold;
            text-align: left;
        }

        .highlight {
            color: #2e8b57;
        }

        .link-container {
            display: flex;
             justify-content: center;
             margin: 20px 0;
              max-width: 600px; /* 고정된 최대 너비 */
              width: 100%; /* 화면 크기에 따라 적응 */
             margin: 0 auto;
        
          }

        .link-box {
            flex: 1;
            max-width: 280px; /* 각 링크 박스의 고정된 최대 너비 */
            background-color: #EBFFEE;
            color: #470065;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin: 10px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
        
        }

        .link-box:hover {
            background-color: #DFF5E1;
        }

        .no-offers {
            font-size: 18px;
            color: #2e8b57;
            margin-top: 20px;
        }

       .button {  
            background-color: #EBFFEE;
            color: #470065;
            padding: 10px 20px;
            border-radius: 8px;
            text-align: center;
            font-size: 20px;
            margin: 10px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
            border: none; /* 테두리 제거 */
            font-weight: bold;
       }

         .button:hover {
            background-color: #495057;
       }
       
        .delete-container {
            text-align: center; /* 중앙 정렬 */
        }
     
        form {
            text-align: center;
        }
          
        footer {
            text-align: center;
            font-family: "Jua", serif;
        }
      
        .logo-container {
            margin-top: 20px; 
            margin-bottom: 10px;
            text-align: center;
        }

      
    </style>
</head>
<body>
 <header class="logo-container">
        <a href="/">
          <img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
     <div class="link-container">
        <a href="/Users/View?user_id=${user.user_id}" class="link-box">내 정보</a>
         <a href="/Resume/RegisterResumeForm?user_id=${user.user_id}" class="link-box">이력서 작성</a>
       <a href="/Resume/ResumeList?user_id=${user.user_id}" class="link-box">이력서 목록</a>
    </div>
     <div class="container">
     	<h1>내 정보</h1>
		<div class="info-box">
		    <form action="/Users/CheckPassword?user_id=${ userLogin.user_id }" METHOD="POST">
		        <div class="info-item">아이디: <span class="highlight" data-name="user_id">${user.user_id}</span></div>
		        <div class="info-item">비밀번호: <span class="highlight">${user.user_passwd}</span></div>
		        <div class="info-item">이름: <span class="highlight">${user.user_name}</span></div>
		        <div class="info-item">연락처: <span class="highlight">${user.user_phone}</span></div>
		        <div class="info-item">이메일: <span class="highlight">${user.user_email}</span></div>
		        <input type="submit" class="button" value="회원 수정"/>
		    </form>
		    <div class="delete-container">
		    <input type="button" id="delete" class="button" value="회원 탈퇴" />
			</div>
		</div>
    </div>
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        </button>
                    <div class="modal-body">
                        <p id="deleteMessage"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-danger" id="confirmDelete">삭제</button>
                    </div>
                </div>
            </div>
        </div>
        

        <script>
            const user_id = document.querySelector('[data-name=user_id]').innerText;
            
            const deleteBtn = document.getElementById('delete');
            deleteBtn.onclick = function() {
                document.getElementById('deleteMessage').innerText = user_id + " 계정을 정말 삭제하시겠습니까?";
                $('#deleteModal').modal('show');
                document.getElementById('confirmDelete').onclick = function() {
                    location.href = '/Users/Delete?user_id=' + user_id;
                };
            };
        </script> 
	    <footer>
	        <br/><span>이메일 : help@arabojob.co.kr<br/> Fax : 02-0000-0000(대표)</span><br/>
	    </footer>
</body>
</html>
