<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.net.URLDecoder, javax.servlet.http.*" %>

<%! 
    public boolean fieldNameExists(String fieldName, ResultSetMetaData metaData) throws SQLException {
        int columnCount = metaData.getColumnCount();
        for (int i = 1; i <= columnCount; i++) {
            String columnName = metaData.getColumnName(i);
            if (fieldName.equalsIgnoreCase(columnName)) {
                return true; // 如果欄位名稱存在於資料庫中，返回 true
            }
        }
        return false;
    }
%>

<%
    HttpSession sessionObj = request.getSession();
    String tableName = request.getParameter("tableName");
    String editMode = request.getParameter("editMode");

    if (tableName != null && editMode != null) {
        // 你已經有了表單提交的數據 rowData 字符串
        String modifiedData = (String) sessionObj.getAttribute("modifiedData");
        String[] rows = modifiedData.split("\n"); // 按行拆分

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/index", "root", "1234");

            String selectQuery = "SELECT * FROM " + tableName + " WHERE id = ?";
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));

            rs = pstmt.executeQuery();

            if (rs.next()) {
                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();

                StringBuilder updateQuery = new StringBuilder("UPDATE " + tableName + " SET ");

                // 遍歷每一行數據
                for (String row : rows) {
                    String[] fields = row.split(":"); // 按照冒號拆分

                    String fieldName = fields[0].trim(); // 欄位名稱
                    String fieldValue = fields[1].trim(); // 欄位值

                    // 檢查欄位名稱是否存在於資料庫中
                    if (fieldNameExists(fieldName, metaData)) {
                        String dbValue = rs.getString(fieldName); // 資料庫中的值

                        // 只更新與表單提交的資料不同的部分
                        if (!dbValue.equals(fieldValue)) {
                            updateQuery.append(fieldName).append(" = ?, ");
                        }
                    }
                }

                // 移除最後一個逗號和空格
                if (updateQuery.length() > 0) {
                    updateQuery.setLength(updateQuery.length() - 2);
                }

                updateQuery.append(" WHERE id = ?");
                pstmt = conn.prepareStatement(updateQuery.toString());

                // 設置更新的值
                int paramIndex = 1;
                for (String row : rows) {
                    String[] fields = row.split(":");
                    String fieldName = fields[0].trim();
                    String fieldValue = fields[1].trim();

                    if (fieldNameExists(fieldName, metaData)) {
                        String dbValue = rs.getString(fieldName);
                        if (!dbValue.equals(fieldValue)) {
                            pstmt.setString(paramIndex, fieldValue);
                            paramIndex++;
                        }
                    }
                }

                // 設置 WHERE 條件
                pstmt.setInt(paramIndex, Integer.parseInt(request.getParameter("id")));

                pstmt.executeUpdate();
                response.sendRedirect("viewData.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
