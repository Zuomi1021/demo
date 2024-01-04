<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%
    String rowData = request.getParameter("rowData");
    String tableName = request.getParameter("tableName");
    String editMode = request.getParameter("editMode");
    HttpSession sessionObj = request.getSession();
    sessionObj.setAttribute("modifiedData", rowData);
    String rank = (String) sessionObj.getAttribute("rank");
    String loggedInUser = (String) sessionObj.getAttribute("loggedInUser");
%>

<!DOCTYPE html>
<html>
<head>
    <style>
        .table-container {
            width: 100%;
            max-width: 1000px;
            height: 500px;
            overflow: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        input[readonly] {
            border: none;
            outline: none;
            background-color: transparent;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <% if (("manager".equals(tableName) && "top".equals(rank)) || !"manager".equals(tableName)) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/index", "root", "1234");
    
            String query = "SELECT * FROM " + tableName;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            out.println("<form id='myForm' action='updateData.jsp' method='post' accept-charset='UTF-8'>");
            out.println("<table>");
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
    
            out.println("<tr>");
            for (int i = 1; i <= columnCount; i++) {
                out.println("<th>" + metaData.getColumnName(i) + "</th>");
            }
            out.println("</tr>");
    
            while (rs.next()) {
                out.println("<tr>");
                for (int j = 1; j <= columnCount; j++) {
                    String fieldValue = rs.getString(j);
                    if ("true".equals(editMode)) {
                        out.println("<td><input type='text' value='" + fieldValue + "' name='field_" + j + "' id='field_" + j + "'></td>");
                    } else {
                        out.println("<td><input type='text' value='" + fieldValue + "' readonly name='field_" + j + "' id='field_" + j + "'></td>");
                    }
                }
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</form>");
            out.println("<button onclick='changetype()' class='cart'>編輯</button>");
            out.println("<button onclick='submitForm()' class='cart'>確認</button>");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        out.println("<p>您沒有訪問該資料表的權限。</p>");
    }
    %>
    <script>
        function changetype() {
            var fields = document.querySelectorAll("input[readonly]");
    
            for (var i = 0; i < fields.length; i++) {
                fields[i].readOnly = false;
            }
    
            var editButton = document.querySelector(".cart:nth-child(2)");
            editButton.style.display = "none"; // Hide the edit button
            var confirmButton = document.querySelector(".cart:first-child");
            confirmButton.style.display = "inline-block"; // Display the confirm button
        }
        
        function submitForm() {
            var form = document.getElementById("myForm");
            form.submit();
        }
    </script>
</body>
</html>
