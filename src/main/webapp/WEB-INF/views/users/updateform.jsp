<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&display=swap" rel="stylesheet"> 
<style>
    body {
        background-color: #ffffff; 
        font-family: "Jua", serif;
        display: flex;
        flex-direction: column; /* 세로 방향으로 배치 */
        align-items: center; /* 중앙 정렬 */
        height: 100vh; /* 전체 화면 높이 */
        margin: 0; /* 기본 여백 제거 */
    }

    .logo-container {
        margin: 20px 0; /* 위 아래 여백 추가 */
        text-align: center; /* 중앙 정렬 */
    }

    .outer-container {
        background-color: #EBFFEE; /* 바깥쪽 컨테이너 색상 */
        padding: 20px; /* 패딩 추가 */
        border-radius: 10px; /* 모서리 둥글게 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        margin-top: 20px; /* 로고와 컨테이너 간의 여백 */
    }

    h2 {
        text-align: center;
        font-size: 32px; /* 글자 크기 증가 */
        margin-bottom: 20px; /* 아래 여백 추가 */
        color: #470065; /* 글자 색상 변경 */
    }

    table {
        margin: 0 auto; /* 수평 중앙 정렬 */
        background-color: white; 
        border-radius: 8px; 
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        width: 500px; /* 테이블 너비 조정 */
    }

    th, td {
        padding: 15px; 
        font-size: 20px; /* 글자 크기 증가 */
    }

    input[type="text"], input[type="password"], input[type="email"] {
        width: calc(100% - 20px); /* 입력 필드 너비 조정 */
        padding: 10px; /* 패딩 추가 */
        font-size: 18px; /* 글자 크기 조정 */
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 5px; /* 테두리 둥글게 */
    }

    input[type="button"], input[type="submit"] {
        background-color: #EBFFEE; /* 수정 완료 버튼 색상 변경 */
        color: #470065; /* 글자 색상 변경 */
        border: none; 
        border-radius: 5px; 
        padding: 10px 20px; 
        cursor: pointer; 
        transition: background-color 0.3s;
        font-size: 18px; /* 버튼 글자 크기 조정 */
        width: 100%; /* 버튼 너비 100% */
        font-weight: bold;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }

    input[type="submit"]:hover {
        background-color: #DFF5E1; /* 버튼 호버 색상 */
    }

    .email-container {
        display: flex; /* 이메일 입력과 도메인 선택을 가로로 배치 */
    }

    #email_domain {
        flex: 1; /* 도메인 선택 필드가 남은 공간을 차지하도록 설정 */
        padding: 10px; /* 패딩 추가 */
        font-size: 18px; /* 글자 크기 조정 */
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 5px; /* 테두리 둥글게 */
        margin-left: 5px; /* 이메일 입력 필드와 간격 추가 */
    }
</style>
</head>
<body>
    <header class="logo-container">
        <a href="/Users/CheckPassword?user_id=${userLogin.user_id}">
            <img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
    <main class="outer-container">  
        <h2>회원 수정</h2>
        <form action="/Users/Update" method="POST">
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="user_id" value="${ user.user_id }" readonly/></td>
                </tr>
                <tr>
                    <td>새 비밀번호</td>
                    <td><input type="password" name="user_passwd" id="passwd1" required/></td>
                </tr>
                <tr>
                    <td>새 비밀번호 확인</td>
                    <td><input type="password" id="passwd2" required/></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="user_name" value="${ user.user_name }" required/></td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td><input type="text" name="user_phone" value="${ user.user_phone }" placeholder="-없이 입력해주세요" required /></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <div class="email-container">
                            <input type="email" id="user_email" name="user_email" value="${ user.user_email }" placeholder="이메일 입력" />
                            <select id="email_domain" onchange="updateEmail()">
                                <option value="" selected>직접입력</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="kakao.com">kakao.com</option>
                                <option value="yahoo.com">yahoo.com</option>
                                <option value="outlook.com">outlook.com</option>
                                <option value="green.com">green.com</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;"> <!-- 중앙 정렬 -->
                        <input type="submit" value="수정완료" />
                    </td>
                </tr>
            </table>    
        </form>

        <script>
            function updateEmail() {
                var emailInput = document.getElementById('user_email');
                var domainSelect = document.getElementById('email_domain');

                var selectedDomain = domainSelect.value;

                if (selectedDomain) {
                    emailInput.value = emailInput.value.split('@')[0] + '@' + selectedDomain;
                } else {
                    emailInput.value = emailInput.value.split('@')[0]; // 도메인 제거
                }
            }
        </script> 
    </main>
</body>
</html>
