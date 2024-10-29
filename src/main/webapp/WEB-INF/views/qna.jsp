<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0fdf4; /* 연한 초록색 배경 */
    margin: 0;
}

header {
    text-align: center;
    padding: 20px;
}

h1 {
    font-size: 2.5em;
    color: #a0aec0; /* 회색 */
}

main {
    display: flex;
}

.sidebar {
    width: 200px;
    background-color: #e6fffa; /* 연한 청록색 */
    padding: 20px;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
}

.sidebar button {
    background-color: #805ad5; /* 보라색 */
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px;
    cursor: pointer;
}

.content {
    flex: 1;
    padding: 20px;
}

.question, .answer {
    background-color: white;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 20px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.submit-btn {
    background-color: #48bb78; /* 초록색 */
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
}

footer {
    text-align: center;
    padding: 20px;
    background-color: #e6fffa;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서 페이지</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>ALGO JOB</h1>
    </header>
    <main>
        <div class="sidebar">
            <button>+</button>
            <p>1:1 문의</p>
            <p>return;</p>
        </div>
        <section class="content">
            <div class="question">
                <h2>question</h2>
                <p>Supporting line text lorem ipsum dolor sit amet, consectetur.</p>
            </div>
            <div class="answer">
                <h2>answer</h2>
                <p>Supporting line text lorem ipsum dolor sit amet, consectetur.</p>
                <p>고객센터</p>
            </div>
            <button class="submit-btn">✅ 할란데 무슨일?</button>
        </section>
    </main>
    <footer>
        <p>CONTACT</p>
    </footer>
</body>
</html>