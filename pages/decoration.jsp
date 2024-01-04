<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/decoration.css">
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

    <%!
      public String getProductNames(int productId) {
          String productName = "";
          try {
              Class.forName("com.mysql.jdbc.Driver");
              String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
              Connection con = DriverManager.getConnection(url, "root", "465879");
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

      public int getProductPrice(int productId) {
        int productPrice = 0; 
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "465879");
            String sql = "SELECT price FROM product WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();
    
            if (rs.next()) {
                productPrice = rs.getInt("price");
            }
    
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return productPrice;
    }
      public String getProductSrc(int productId) {
          String productSrc = "";
          try {
              Class.forName("com.mysql.jdbc.Driver");
              String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
              Connection con = DriverManager.getConnection(url, "root", "465879");
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
    <form method="post">
        <div class="product">
            <a href="commodity.html">
                <img class="form-img" src="assets/image/<%= getProductSrc(7) %>.jpg">
            </a>
            <p><b><%= getProductNames(7) %></p></b>
            <input type="hidden" name="addToCart" value="product7">
            <input type="submit" class="add-to-cart" value="加入購物車" />
        </div>
    </form>
    
    <form method="post">
        <div class="product">
            <a href="commodity.html">
                <img class="form-img" src="assets/image/<%= getProductSrc(8) %>.jpg">
            </a>
            <p><b><%= getProductNames(8) %></p></b>
            <input type="hidden" name="addToCart" value="product8">
            <input type="submit" class="add-to-cart" value="加入購物車" />
        </div>
    </form>
    
    <form method="post">
        <div class="product">
            <a href="commodity.html">
                <img class="form-img" src="assets/image/<%= getProductSrc(9) %>.jpg">
            </a>
            <p><b><%= getProductNames(9) %></p></b>
            <input type="hidden" name="addToCart" value="product9">
            <input type="submit" class="add-to-cart" value="加入購物車" />
        </div>
    </form>
    
    
    <form method="post">
        <div class="product">
            <a href="commodity.html">
                <img class="form-img" src="assets/image/<%= getProductSrc(10) %>.jpg">
            </a>
            <p><b><%= getProductNames(10) %></p></b>
            <input type="hidden" name="addToCart" value="product10">
            <input type="submit" class="add-to-cart" value="加入購物車" />
        </div>
    </form>
    
    <form method="post">
        <div class="product">
            <a href="commodity.html">
                <img class="form-img" src="assets/image/<%= getProductSrc(11) %>.jpg">
            </a>
            <p><b><%= getProductNames(11) %></p></b>
            <input type="hidden" name="addToCart" value="product11">
            <input type="submit" class="add-to-cart" value="加入購物車" />
        </div>
    </form>
    
    <form method="post">
        <div class="product">
            <a href="commodity.html">
                <img class="form-img" src="assets/image/<%= getProductSrc(12) %>.jpg">
            </a>
            <p><b><%= getProductNames(12) %></p></b>
            <input type="hidden" name="addToCart" value="product12">
            <input type="submit" class="add-to-cart" value="加入購物車" />
        </div>
    </form>

    

    <%
    if ("POST".equals(request.getMethod())) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
    
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
            String username = "root";
            String password = "465879";
            connection = DriverManager.getConnection(url, username, password);
    
            String submittedProduct = request.getParameter("addToCart");
    
            // 根據 submittedProduct 獲取相應的產品數據
            String productName = null;
            String productSrc = null;
            int productPrice = 0;
    
            if ("product7".equals(submittedProduct)) {
                productName = getProductNames(7);
                productSrc = getProductSrc(7);
                productPrice = getProductPrice(7);
            } else if ("product8".equals(submittedProduct)) {
                productName = getProductNames(8);
                productSrc = getProductSrc(8);
                productPrice = getProductPrice(8);
            } else if ("product9".equals(submittedProduct)) {
                productName = getProductNames(9);
                productSrc = getProductSrc(9);
                productPrice = getProductPrice(9);
            } else if ("product10".equals(submittedProduct)) {
                productName = getProductNames(10);
                productSrc = getProductSrc(10);
                productPrice = getProductPrice(10);
            } else if ("product11".equals(submittedProduct)) {
                productName = getProductNames(11);
                productSrc = getProductSrc(11);
                productPrice = getProductPrice(11);
            } else if ("product12".equals(submittedProduct)) {
                productName = getProductNames(12);
                productSrc = getProductSrc(12);
                productPrice = getProductPrice(12);
            } 
            
    
            // 執行資料庫插入
            String insertQuery = "INSERT INTO car (src, name, price) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, productSrc);
            preparedStatement.setString(2, productName);
            preparedStatement.setInt(3, productPrice);
            int rowsAffected = preparedStatement.executeUpdate();
    
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    %>    
    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>
  
  </body>
  </html>