<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
		body {
            background-color: #EBFFEE; 
        }
        table {
            margin: 20px auto;
            background-color: white; 
            border-radius: 8px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
        th, td {
            padding: 15px; 
        }
        input[type="button"] {
            background-color: #470065; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            padding: 10px 20px; /
            cursor: pointer; 
            transition: background-color 0.3s;
        }
        input[type="button"]:hover {
            background-color: #5a0072;
        }
    </style>
</head>
<body>
    <main>  
        <h2 class="text-center">회원 정보</h2>
        <table class="table table-bordered">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="user_id" value="${user.user_id}" readonly/></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="user_passwd" id="passwd1" value="${user.user_passwd}" readonly/></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="user_name" value="${user.user_name}" readonly/></td>
            </tr>
            <tr>
                <td>연락처</td>
                <td><input type="text" name="user_phone" value="${user.user_phone}" readonly /></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" name="user_email" value="${user.user_email}" readonly /></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <input type="button" value="수정하기" id="goUpdate" />
                    <input type="button" value="회원탈퇴" id="delete" />
                </td>
            </tr>
        </table>    

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
            const user_id = document.querySelector('[name=user_id]').value;
            const goUpdate = document.getElementById('goUpdate');

            goUpdate.onclick = function() {
                let  html     = '/Users/CheckPassword?user_id=' + user_id;
                let  name     = 'checkpasswd';  // 이름을 주면 새창은 한번만 열림
                let  features = 'height=300,width=500,top=250,left=800';
                window.open(html, name, features)
            }
            
            const deleteBtn = document.getElementById('delete');
            deleteBtn.onclick = function() {
                document.getElementById('deleteMessage').innerText = user_id + " 계정을 정말 삭제하시겠습니까?";
                $('#deleteModal').modal('show');
                document.getElementById('confirmDelete').onclick = function() {
                    location.href = '/Users/Delete?user_id=' + user_id;
                };
            };
        </script> 
    </main>
</body>
</html>
