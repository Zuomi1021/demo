<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("nameField");
    String nickname = request.getParameter("nicknameField");
    String email = request.getParameter("emailField");
    String address = request.getParameter("addressField");
    String account = request.getParameter("accountField");
    String password = request.getParameter("passwordField");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/index", "root", "1234");
        
        String query = "UPDATE personal_data SET name=?, nickname=?, email=?, address=?, password=? WHERE account=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, name);
        stmt.setString(2, nickname);
        stmt.setString(3, email);
        stmt.setString(4, address);
        stmt.setString(5, password);
        stmt.setString(6, account);

        stmt.executeUpdate();

        stmt.close();
        conn.close();
        
        response.sendRedirect("center.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
