<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聖誕YA</title>
    <link rel="stylesheet" href="assets/css/member.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hedvig+Letters+Serif:opsz@12..24&display=swap" rel="stylesheet">
    <link rel="icon" href="assets/image/aboutus/logo.png">
</head>

<body>
  
    <form action="checkLogin.jsp" method="post">
        <div class="container">
            <h1>管理員登入</h1>
    
            <div class="label-container">
                <label for="account"><b>帳號:</b></label>
                <input type="text" placeholder="Enter Account" name="account" required>
            </div>
            
            <div class="label-container">
                <label for="password"><b>密碼:</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>
            </div>
            
    
            <div class="clearfix">
                <button type="submit" class="signupbtn">登入</button>
            </div>
            
            
        </div>
    </form>
    
    <footer>
      &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
    </footer>

    <script src="assets/js/index.js"></script>

  </body>
</html>