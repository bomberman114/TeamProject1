<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png?raw=true" />
    <style>
        .header-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: white; /* 필요에 따라 배경색 설정 */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            z-index: 1000; /* 상단 고정을 위해 높은 z-index 설정 */
        }
        .logo-container {
        	padding:10px;
            text-align: left;
        }
        .logo-container img {
            max-width: 100%; 
            height: 100px; 
        }
        body {
            padding-top: 80px; /* header 높이만큼 내용 내려줌 */
        }
    </style>
</head>
<body>
    <div class="header-container">
        <div class="logo-container">
            <a href="/">
                <img src="https://raw.githubusercontent.com/bomberman114/TeamProject1/develop/src/main/resources/static/img/NEXT.png" alt="사이트 로고">
            </a>
        </div>
    </div>
</body>
</html>
