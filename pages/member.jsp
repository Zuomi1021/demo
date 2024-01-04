<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/member.css">
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
              <li class="name"><a href="aboutus.jsp">關於我們</a></li>
              <%
              if (session.getAttribute("account") != null) {
              %>
                  <li class="name"><a href="center.jsp">會員中心</a></li>
              <%
              } else {
              %>
                  <li class="name"><a href="member.jsp">會員中心</a></li>
              <%
              }
              %>
          </ul>
        </div>
  
        <div class="header-links">
          <%
      if (session.getAttribute("username") != null) {
          String username = (String) session.getAttribute("username");
      %>
          <span>歡迎, <%= username %>！</span>
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
  <%
  String account = request.getParameter("account");
  String filteredAccount = "";
  if (account != null) {
      Pattern pattern = Pattern.compile("[\\u4E00-\\u9FFFa-zA-Z0-9]+");
      Matcher matcher = pattern.matcher(account);
      StringBuilder sb = new StringBuilder();
      while (matcher.find()) {
          sb.append(matcher.group());
      }
      filteredAccount = sb.toString();
  }
  
  String password = request.getParameter("password");
  String filteredPassword = "";
  if (password != null) {
      Pattern pattern = Pattern.compile("[\\u4E00-\\u9FFFa-zA-Z0-9]+");
      Matcher matcher = pattern.matcher(password);
      StringBuilder sb = new StringBuilder();
      while (matcher.find()) {
          sb.append(matcher.group());
      }
      filteredPassword = sb.toString();
  }
  
  %>
    <form action="loginProcess.jsp" method="post">
        <div class="container">
            <h1>會員登入</h1>
    
            <div class="label-container">
                <label for="account"><b>帳號:</b></label>
                <input type="text" placeholder="Enter Account" name="account" required>
            </div>
            
            <div class="label-container">
                <label for="password"><b>密碼:</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>
            </div>
            
            <div class="label-container">
              <label>
                <input type="checkbox" name="remember"> 記住我
              </label>
            </div>
    
            <div class="clearfix">
                <button type="submit" class="signupbtn">登入</button>
            </div>
            
            <div class=".signup">
                <a href="signup.jsp">註冊新會員</a><a>/</a>
                <a href="password.jsp">忘記密碼</a>
            </div>
            
        </div>
    </form>
    
    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>

    <script src="assets/js/index.js"></script>

  </body>
</html>