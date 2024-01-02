<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.sql.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <%
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("password-repeat");
    String sex = request.getParameter("sex");
    String birthday = request.getParameter("birthday");
    String phone_number = request.getParameter("phone_number");
    String email = request.getParameter("email");
    String address = request.getParameter("address");

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/index";
    String dbUsername = "root";
    String dbPassword = "1234";

    Connection con = null;
    PreparedStatement ps = null;

    if (!password.equals(confirmPassword)) {
    %>
        <script>
            alert("密碼不符，請重新輸入！");
            window.location.href = "signup.jsp";
        </script>
    <%
    } else {
        try {
            con = DriverManager.getConnection(url, dbUsername, dbPassword);

            String queryAccount = "SELECT * FROM personal_data WHERE account = ?";
            ps = con.prepareStatement(queryAccount);
            ps.setString(1, account);
            ResultSet rsAccount = ps.executeQuery();
            if (rsAccount.next()) {
    %>
                <script>
                    var confirmAccount = confirm("該帳號已存在，請問要登入嗎?");
                    if (confirmAccount) {
                        window.location.href = "member.jsp";
                    } else {
                        window.location.href = "signup.jsp";
                    }
                </script>
    <%
            } else {
                String queryPassword = "SELECT * FROM personal_data WHERE password = ?";
                ps = con.prepareStatement(queryPassword);
                ps.setString(1, password);
                ResultSet rsPassword = ps.executeQuery();
                if (rsPassword.next()) {
    %>
                    <script>
                        alert("該密碼已存在，請重新註冊。");
                        window.location.href = "signup.jsp";
                    </script>
    <%
                } else {
                    String queryEmail = "SELECT * FROM personal_data WHERE email = ?";
                    ps = con.prepareStatement(queryEmail);
                    ps.setString(1, email);
                    ResultSet rsEmail = ps.executeQuery();
                    if (rsEmail.next()) {
    %>
                        <script>
                            var confirmEmail = confirm("該信箱已存在，請問要登入嗎?");
                            if (confirmEmail) {
                                window.location.href = "member.jsp";
                            } else {
                                window.location.href = "signup.jsp";
                            }
                        </script>
    <%
                    } else {
                        String insertQuery = "INSERT INTO personal_data (account, password, sex, birthday, phone_number, email, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
                        ps = con.prepareStatement(insertQuery);
                        ps.setString(1, account);
                        ps.setString(2, password);
                        ps.setString(3, sex);
                        ps.setString(4, birthday);
                        ps.setString(5, phone_number);
                        ps.setString(6, email);
                        ps.setString(7, address);
                        ps.executeUpdate();
                        response.sendRedirect("member.jsp");
                    }
                }
            }
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
            out.println("SQLState: " + e.getSQLState());
            out.println("VendorError: " + e.getErrorCode());
            response.sendRedirect("signup.jsp");
        } catch (Exception e) {
            out.println("Exception: " + e.getMessage());
            response.sendRedirect("signup.jsp");
        } finally {
            try { if (ps != null) ps.close(); } catch (SQLException e) { /* 無需處理 */ }
            try { if (con != null) con.close(); } catch (SQLException e) { /* 無需處理 */ }
        }
    }
    %>
</body>
</html>
