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

    if (rs.next()) {
        session.setAttribute("username", username);
        response.sendRedirect("index.jsp"); // 登入成功，導向到登入後的頁面
    } else {
        // 登入失敗，導向回登入頁
        response.sendRedirect("login.jsp");
    }
} catch (SQLException e) {
    // SQL 錯誤，導向回登入頁
    response.sendRedirect("login.jsp");
} catch (Exception e) {
    // 其他錯誤，導向回登入頁
    response.sendRedirect("login.jsp");
} finally {
    // 關閉資源
    try { if (rs != null) rs.close(); } catch (SQLException e) { /* 無需處理 */ }
    try { if (ps != null) ps.close(); } catch (SQLException e) { /* 無需處理 */ }
    try { if (con != null) con.close(); } catch (SQLException e) { /* 無需處理 */ }
}
%>
