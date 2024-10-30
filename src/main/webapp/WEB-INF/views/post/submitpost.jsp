<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 제출 완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: #6200ea;
        }
        .button {
            margin-top: 20px;
            background: #6200ea;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
        }
        .button:hover {
            background: #5b00d4; /* 버튼 호버 효과 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>게시물 제출 완료!</h1>
        <p>게시물이 성공적으로 제출되었습니다.</p>
        <p><strong>제목:</strong> ${post.communityTitle}</p>
        <p><strong>내용:</strong> ${post.communityContent}</p>
        <div>
            <a href="/Board/postList">
                <button class="button">게시물 목록으로 돌아가기</button>
            </a>
        </div>
    </div>
</body>
</html>