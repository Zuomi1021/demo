<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>

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
      String account = (String) session.getAttribute("account");
      if(account == null) {
          response.sendRedirect("member.jsp");
      }
    String name = "", nickname = "", email = "", address = "", password = "", pfp = "", auth = "";
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/index", "root", "1234");
        String query = "SELECT name, nickname, email, address, password, pfp, auth FROM personal_data WHERE account = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, account);
        ResultSet rs = stmt.executeQuery();
    
        if (rs.next()) {
            name = rs.getString("name");
            nickname = rs.getString("nickname");
            email = rs.getString("email");
            address = rs.getString("address");
            password = rs.getString("password");
            pfp = rs.getString("pfp");
            auth = rs.getString("auth");
        }
    
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    request.setAttribute("Pfp", pfp);
    request.setAttribute("Name", name);
    request.setAttribute("Nickname", nickname);
    request.setAttribute("Email", email);
    request.setAttribute("Address", address);
    request.setAttribute("Password", password);
    request.setAttribute("Auth", auth);

    String nameField = request.getParameter("nameField");
    String filteredNameField = "";
    if (nameField != null) {
        Pattern pattern = Pattern.compile("[\\u4E00-\\u9FFFa-zA-Z0-9]+");
        Matcher matcher = pattern.matcher(nameField);
        StringBuilder sb = new StringBuilder();
        while (matcher.find()) {
            sb.append(matcher.group());
        }
        filteredNameField = sb.toString();
    }
    
    String nicknameField = request.getParameter("nicknameField");
    String filteredNicknameField = "";
    if (nicknameField != null) {
        Pattern pattern = Pattern.compile("[\\u4E00-\\u9FFFa-zA-Z0-9]+");
        Matcher matcher = pattern.matcher(nicknameField);
        StringBuilder sb = new StringBuilder();
        while (matcher.find()) {
            sb.append(matcher.group());
        }
        filteredNicknameField = sb.toString();
    }
    
    String addressField = request.getParameter("addressField");
    String filteredAddressField = "";
    if (addressField != null) {
        Pattern pattern = Pattern.compile("[\\u4E00-\\u9FFFa-zA-Z0-9]+");
        Matcher matcher = pattern.matcher(addressField);
        StringBuilder sb = new StringBuilder();
        while (matcher.find()) {
            sb.append(matcher.group());
        }
        filteredAddressField = sb.toString();
    }
    
    String emailField = request.getParameter("emailField");
    String filteredEmailField = "";
    if (emailField != null) {
        Pattern pattern = Pattern.compile("[\\u4E00-\\u9FFFa-zA-Z0-9]+");
        Matcher matcher = pattern.matcher(emailField);
        StringBuilder sb = new StringBuilder();
        while (matcher.find()) {
            sb.append(matcher.group());
        }
        filteredEmailField = sb.toString();
    }
    
%>



      
    <div class="tab_css">
      <input id="member" type="radio" name="tab" checked="checked"/>
      <label for="member">會員中心</label>
      <div class="tab_content">
        <form action="updateProfile.jsp" method="post" accept-charset="UTF-8" onsubmit="return validateForm()">
        <div class="member">
            <h1>Membership</h1>
            <div class="profile">
              <img src='assets/image/<%= request.getAttribute("Pfp") %>.png' id="profile">
              <div class="profile-info">
                <h3><%= request.getAttribute("Auth") %></h3>
                <div class="profile-info-bold">
                  <p><b>會員姓名：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="nameField" value='<%= request.getAttribute("Name") %>'/>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>會員暱稱：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="nicknameField" value='<%= request.getAttribute("Nickname") %>'/>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>電子郵件：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="emailField" value='<%= request.getAttribute("Email") %>'/>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>常用地址：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="addressField" value='<%= request.getAttribute("Address") %>'/>
                  </div>
                </div>
                <hr>
                <h3>帳號密碼</h3>
                <div class="profile-info-bold">
                  <p><b>會員帳號：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="text" name="accountField" value="<%= account %>" readonly>
                  </div>
                </div>
                <div class="profile-info-bold">
                  <p><b>會員密碼：</b></p>
                  <div class="profile-info-bold-input">
                    <input type="password" name="passwordField" value='<%= request.getAttribute("Password") %>' readonly>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <button class="cart" type="submit">修改會員資訊</button>
      </form>
      <a href="password.jsp" class="nonline"><button class="cart">變更密碼</button></a>
      </div>

      <input id="order" type="radio" name="tab" />
      <label for="order">訂單資料</label>
      <div class="tab_content">
        <div class="orders"> 
            <h1>My orders</h1>
            <p class="orders-type"><b>Product Types & Status</b></p>
            <a href="order.jsp" class="history-orders">
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