<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/car.css">
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
    
    <form action="action_page.php">
        <div class="container">
            <h1>購物車</h1>
            <hr>
            <br>
            <div class="item-container">
                <input type="radio" id="photo1" value="photo1">
                <img src="assets/image/wear/wear3.jpg" alt="照片1">
                    <div class="item-details">
                        <p><b>聖誕造型髮夾</b></p>
                        <p>選項：第四款</p>
                        <div class="quantity-container">
                            <div class="btn-numbox">
                              <span class="quantity-btn removeBtn">-</span>
                              <input type="text" class="input-num"  value="1"/>
                              <span class="quantity-btn addBtn">+</span>
                            </div>
                        </div>
                        <p>價格：<span class="price" style="color:black">NT$80</span></p>
                    </div>
            </div>
            <br>
            <hr>
            <br>
            <div class="item-container">
                <input type="radio" id="photo2" value="photo2">
                <img src="assets/image/cookie/product2.jpg" alt="照片1">
                    <div class="item-details">
                        <p><b>經典手作禮盒</b></p>
                        <p>選項：蔓越莓酥</p>
                        <div class="quantity-container">
                            <div class="btn-numbox">
                              <span  class="quantity-btn removeBtn">-</span>
                              <input type="text" class="input-num"  value="1"/>
                              <span  class="quantity-btn addBtn">+</span>
                            </div>
                        </div>
                        <p>價格：<span class="price" style="color:black">NT$400</span></p>
                    </div>            
            </div>
            <br>
            <hr>
            <p>總金額：<span class="price" style="color:black"><b>NT$480</b></span></p>
            <hr>

            <button type="button" class="next-page" onclick="window.location.href='checkout.html'">前往結帳</button>
        </div>
    </form>

    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>

    <script src="assets/js/car.js"></script></script>

  </body>
  </html>