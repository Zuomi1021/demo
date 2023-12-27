<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>登入</title>
</head>
<body>
    <form action="loginProcess.jsp" method="post">
        <label for="username">Account:</label>
        <input type="text" id="account" name="account" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
        <a href="register.jsp" value="Register">註冊
    </form>
</body>
</html>
