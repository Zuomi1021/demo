<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
  <head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/commodity.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hedvig+Letters+Serif:opsz@12..24&display=swap" rel="stylesheet">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
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

  <div class="product-container">
      <div class="product-details">
          <div class="product-image">
              <img src="assets/image/cookie/product2.jpg" id="mainPhoto">
          </div>
          <div class="imgs">
              <img src="assets/image/cookie/product2.jpg" class="photos">
              <img src="assets/image/cookie/product2-1.jpg" class="photos">
              <img src="assets/image/cookie/product2-2.jpg" class="photos">
              <img src="assets/image/cookie/product2-3.jpg" class="photos">
          </div>
      </div>
      <div class="product-info">
          <h3><b>經典手作禮盒</h3></b>
          <h4><b>NT$ 200</h4></b>
          <br>
          <div id="checkbox" class="box">
            <label><input type="radio" name="variety"><span class="round button">蔓越莓酥</span></label>
            <label><input type="radio" name="variety"><span class="round button">伯爵茶餅乾</span></label>
            <label><input type="radio" name="variety"><span class="round button">香凝桔球</span></label>
          </div>
          <div class="quantity-container">
              <div class="btn-numbox">
                  <span id="num-jian" class="quantity-btn">-</span>
                  <input type="text" class="input-num" id="input-num" value="0"/>
                  <span id="num-jia" class="quantity-btn">+</span>
              </div>
          </div>
          <br>
          <div class="quantity">
              <div class="text">
                  <span class="left">已售出：120</span>
                  <span class="right">庫存數量：50</span>
              </div>
          </div>
          <button class="add-to-cart">加入購物車</button>
          <button type="button" class="checkout" onclick="window.location.href='car.html'">直接結帳</button>
      </div>
  </div>

  <h4><b>PRODUCT INFORMATION</h4></b>
  <div class="describe">
      <h4 class="product-title">經典手作禮盒</h4>
      <p>餅乾入口的那一剎那，是心的悸動，是味蕾的饗宴，更是幸福的滋味。</p>
      <br>
      <h4 class="product-title">口味</h4>
      <p>遇見美好-蔓越莓酥</p>
      <p>想念的你-伯爵茶餅乾</p>
      <p>微酸戀曲-香凝桔球。</p>
      <br>
      <h4 class="product-title">產品規格</h4>
      <p>遇見美好-蔓越莓酥 4片/盒。</p>
      <p>想念的你-伯爵茶餅乾 8片/盒。</p>
      <p>微酸戀曲-香檸桔球 8-12個/盒。</p>
      <br>
      <h4 class="product-title">內容物/成分</h4>
      <p>✶遇見美好-蔓越莓酥｜成份－低筋麵粉、安佳奶油、蔓越莓乾、砂糖、雞蛋白(白殼)、低鈉鹽。</p>
      <p>✶想念的你-伯爵茶餅乾｜成份－低筋麵粉、安佳奶油、糖粉、安佳牛奶、伯爵紅茶。</p>
      <p>✶微酸戀曲-香檸桔球｜成份－低筋麵粉、安佳奶油、桔子皮、糖粉、雞蛋白(白殼)、檸檬汁。</p>
  </div>
    <br><br>
    <h4><b>COMMENTS</h4></b>
    <main class="container-fluid">
      <article>
        <section class="container product-part">
          <div class="tabs-part row">
              <div id="review-comment" class="tabcontent review-comment">
                <div class="row">
                  <div class="col-12 col-md-6 col-xl-6 review">
                    <!--<div class="title">評論</div>-->
                    <div class="all-review">

                      <div class="review-item">
                        <div class="information">
                          <div class="top">
                            <div class="left">
                              <!-- 頭像 -->
                              <img src="assets/image/member/profile.png" />
                              <div class="name-rating">
                                <!-- 評論人 -->
                                <div class="name">4****l</div>
                                <!-- 評論星等 -->
                                <div class="rating">★★★★★</div>
                              </div>
                            </div>
                            <div class="right">
                              <!-- 評論日期 -->
                              <div class="date">2024-04-21</div>
                            </div>
                          </div>

                          <div class="bottom">
                            <!-- 評論內容 -->
                            <div class="text">
                              包裝完善，整體外觀美麗又療癒！
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="review-item">
                        <div class="information">
                          <div class="top">
                            <div class="left">
                              <img src="assets/image/member/profile.png" />
                              <div class="name-rating">
                                <div class="name">h****k</div>
                                <div class="rating">★★★★★</div>
                              </div>
                            </div>
                            <div class="right">
                              <div class="date">2024-04-21</div>
                            </div>
                          </div>

                          <div class="bottom">
                            <div class="text">商品毫無瑕疵，非常漂亮~</div>
                          </div>
                        </div>
                      </div>
                      <div class="review-item">
                        <div class="information">
                          <div class="top">
                            <div class="left">
                              <img src="assets/image/member/profile.png" />
                              <div class="name-rating">
                                <div class="name">t****e</div>
                                <div class="rating">★★★★★</div>
                              </div>
                            </div>
                            <div class="right">
                              <div class="date">2024-08-07</div>
                            </div>
                          </div>

                          <div class="bottom">
                            <div class="text">看到商品後真的超喜歡~~</div>
                          </div>
                        </div>
                      </div>
                    
                    </div>
                  </div>
                  <!-- 留言板 -->
                  <div class="col-12 col-md-6 col-xl-6 comment">
                    <!--<div class="title">留言</div>-->
                    <form id="comment" method="post" action="#">
                      <!-- 留言人名字 -->
                      <label>Name</label>
                      <input
                        class="form-control shadow-none name"
                        type="text"
                      /><br />
                      <!-- 留言內容 -->
                      <p>Comment</p>
                      <textarea
                        class="form-control shadow-none"
                        id="content"
                        rows="4"
                        name=""
                        placeholder=""
                      ></textarea>
                      <!-- 星等 -->
                      <div class="rating-summit-part">
                        <div class="rating">
                          <input type="radio" name="star" id="star5" /><label
                            for="star5"
                          ></label>
                          <input type="radio" name="star" id="star4" /><label
                            for="star4"
                          ></label>
                          <input type="radio" name="star" id="star3" /><label
                            for="star3"
                          ></label>
                          <input type="radio" name="star" id="star2" /><label
                            for="star2"
                          ></label>
                          <input type="radio" name="star" id="star1" /><label
                            for="star1"
                          ></label>
                        </div>
                        <!-- 送出 -->
                        <input
                          class="submit"
                          type="submit"
                          value="送出"
                          onclick="submitComment()"
                        />
                      </div>
                    </form>
                  </div>
                </div>
              </div>
        <!------------------ 各版面內容結束---------------------------------------------------------------------------------- -->
      </article>
    </main>
    <div class="suggest">
        <h4><b>RECOMMEND PRODUCTS</h4></b>
        <form>
            <div class="product">
                <a href="product.html"><img class="form-img" src="assets/image/cookie/product1.jpg"></a>
                <h4><b>杏仁手工餅乾</h4></b>
            </div>
    
            <div class="product">
                <a href="product.html"><img class="form-img" src="assets/image/cookie/product3.jpg"></a>
                <h4><b>巧克力夏威夷果</h4></b> 
            </div>
    
            <div class="product">
                <a href="product.html"><img class="form-img" src="assets/image/cookie/product5.jpg"></a>
                <h4><b>噠啵曲奇-雙拼派對</h4></b>
            </div>              
        </form>
    </div>


    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>

    <script src="assets/js/commodity.js"></script>
    <script src="assets/js/photo.js"></script>
    <script src="assets/js/product.js"></script>
    <script src="js/product.js"></script>
   
  </body>
</html>
