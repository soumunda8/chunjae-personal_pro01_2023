<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.dto.*" %>
<%@ page import="com.plusnplus.util.*" %>
<%@ include file="/layout/encoding.jsp"%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";
    String originPw = "";

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {
        sql = "select id, pw from member where id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            originPw = AES256.decryptAES256(rs.getString("pw"), "%02x");

            if(originPw.equals(pw)) {

                session.setAttribute("sid", rs.getString("id"));
                response.sendRedirect(request.getContextPath() + "/");

            } else {
                response.sendRedirect(request.getContextPath() + "/member/login.jsp?errMsg=fail");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/member/login.jsp?errMsg=fail");
        }

    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        con.close(rs, pstmt, conn);
    }

%>