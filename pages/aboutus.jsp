<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/aboutus.css">
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
  
    <div class="container aboutus-part">
        <div class="card-item">
          <div class="card">
            <div class="imgBx">
              <img class="myphoto" src="assets/image/aboutus/tsai.jpg" />
            </div>
            <div class="content">
              <div class="details">
                <h2>網頁前端 蔡貽琳</h2>
                <p>
                    期中雖然寫過個人履歷有點概念，但電子商務網站的難度比個人履歷高了非常多。熬了無數個夜晚查了無數個網站，看到成品出來真的很有成就感！
                </p>
                <ul class="social-icons">
                  <li>
                    <a href="https://www.facebook.com/profile.php?id=100014097010360" target="_blank" ><i class="fa-brands fa-square-facebook"></i></a>
                  </li>
                  <li>
                    <a
                      href="https://www.instagram.com/421yl/"
                      target="_blank"
                      ><i class="fa-brands fa-square-instagram"></i
                    ></a>
                  </li>
                  <li>
                    <a href="mailto:irene030325@gmail.com" target="_blank"
                      ><i class="fa-solid fa-square-envelope"></i
                    ></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        
        <div class="card-item">
          <div class="card">
            <div class="imgBx">
              <img class="myphoto" src="assets/image/aboutus/yun.jpg" />
            </div>
            <div class="content">
              <div class="details">
                <h2>網頁前端 李芸妘</h2>
                <p>
                  網站設計是一項全新的挑戰，從打草稿、寫出架構、排版到最後與後端結合，都是從未有過的經驗，而在寫程式中我體會到「耐心」及「不放棄」的重要性，也很感謝這難得的機會，讓我在撰寫程式方面有所進步。 
                </p>
                <ul class="social-icons">
                  <li>
                    <a
                      href="https://www.facebook.com/profile.php?id=100015064033181"
                      target="_blank"
                      ><i class="fa-brands fa-square-facebook"></i
                    ></a>
                  </li>
                  <li>
                    <a href="https://www.instagram.com/yuunnli/?utm_source=ig_web_button_share_sheet&igshid=OGQ5ZDc2ODk2ZA==" target="_blank">
                      <i class="fa-brands fa-square-instagram"></i>
                    </a>
                  </li>
                  <li>
                    <a href="mailto:vivi@marvelmax.com.tw" target="_blank">
                      <i class="fa-solid fa-square-envelope"></i>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="card-item">
          <div class="card">
            <div class="imgBx">
              <img class="myphoto" src="assets/image/aboutus/miao.jpg" />
            </div>
            <div class="content">
              <div class="details">
                <h2>網頁前端 鄭夙妙</h2>
                <p>
                  這個專案做下來總體感覺有難度，雖然上課有教一些概念，但是真正執行時，就會發現還有好多東西都是要自己去摸索才能寫出來的，所以能完成這個專案，讓人感覺成就感滿滿！
                </p>
                <ul class="social-icons">
                  <li>
                    <a
                      href="https://www.facebook.com/profile.php?id=100010759778483&mibextid=REkXMA"
                      target="_blank"
                      ><i class="fa-brands fa-square-facebook"></i
                    ></a>
                  </li>
                  <li>
                    <a
                      href="https://www.instagram.com/147__miao/?utm_source=ig_web_button_share_sheet&igshid=OGQ5ZDc2ODk2ZA=="
                      target="_blank"
                      ><i class="fa-brands fa-square-instagram"></i
                    ></a>
                  </li>
                  <li>
                    <a href="mailto:sophie650617@gmail.com" target="_blank"
                      ><i class="fa-solid fa-square-envelope"></i
                    ></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="card-item">
          <div class="card">
            <div class="imgBx">
              <img class="myphoto" src="#" />
            </div>
            <div class="content">
              <div class="details">
                <h2>網頁後端 許明琪</h2>
                <p>OOO</p>
                <ul class="social-icons">
                  <li>
                    <a href="#" target="_blank"
                      ><i class="fa-brands fa-square-facebook"></i
                    ></a>
                  </li>
                  <li>
                    <a href="#" target="_blank"
                      ><i class="fa-brands fa-square-instagram"></i
                    ></a>
                  </li>
                  <li>
                    <a href="mailto:#" target="_blank"
                      ><i class="fa-solid fa-square-envelope"></i
                    ></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="card-item">
            <div class="card">
              <div class="imgBx">
                <img class="myphoto" src="#" />
              </div>
              <div class="content">
                <div class="details">
                  <h2>網頁後端 陳家謙</h2>
                  <p>
                    OOO
                  </p>
                  <ul class="social-icons">
                    <li>
                      <a href="#" target="_blank"
                        ><i class="fa-brands fa-square-facebook"></i
                      ></a>
                    </li>
                    <li>
                      <a href="#" target="_blank"
                        ><i class="fa-brands fa-square-instagram"></i
                      ></a>
                    </li>
                    <li>
                      <a href="mailto:#" target="_blank"
                        ><i class="fa-solid fa-square-envelope"></i
                      ></a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="card-item">
            <div class="card">
              <div class="imgBx">
                <img class="myphoto" src="#" />
              </div>
              <div class="content">
                <div class="details">
                  <h2>網頁後端 邱凱琳</h2>
                  <p>OOO</p>
                  <ul class="social-icons">
                    <li>
                      <a href="#" target="_blank"
                        ><i class="fa-brands fa-square-facebook"></i
                      ></a>
                    </li>
                    <li>
                      <a href="#" target="_blank"
                        ><i class="fa-brands fa-square-instagram"></i
                      ></a>
                    </li>
                    <li>
                      <a href="mailto:#" target="_blank"
                        ><i class="fa-solid fa-square-envelope"></i
                      ></a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
    </div>

    <script
      src="https://kit.fontawesome.com/e2df7f4d73.js"
      crossorigin="anonymous"
    ></script>

    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>

  </body>
  </html>