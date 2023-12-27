<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
// 取得提交的帳號資料
String enteredAccount = request.getParameter("account");
String accountFromDatabase = "";

String url = "jdbc:mysql://localhost:3306/your_database_name?serverTimezone=UTC";
String dbUsername = "root";
String dbPassword = "1234";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    // 連接資料庫，執行查詢
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, dbUsername, dbPassword);
    String query = "SELECT account FROM personal_data WHERE account=?";
    ps = con.prepareStatement(query);
    ps.setString(1, enteredAccount);
    rs = ps.executeQuery();

    // 若查詢到帳號，設定 session 屬性並重定向至另一個頁面
    if (rs.next()) {
        accountFromDatabase = rs.getString("account");
        session.setAttribute("accountFromDatabase", accountFromDatabase);
        response.sendRedirect("changepassword.jsp");
    } else {
        // 若未查詢到帳號，印出訊息並重定向至原始的 password.jsp
        out.println("帳號驗證失敗，請再試一次。");
        response.sendRedirect("password.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // 清理資源
    try { if (rs != null) rs.close(); } catch (SQLException e) { /* 處理或忽略 */ }
    try { if (ps != null) ps.close(); } catch (SQLException e) { /* 處理或忽略 */ }
    try { if (con != null) con.close(); } catch (SQLException e) { /* 處理或忽略 */ }
}
%>
