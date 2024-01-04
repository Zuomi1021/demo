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
    
      <form action="" method="post">
        <div class="container">
            <h1>購物車</h1>
            <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // 加載JDBC驅動
                Class.forName("com.mysql.cj.jdbc.Driver");
            
                // 建立數據庫連接
                String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
                String username = "root";
                String password = "1234";
                conn = DriverManager.getConnection(url, username, password);
            
                // 創建Statement對象
                stmt = conn.createStatement();
            
                // 執行SQL查詢
                String sql = "SELECT name, type, price, src, " +
                "(SELECT MAX(id) FROM car WHERE account = '" + account + "') AS maxId " +
                "FROM car WHERE account = '" + account + "';";
                rs = stmt.executeQuery(sql);
                    
                // 定義一個變數來保存總價
                int totalPrice = 0;

                // 獲取值並動態生成HTML結構
                while (rs.next()) {
                    String name = rs.getString("name");
                    String type = rs.getString("type");
                    int price = rs.getInt("price");
                    String src = rs.getString("src");
                    int maxId = rs.getInt("maxId");
                    int quantity = rs.getInt("quantity");
            
                    // 將價格與數量相乘
                    int subtotal = price * quantity;
            
                    // 將每個商品的價格乘以數量加到總價中
                    totalPrice += subtotal;
            
                    %>
                    <hr>
                    <br>
                    <div class="item-container">
                        <input type="radio" id="photo<%= maxId %>" value="photo<%= maxId %>">
                        <img src="assets/image/<%= src %>.jpg" alt="照片<%= maxId %>">
                        <div class="item-details">
                            <p><b><%= name %></b></p>
                            <p>選項：<%= type %></p>
                            <div class="quantity-container">
                                <div class="btn-numbox">
                                    <span class="quantity-btn removeBtn">-</span>
                                    <input type="text" class="input-num" name="inputNum" id="inputNum" value="<%= quantity %>"/>
                                    <span class="quantity-btn addBtn">+</span>
                                </div>
                            </div>
                            <p>價格：<span class="price" style="color:black">NT$<%= price %></span></p>
                            
                        </div>
                    </div>
                    <br>
                    <%
                }
                %>
            <hr>
            <p>總金額：<span class="price" style="color:black"><b>NT$<%= totalPrice %></b></span></p>
            <%
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
            <input class="next-page" type="submit" value="前往結帳"/>
        </div>
    </form>

    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>

    <script src="assets/js/car.js"></script></script>

  </body>
  </html>