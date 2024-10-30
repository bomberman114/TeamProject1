<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
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

.search-bar {
    flex: 1;  /* 검색창을 남은 공간에 맞게 확장 */
    margin-bottom: 20px;
}

.search-bar input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.card {
    background: #f9f9f9;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 20px;
}

.card-header {
    display: flex;
    align-items: center;
}

.icon {
    background: #e0e0e0;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 10px;
}

.card-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}

.add-button {
    text-align: center;
}

.add-button button {
    background: #6200ea;
    color: white;
    border: none;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    font-size: 24px;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제목</title>
    <link rel="stylesheet" href="styles.css"> <!-- 스타일시트 연결 -->
</head>
<body>
    <div class="container">
        <header>
            <div class="menu">☰</div>
            <h1>Title</h1>
            <div class="settings">⚙️</div>
        </header>
        
        <form action="/search" method="GET">
        <div class="search-bar">
            <input type="search" placeholder="검색">
        </div>
        </form>
        
        <div class="card">
        
            <div class="card-header">
                <div class="icon">A</div>
                <h2>commu_title</h2>
            </div>
            
            <div class="card-content">
                <p>커뮤니티 콘텐트 연결</p>
            </div>
            
            <div class="card-actions">
                <button>수정하기</button>
                <button>삭제하기</button>
            </div>
        </div>
        
        <div class="add-button">
        	<a href="/post/addpost.jsp">
            <button>+</button>
            </a>
        </div>
        
    </div>
</body>
</html>
