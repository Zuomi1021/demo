<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
String enteredAccount = request.getParameter("account");
String accountFromDatabase = "";

String url = "jdbc:mysql://localhost:3306/index";
String dbUsername = "root";
String dbPassword = "1234";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, dbUsername, dbPassword);
    String query = "SELECT account FROM personal_data WHERE account=?";
    ps = con.prepareStatement(query);
    ps.setString(1, enteredAccount);
    rs = ps.executeQuery();

    if (rs.next()) {
        accountFromDatabase = rs.getString("account");
        session.setAttribute("accountFromDatabase", accountFromDatabase);
%>
        <script>
            var confirmSignup = confirm("驗證成功，請輸入新密碼。");
            if (confirmSignup) {
                window.location.href = "changepassword.jsp";
                }
        </script>
%>
    } else {
%>
        <script>
            var confirmSignup = confirm("帳號不存在，是否前往註冊頁面？");
            if (confirmSignup) {
                window.location.href = "signup.jsp";
            } else {
                window.location.href = "password.jsp";
            }
        </script>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (SQLException e) { /* 處理或忽略 */ }
    try { if (ps != null) ps.close(); } catch (SQLException e) { /* 處理或忽略 */ }
    try { if (con != null) con.close(); } catch (SQLException e) { /* 處理或忽略 */ }
}
%>
