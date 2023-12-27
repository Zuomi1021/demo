<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/product.css">
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
      <%!
      public String getProductNames(int productId) {
          String productName = "";
          try {
              Class.forName("com.mysql.jdbc.Driver");
              String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
              Connection con = DriverManager.getConnection(url, "root", "1234");
              String sql = "SELECT name FROM product WHERE id = ?";
              PreparedStatement pstmt = con.prepareStatement(sql);
              pstmt.setInt(1, productId);
              ResultSet rs = pstmt.executeQuery();
  
              if (rs.next()) {
                  productName = rs.getString("name");
              }
  
              rs.close();
              pstmt.close();
              con.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
          return productName;
      }
  
      public String getProductSrc(int productId) {
          String productSrc = "";
          try {
              Class.forName("com.mysql.jdbc.Driver");
              String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
              Connection con = DriverManager.getConnection(url, "root", "1234");
              String sql = "SELECT src FROM product WHERE id = ?";
              PreparedStatement pstmt = con.prepareStatement(sql);
              pstmt.setInt(1, productId);
              ResultSet rs = pstmt.executeQuery();
  
              if (rs.next()) {
                  productSrc = rs.getString("src");
              }
  
              rs.close();
              pstmt.close();
              con.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
          return productSrc;
      }
      %>  
    <h2 class="topic-title">DECORATION</h2> 
    <form>
        <div class="product">
            <a href="commodity.html">
            <img class="form-img" src="assets/image/<%= getProductSrc(7) %>.jpg">
            </a>
            <p><b><%= getProductNames(7) %></p></b>
            <input type="hidden" name="product" value="<%= getProductNames(7) %>">
            <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
        </div>
  
        <div class="product">
          <a href="commodity.html">
          <img class="form-img" src="assets/image/<%= getProductSrc(8) %>.jpg">
          </a>
          <p><b><%= getProductNames(8) %></p></b>
          <input type="hidden" name="product" value="<%= getProductNames(8) %>">
          <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
        </div>
  
        <div class="product">
          <a href="commodity.html">
          <img class="form-img" src="assets/image/<%= getProductSrc(9) %>.jpg">
          </a>
          <p><b><%= getProductNames(9) %></p></b>
          <input type="hidden" name="product" value="<%= getProductNames(9) %>">
          <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
        </div>              

        <div class="product">
          <a href="commodity.html">
          <img class="form-img" src="assets/image/<%= getProductSrc(10) %>.jpg">
          </a>
          <p><b><%= getProductNames(10) %></p></b>
          <input type="hidden" name="product" value="<%= getProductNames(10) %>">
          <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
        </div>
  
        <div class="product">
          <a href="commodity.html">
          <img class="form-img" src="assets/image/<%= getProductSrc(11) %>.jpg">
          </a>
          <p><b><%= getProductNames(11) %></p></b>
          <input type="hidden" name="product" value="<%= getProductNames(11) %>">
          <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
        </div>
  
        <div class="product">
          <a href="commodity.html">
          <img class="form-img" src="assets/image/<%= getProductSrc(12) %>.jpg">
          </a>
          <p><b><%= getProductNames(12) %></p></b>
          <input type="hidden" name="product" value="<%= getProductNames(12) %>">
          <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
        </div> 
    </form>

    <h2 class="topic-title">WEARING</h2> 
    <form>
      <div class="product">
          <a href="commodity.html">
          <img class="form-img" src="assets/image/<%= getProductSrc(1) %>.jpg">
          </a>
          <p><b><%= getProductNames(1) %></p></b>
          <input type="hidden" name="product" value="<%= getProductNames(1) %>">
          <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(2) %>.jpg">
        </a>
        <p><b><%= getProductNames(2) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(2) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(3) %>.jpg">
        </a>
        <p><b><%= getProductNames(3) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(3) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>              

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(4) %>.jpg">
        </a>
        <p><b><%= getProductNames(4) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(4) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(5) %>.jpg">
        </a>
        <p><b><%= getProductNames(5) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(5) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(6) %>.jpg">
        </a>
        <p><b><%= getProductNames(6) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(6) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div> 
    </form>

    <h2 class="topic-title">COOKIE</h2> 
    <form>
      <div class="product">
          <a href="commodity.html">
          <img class="form-img" src="assets/image/<%= getProductSrc(13) %>.jpg">
          </a>
          <p><b><%= getProductNames(13) %></p></b>
          <input type="hidden" name="product" value="<%= getProductNames(13) %>">
          <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(14) %>.jpg">
        </a>
        <p><b><%= getProductNames(14) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(14) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(15) %>.jpg">
        </a>
        <p><b><%= getProductNames(15) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(15) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>              

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(16) %>.jpg">
        </a>
        <p><b><%= getProductNames(16) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(16) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(17) %>.jpg">
        </a>
        <p><b><%= getProductNames(17) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(17) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div>

      <div class="product">
        <a href="commodity.html">
        <img class="form-img" src="assets/image/<%= getProductSrc(18) %>.jpg">
        </a>
        <p><b><%= getProductNames(18) %></p></b>
        <input type="hidden" name="product" value="<%= getProductNames(18) %>">
        <button type="button" class="add-to-cart" onclick="window.location.href='car.html'">加入購物車</button>
      </div> 
    </form>

    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>
  
  </body>
  </html>