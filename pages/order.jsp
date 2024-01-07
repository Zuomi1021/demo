<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/order.css">
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
    
      <div class="orders"> 

        <h1>Order Details</h1>
        <div class="history-orders" href="">
            <p>21/04/2024, 04:21</p>
            <p class="his-order">Order number 1729346422385942</p>
            
            <%
            String account = (String) session.getAttribute("account");
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            
                String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
                String username = "root";
                String password = "1234";
                conn = DriverManager.getConnection(url, username, password);
            
                stmt = conn.createStatement();
            
                String sql = "SELECT name, type, price, src, quantity FROM car;";
                rs = stmt.executeQuery(sql);
                    
                int totalPrice = 0;

                while (rs.next()) {
                    
                    String name = rs.getString("name");
                    String type = rs.getString("type");
                    int price = rs.getInt("price");
                    String src = rs.getString("src");
                    int quantity = rs.getInt("quantity");
            
                    int subtotal = price * quantity;
            
                    totalPrice += subtotal;
            
                    %>

            <hr>
                <div class ="history-info">
                    <img src="assets/image/<%= src %>.jpg" id="his-order">
                    <div class="history-information-text">
                        <p><b>Purchase confirmed</b></p>
                        <p><%= name %></p>
                        <p class="his-order">選項：<%= type %></p>
                    </div>
                    <div class ="history-text">
                        <p class="his-order">數量：<%= quantity %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                        <p><b><span class="price" style="color:black">NT$<%= price %></b></span></p>
                    </div>
                </div>
                <%}
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                // 關閉資源
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
            <hr>
        </div>
    </div>

    <button type="button" class="next-page" onclick="window.location.href='finish.html'">完成訂單</button>


    <footer>
        &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
      </footer>
    <script src="assets/js/index.js"></script>

  </body>
  </html>