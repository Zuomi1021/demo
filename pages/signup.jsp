<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>註冊</title>
</head>
<body>
    <form action="signupProcess.jsp" method="post">
        <!-- 輸入註冊相關資訊 -->
        <input type="text" name="username" placeholder="Account" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <!-- 其他註冊資訊 -->
        <input type="submit" value="註冊">
        <a href="login.jsp">登入</a>
    </form>
</body>
</html>
