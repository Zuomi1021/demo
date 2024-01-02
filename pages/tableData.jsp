<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
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
    </style>
</head>
<body>

    <%
    String rank = (String) session.getAttribute("rank");
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    String tableName = request.getParameter("tableName");
    
    if (("manager".equals(tableName) && "top".equals(rank)) || !"manager".equals(tableName)) {
        // Allow access to "manager" table only for users with "top" rank
        // Allow access to other tables for all users
    
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/index", "root", "1234");
    
            String query = "SELECT * FROM " + tableName;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            
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
                for (int i = 1; i <= columnCount; i++) {
                    out.println("<td>" + rs.getString(i) + "</td>");
                }
                out.println("</tr>");
            }
            out.println("</table>");
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
    
</body>
</html>
