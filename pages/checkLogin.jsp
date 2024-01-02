<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%
String account = request.getParameter("account");
String password = request.getParameter("password");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/index", "root", "1234");

    String query = "SELECT * FROM manager WHERE account = ? AND password = ?";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, account);
    pstmt.setString(2, password);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        String rank = rs.getString("rank");
        if (rank != null) {
            session.setAttribute("rank", rank);
            session.setAttribute("loggedInUser", account);
            response.sendRedirect("viewData.jsp");
        } else {
            response.sendRedirect("manager.jsp");
        }
    } else {
        response.sendRedirect("manager.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Close connections and resources
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
