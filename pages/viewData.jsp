<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>聖誕YA管理員後台</title>
        <link rel="stylesheet" href="assets/css/center.css">
        <link rel="stylesheet" href="assets/css/member.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hedvig+Letters+Serif:opsz@12..24&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="icon" href="assets/image/aboutus/logo.png">
    </head>
    
<%
    String rank = "top";
%>
<style>
    footer {
        position: fixed;
        bottom: 0;
        width: 100%;
    }
    
        /* 容器 */
        .table-container {
            width: 100%;
            max-width: 80%;
            height: 500px;
            overflow: auto;
            margin: auto;
        }

        /* 表格樣式 */
        table {
            width: 100%; /* 讓表格填滿容器寬度 */
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    
</style>
<body>
    <h2>後台資料表</h2>

    <form>
        <label for="tableSelect">選擇資料表:</label>
        <select id="tableSelect" onchange="getSelectedTableData()">
            <option value="ad">ad</option>
            <option value="respond">respond</option>
            <option value="manager">manager</option>
            <option value="order">order</option>
            <option value="payway">payway</option>
            <option value="personal_data">personal_data</option>
            <option value="product">product</option>
        </select>
    </form>


    <div id="tableData"class="table-container"></div>
    <button onclick="logout()" class="cart">登出</button>
    <script>
function getSelectedTableData() {
    var selectedTable = $("#tableSelect").val();

    $.ajax({
        type: "POST",
        url: "tableData.jsp",
        data: { tableName: selectedTable },
        success: function(response) {
            $("#tableData").html(response);
        }
    });
}



        $(document).ready(function() {
            getSelectedTableData();
        });
        function logout() {
    var confirmLogout = confirm('登出成功，請問要重新登入嗎？\n點選確認將前往管理者登入介面，取消則返回首頁。');
    if (confirmLogout) {
        window.location.href = "manager.jsp";
    } else {
        window.location.href = "index.jsp";
    }
}


    </script>
        <footer>
            &copy; 2023 蔡貽琳 李芸妘 鄭夙妙 邱凱琳 陳家謙 許明琪
          </footer>
        
</body>
</html>