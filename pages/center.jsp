<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/center.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hedvig+Letters+Serif:opsz@12..24&display=swap" rel="stylesheet">
    <link rel="icon" href="assets/image/aboutus/logo.png">
    <style>
        input[type="text"], input[type="email"],input[type="password"], input[type='submit'] ,select{
            display: block !important;
        }
    </style>
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

      <% 
      String accountId = (String) session.getAttribute("accountFromDatabase");
      if (request.getMethod().equals("POST")) {
          String newName = request.getParameter("name");
          String newEmail = request.getParameter("email");
          String newNickname = request.getParameter("nickname");
          String newAddress = request.getParameter("address");
          String newAccount = request.getParameter("account");
          String newPassword = request.getParameter("password");
          
          Connection conn = null;
          PreparedStatement ps = null;
          try {
              conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/index", "root", "1234");
              String query = "UPDATE personal_data SET name = ?, email = ?, nickname = ?, address = ?, account = ?, password = ?, WHERE account = ?";
              ps = conn.prepareStatement(query);
              ps.setString(1, newName);
              ps.setString(2, newEmail);
              ps.setString(3, accountId);
              ps.setString(4, newNickname);
              ps.setString(5, newAddress);
              ps.setString(6, newAccount);
              ps.setString(7, newPassword);
              ps.executeUpdate();

          } catch (SQLException e) {
              e.printStackTrace();

          } finally {
              try {
                  if (ps != null) ps.close();
                  if (conn != null) conn.close();
              } catch (SQLException e) {
                  e.printStackTrace();
              }
          }
      }
      %>
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
    <script>
      function editProfile() {
          var nameField = document.getElementById("nameField").value;
          var emailField = document.getElementById("emailField").value;
          var addressField = document.getElementById("addressField").value;
          var nicknameField = document.getElementById("nicknameField").value;
          var accountField = document.getElementById("accountField").value;
          var passwordField = document.getElementById("passwordField").value;
  
          if (nameField.readOnly) {
              nameField.readOnly = false;
              emailField.readOnly = false;
              addressField.readOnly = false;
              nicknameField.readOnly = false;
              accountField.readOnly = false;
              passwordField.readOnly = false;
  
              document.querySelector("button").innerText = "確認修改";
          } else {
              nameField.readOnly = true;
              emailField.readOnly = true;
              addressField.readOnly = true;
              nicknameField.readOnly = true;
              accountField.readOnly = true;
              passwordField.readOnly = true;
  
              // 這裡添加代碼將資料提交到後端，更新資料庫
              fetch('updateProfile.jsp', {
                  method: 'POST',
                  body: JSON.stringify({
                      name: nameField,
                      email: emailField,
                      address: addressField,
                      nickname: nicknameField,
                      account: accountField,
                      password: passwordField
                  }),
                  headers: {
                      'Content-Type': 'application/json'
                  }
              })
              .then(response => {
                  // 在這裡處理回傳的響應，可以是重新載入頁面或其他操作
              })
              .catch(error => {
                  console.error('Error:', error);
              });
  
              document.querySelector("button").innerText = "修改會員資訊";
          }
      }
  </script>
    <div class="tab_css">
      <input id="member" type="radio" name="tab" checked="checked"/>
      <label for="member">會員中心</label>
      <div class="tab_content">
        <div class="member">
            <h1>Membership</h1>
            <div class="profile">
              <img src="assets/image/member/profile.png" id="profile">
              <div class="profile-info">
                <h3>黃金VIP會員</h3>
                <div class="profile-info-bold">
                  <p><b>會員姓名：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" id="nameField" value="崔小朋" readonly>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>會員暱稱：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="nicknameField" value="807maker"/>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>電子郵件：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="emailField" value="treasuk427@gmail.com"/>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>常用地址：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="addressField" value="新北市新莊區中正路108號"/>
                  </div>
                </div>
                <hr>
                <h3>帳號密碼</h3>
                <div class="profile-info-bold">
                  <p><b>會員帳號：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="accountField" value="treasuk427"/>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>會員密碼：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="passwordField" value="Suk10022117_"/>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <div class="cart"><button onclick="editProfile()">修改會員資訊</button></div>
      </div>

      <input id="order" type="radio" name="tab" />
      <label for="order">訂單資料</label>
      <div class="tab_content">
        <div class="orders"> 
            <h1>My orders</h1>
            <p class="orders-type"><b>Product Types & Status</b></p>
            <a href="order.html" class="history-orders">
                <p>07/08/2024, 08:07</p>
                <p class="his-order">Order number 100221170807</p>
                <hr>
                    <div class ="history-info">
                        <img src="assets/image/wear/wear3.jpg" id="his-order">
                        <div class="history-information-text">
                            <p><b>Purchase confirmed</b></p>
                            <p>聖誕造型髮夾</p>
                            <p class="his-order">選項：第四款</p>
                        </div>
                        <div class ="history-text">
                            <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p><b><span class="price" style="color:black">NT$80</b></span></p>
                        </div>
                    </div>  
                <hr>
                    <div class ="history-info">
                        <img src="assets/image/cookie/product2.jpg" id="his-order">
                        <div class="history-information-text">
                            <p><b>Purchase confirmed</b></p>
                            <p>經典手作禮盒</p>
                            <p class="his-order">選項：蔓越莓酥</p>
                        </div>
                        <div class ="history-text">
                            <p class="his-order">數量：2&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p><b><span class="price" style="color:black">NT$400</b></span></p>
                        </div>
                    </div>
                <hr>
                <br><br>
                <p>21/04/2024, 04:21</p>
                <p class="his-order">Order number 100221170421</p>
                <hr>
                    <div class ="history-info">
                        <img src="assets/image/wear/wear4.jpg" id="his-order">
                        <div class="history-information-text">
                            <p><b>Purchase confirmed</b></p>
                            <p>聖誕髮箍</p>
                            <p class="his-order">選項：第一款</p>
                        </div>
                        <div class ="history-text">
                            <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p><b><span class="price" style="color:black">NT$80</b></span></p>
                        </div>
                    </div>
                <hr>
                    <div class ="history-info">
                        <img src="assets/image/decoration/decoration2.jpg" id="his-order">
                        <div class="history-information-text">
                            <p><b>Purchase confirmed</b></p>
                            <p>聖誕樹裝飾</p>
                            <p class="his-order">選項：第一款</p>
                        </div>
                        <div class ="history-text">
                            <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p><b><span class="price" style="color:black">NT$80</b></span></p>
                        </div>
                    </div>
                <hr>
                    <div class ="history-info">
                        <img src="assets/image/decoration/decoration3-4.jpg" id="his-order">
                        <div class="history-information-text">
                            <p><b>Purchase confirmed</b></p>
                            <p>聖誕小樹</p>
                            <p class="his-order">選項：第四款</p>
                      </div>
                        <div class ="history-text">
                            <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p><b><span class="price" style="color:black">NT$120</b></span></p>
                        </div>
                    </div>
                <hr>
            </a>
        </div>
      </div>

      <input id="comment" type="radio" name="tab" />
      <label for="comment">我的評價</label>
      <div class="tab_content">
        <div class="orders"> 
            <h1>My comments</h1>
            <p class="orders-type"><b>Product Review</b></p>
            <hr>
            <br>
            <div class="review">
              <img src="assets/image/member/profile.png" >
              <div class="review-info">
                <p>4*****l</p>
                <p>★★★★★</p>
                <p>2024/08/07 08:07</p>
              </div>
            </div>
            <div class="review-detail">
              <div class ="history-info">
                <img src="assets/image/wear/wear3.jpg" id="his-order">
                <div class="history-information-text">
                    <p><b>Purchase confirmed</b></p>
                    <p>聖誕造型髮夾</p>
                </div>
                <div class ="history-text">
                    <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                    <p><b><span class="price" style="color:black">NT$80</b></span></p>
                </div>
            </div>
            <hr>
            <div class ="history-info">
                <img src="assets/image/cookie/product2.jpg" id="his-order">
                <div class="history-information-text">
                    <p><b>Purchase confirmed</b></p>
                    <p>經典手作禮盒</p>
                </div>
                <div class ="history-text">
                    <p class="his-order">數量：2&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                    <p><b><span class="price" style="color:black">NT$400</b></span></p>
                </div>
            </div>
          </div>
          <br>
          <hr>
          <br>
          <div class="review">
            <img src="assets/image/member/profile.png" >
            <div class="review-info">
              <p>4*****l</p>
              <p>★★★★★</p>
              <p>2024/04/21 04:21</p>
            </div>
          </div>
          <div class="review-detail">
            <div class ="history-info">
              <img src="assets/image/wear/wear4.jpg" id="his-order">
              <div class="history-information-text">
                  <p><b>Purchase confirmed</b></p>
                  <p>聖誕髮箍</p>
              </div>
              <div class ="history-text">
                  <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                  <p><b><span class="price" style="color:black">NT$80</b></span></p>
              </div>
          </div>
          <hr>
          <div class ="history-info">
            <img src="assets/image/decoration/decoration2.jpg" id="his-order">
            <div class="history-information-text">
                <p><b>Purchase confirmed</b></p>
                <p>聖誕樹裝飾</p>
            </div>
            <div class ="history-text">
                <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                <p><b><span class="price" style="color:black">NT$80</b></span></p>
            </div>
        </div>
        <div class ="history-info">
            <img src="assets/image/decoration/decoration3-4.jpg" id="his-order">
            <div class="history-information-text">
                <p><b>Purchase confirmed</b></p>
                <p>聖誕小樹</p>
            </div>
            <div class ="history-text">
                <p class="his-order">數量：1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                <p><b><span class="price" style="color:black">NT$120</b></span></p>
            </div>
        </div>
      </div>
    </div>
  </div>
  </div>


  <footer>
    &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
  </footer>
    <script src="assets/js/index.js"></script>

  </body>
  </html>