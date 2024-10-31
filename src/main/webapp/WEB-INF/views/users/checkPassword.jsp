<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
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
        width: 400px; /* 바깥쪽 컨테이너 너비 */
        text-align: center; /* 내용 중앙 정렬 */
    }

    h2 {
        font-size: 28px; /* 글자 크기 증가 */
        margin-bottom: 20px; /* 아래 여백 추가 */
        color: #470065; /* 글자 색상 변경 */
    }

    table {
        margin: 0 auto; /* 수평 중앙 정렬 */
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        text-align: left; /* 왼쪽 정렬 */
        width: 100%; /* 테이블 너비 조정 */
    }

    th, td {
        padding: 15px;
        font-size: 22px; /* 글자 크기 증가 */
    }

    td {
        vertical-align: middle; /* 셀 내 수직 정렬 */
    }

    input[type="password"] {
        width: calc(100% - 30px); /* 입력 필드 너비 조정 */
        padding: 10px; /* 패딩 추가 */
        font-size: 18px; /* 글자 크기 조정 */
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 5px; /* 테두리 둥글게 */
    }

    input[type="button"], input[type="submit"] {
        background-color: #EBFFEE;
        color: #470065;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-size: 18px; /* 버튼 글자 크기 조정 */
        width: 100%; /* 버튼 너비 100% */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }

    input[type="submit"]:hover {
        background-color: #5a0072;
    }
</style>
</head>
<body>
    <header class="logo-container">
        <a href="/Users/View?user_id=${userLogin.user_id}">
            <img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
    <main class="outer-container">
        <h2 class="text-center">비밀번호 확인</h2> <!-- 제목을 바깥쪽 컨테이너 안에 위치 -->
        <form action="/Users/CheckPassword" method="POST">
            <input type="hidden" name="user_id" value="${param.user_id}" />
            <table class="table table-bordered">
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="inputPassword" required /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="확인" id="check" /></td>
                </tr>
            </table>
        </form>
        <script>
          // 서버에서 전달된 error 메시지가 있을 경우 alert로 출력
          <%if (request.getAttribute("error") != null) {%>
            alert("<%=request.getAttribute("error")%>");
          <%}%>
        </script>
    </main>
</body>
</html>
