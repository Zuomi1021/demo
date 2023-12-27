<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
String account = request.getParameter("account");
String password = request.getParameter("password");

String url = "jdbc:mysql://localhost:3306/index";
String dbUsername = "root";
String dbPassword = "1234";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, dbUsername, dbPassword);
    String query = "SELECT * FROM personal_data WHERE account=? AND password=?";
    ps = con.prepareStatement(query);
    ps.setString(1, account);
    ps.setString(2, password);
    rs = ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("account", account);
        response.sendRedirect("index.jsp");
    } else {

        response.sendRedirect("member.jsp");
    }
} catch (SQLException e) {

    e.printStackTrace(); 

    response.sendRedirect("member.jsp");
} catch (Exception e) {

    e.printStackTrace(); 

    response.sendRedirect("member.jsp");
} finally {

    try { if (rs != null) rs.close(); } catch (SQLException e) { /* 無需處理 */ }
    try { if (ps != null) ps.close(); } catch (SQLException e) { /* 無需處理 */ }
    try { if (con != null) con.close(); } catch (SQLException e) { /* 無需處理 */ }
}
%>
