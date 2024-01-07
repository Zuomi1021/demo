<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
if (request.getParameter("deleteItem") != null) {
    int itemIdToDelete = Integer.parseInt(request.getParameter("deleteItem"));
    Connection conn = null;
    PreparedStatement deleteStmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
        String username = "root";
        String password = "1234";
        conn = DriverManager.getConnection(url, username, password);

        // 刪除項目
        String deleteSql = "DELETE FROM car WHERE id = ?";
        deleteStmt = conn.prepareStatement(deleteSql);
        deleteStmt.setInt(1, itemIdToDelete);
        deleteStmt.executeUpdate();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        // 需要時處理異常
    } finally {
        // 關閉資源
        try {
            if (deleteStmt != null) deleteStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 刪除後重新導向或刷新頁面
    response.sendRedirect("car.jsp");
} else if (request.getParameter("updatedQuantity") != null) {
    // 更新相應商品的數量
    int itemIdToUpdate = Integer.parseInt(request.getParameter("itemId"));
    int updatedQuantity = Integer.parseInt(request.getParameter("updatedQuantity"));
    Connection conn = null;
    PreparedStatement updateStmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost/index?serverTimezone=UTC";
        String username = "root";
        String password = "1234";
        conn = DriverManager.getConnection(url, username, password);

        // 更新數量
        String updateSql = "UPDATE car SET quantity = ? WHERE id = ?";
        updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setInt(1, updatedQuantity);
        updateStmt.setInt(2, itemIdToUpdate);
        updateStmt.executeUpdate();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        // 需要時處理異常
    } finally {
        // 關閉資源
        try {
            if (updateStmt != null) updateStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 重新導向或刷新頁面
    response.sendRedirect("car.jsp");
}
%>