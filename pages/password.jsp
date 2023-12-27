<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/password.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hedvig+Letters+Serif:opsz@12..24&display=swap" rel="stylesheet">
    <link rel="icon" href="assets/image/aboutus/logo.png">
</head>
<body>
    <div class="header">
        <img class="header-logo" src="assets/image/aboutus/logo-name.jpg">
        <div class="nav-title">
          <ul class="nav-name">  
              <li class="name"><a href="index.jsp">首頁</a>
              <li class="name"><a href="index.jsp">所有商品</a>
                  <ul class="subname">
                    <li><a href="product.jsp">首頁</a></li>
                    <li><a href="decoration.jsp">裝飾</a></li>
                    <li><a href="wearing.jsp">飾品</a></li>
                    <li><a href="cookie.jsp">食品</a></li>
                  </ul>
                  
              </li>
              <li class="name"><a href="aboutus.html">關於我們</a></li>
              <li class="name"><a href="center.jsp">會員中心</a></li>
          </ul>
        </div>
  
        <div class="header-links">
          <%
      if (session.getAttribute("account") != null) {
          String account = (String) session.getAttribute("account");
      %>
          <span>歡迎, <%= account %>！</span>
          <a href="car.jsp">購物車</a>
          <span>|</span>
          <a href="logout.jsp">登出</a>
      <%
      } else {
      %>
          <a href="member.jsp">登入</a>
          <span>|</span>
          <a href="signup.jsp">註冊</a>
          <span>|</span>
          <a href="member.jsp">購物車</a>
      <%
      }
      %>
      </div>
    </div>
    <form action="accountValidation.jsp" method="post">
        <div class="container">
            <h1>忘記密碼</h1>
            <label for="account"><b>帳號驗證：</b></label>
            <input type="text" placeholder="Enter account" name="account" id="account" required>
            <div class="clearfix"><br>
                <button type="submit" class="btn">送出</button>
            </div>
        </div>   
    </form>

    <footer>
        &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
      </footer>
    <script src="assets/js/index.js"></script>

  </body>
  </html>