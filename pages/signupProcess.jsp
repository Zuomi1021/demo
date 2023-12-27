<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
String username = request.getParameter("account");
String password = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/index";
String dbUsername = "root";
String dbPassword = "1234";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = DriverManager.getConnection(url, dbUsername, dbPassword);
    String query = "SELECT * FROM personal_data WHERE account=? AND password=?";
    ps = con.prepareStatement(query);
    ps.setString(1, username);
    ps.setString(2, password);
    rs = ps.executeQuery();
    response.sendRedirect("login.jsp"); // 註冊成功，導向回登入頁
} catch (SQLException e) {
    // SQL 錯誤，導向回註冊頁
    response.sendRedirect("signup.jsp");
} catch (Exception e) {
    // 其他錯誤，導向回註冊頁
    response.sendRedirect("signup.jsp");
} finally {
    // 關閉資源
    try { if (ps != null) ps.close(); } catch (SQLException e) { /* 無需處理 */ }
    try { if (con != null) con.close(); } catch (SQLException e) { /* 無需處理 */ }
}
%>
