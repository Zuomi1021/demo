<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/index.css">
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
    public String getAdSrc(int adId) {
        String AdSrc = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "1234");
            String sql = "SELECT src FROM ad WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, adId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                AdSrc = rs.getString("src");
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return AdSrc;
    }
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
    <div class="slideshow-container">
      <div class="singleSlide fade" style="display: none;">
        <img src="assets/image/<%= getAdSrc(1) %>.jpg">
      </div>

      <div class="singleSlide fade" style="display: none;">
        <img src="assets/image/<%= getAdSrc(2) %>.jpg">
    </div>
    
    <div class="singleSlide fade" style="display: none;">
        <img src="assets/image/<%= getAdSrc(3) %>.jpg">
    </div>
    
    <div class="singleSlide fade" style="display: none;">
        <img src="assets/image/<%= getAdSrc(4) %>.jpg">
    </div>

      <button class="prev" onclick="plusSlides(-1)">❮</button>
      <button class="next" onclick="plusSlides(1)">❯</button>
    </div>
  
    <br>
    <div class="hot">
      <h2>WHAT'S HOT?</h2> 
    </div>
    <form>
        <div class="product">
          <a href="product.jsp"><img class="form-img" src="assets/image/<%= getProductSrc(13) %>.jpg"></a>
          <h2><%= getProductNames(13) %></h2> 
        </div>
  
        <div class="product">
          <a href="product.jsp"><img class="form-img" src="assets/image/<%= getProductSrc(14) %>.jpg"></a>
          <h2><%= getProductNames(14) %></h2> 
        </div>
  
        <div class="product">
          <a href="product.jsp"><img class="form-img" src="assets/image/<%= getProductSrc(15) %>.jpg"></a>
          <h2><%= getProductNames(15) %></h2>
        </div>              

    </form>

    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>
    <script src="assets/js/index.js"></script>

  </body>
  </html>
