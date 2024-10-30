<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 추가</title>
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
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px; /* 여백 추가 */
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .add-button {
            text-align: center;
        }
        .add-button button {
            background: #6200ea;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
        }
        .add-button button:hover {
            background: #5b00d4; /* 버튼 호버 효과 */
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="menu">☰</div>
            <h1>게시물 추가</h1>
            <div class="settings">⚙️</div>
        </header>

        <form action="/Board/addPost" method="post">
            <div class="form-group">
                <label for="userId">사용자 ID:</label>
                <input type="text" id="userId" name="userId" required>
            </div>

            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" id="title" name="title" required>
            </div>

            <div class="form-group">
                <label for="content">내용:</label>
                <textarea id="content" name="content" rows="5" required></textarea>
            </div>

            <div class="form-group">
                <label for="menuIdx">메뉴 인덱스:</label>
                <input type="number" id="menuIdx" name="menuIdx" required>
            </div>

            <div class="add-button">
                <button type="submit">게시하기</button>
            </div>
        </form>
    </div>
</body>
</html>