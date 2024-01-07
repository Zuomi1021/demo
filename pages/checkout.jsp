<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/checkout.css">
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
    
      <form action="" method="post">
        <div class="container">
            <h1>結 帳</h1>
            <hr>
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
            
                String sql = "SELECT name, type, price, src, quantity, " +
                "(SELECT MAX(id) FROM car) AS maxId " +
                "FROM car;";
                rs = stmt.executeQuery(sql);
                    
                int totalPrice = 0;

                while (rs.next()) {
                    
                    String name = rs.getString("name");
                    String type = rs.getString("type");
                    int price = rs.getInt("price");
                    String src = rs.getString("src");
                    int maxId = rs.getInt("maxId");
                    int quantity = rs.getInt("quantity");
            
                    int subtotal = price * quantity;
            
                    totalPrice += subtotal;
            
                    %>

                    <br>
                    <div class="item-container">
                        
                        <img src="assets/image/<%= src %>.jpg" alt="照片<%= maxId %>">
                        <div class="item-details">
                            <p><b><%= name %></b></p>
                            <p>選項：<%= type %></p>
                            <div class="quantity-container">
                                <div class="btn-numbox">
                                    數量：<%= quantity %>


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
            <h3>訂購資訊</h3>
            <p>收件人姓名&nbsp;&emsp;<input type="text" name="name"></p>
            <p>電話&nbsp;&emsp;&emsp;&emsp;&emsp;<input type="tel" name="tel"></p>
            <p>電子郵件&nbsp;&emsp;&emsp;<input type="email" name="email"></p>
            <p>縣市&emsp;&emsp;&emsp;&emsp;
            <select>
                <option></option>
                <option>臺北市</option>
                <option>新北市</option>
                <option>基隆市</option>
                <option>桃園市</option>
                <option>新竹市</option>
                <option>新竹縣</option>
                <option>臺中市</option>
                <option>臺南市</option>
                <option>高雄市</option>
                <option>苗栗縣</option>
                <option>彰化縣</option>
                <option>南投縣</option>
                <option>雲林縣</option>
                <option>嘉義市</option>
                <option>嘉義縣</option>
                <option>屏東縣</option>
                <option>宜蘭縣</option>
                <option>花蓮縣</option>
                <option>臺東縣</option>
                <option>澎湖縣</option>
                <option>金門縣</option>
                <option>連江縣</option>
            </select></p>
            <p>地址&nbsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name="address"></p>
            <hr>
            <p>付款方式</p>
            <input type="radio" name="pay" value="cash" id="cash">
            <label for="cash">貨到付款</label>
            <hr>
            <p>寄送方式</p>
            <div class="container">
                <br>
                <input type="radio" name="send" value="send" id="cash"><a href="https://emap.pcsc.com.tw/emap.aspx" class="delivery-link" data-method="711">超商取貨(7-11)、</a>
                <input type="radio" name="send" value="send" id="cash"><a href="https://www.family.com.tw/Marketing/Map" class="delivery-link" data-method="familymart">超商取貨(全家)</a>
            </div>
            <hr>
            <p>運費：<span class="price" style="color:black"><b>NT$60</b></span></p>
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
            <br>
            <button type="button" class="cart" onclick="window.location.href='order.jsp'">送出訂單</button>
        </div>
        </div>
    </form>

    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>

    <script src="assets/js/car.js"></script></script>

  </body>
  </html>