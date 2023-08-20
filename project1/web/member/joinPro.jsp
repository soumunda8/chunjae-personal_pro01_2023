<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.dto.*" %>
<%@ page import="com.plusnplus.util.*" %>
<%@ include file="/layout/encoding.jsp"%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");


    pw = AES256.sha256(pw);

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Member mem = new Member();

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {
        String sql = "select * from member where id = ? and pw = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            session.setAttribute("sid", rs.getString("id"));
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            response.sendRedirect(request.getContextPath() + "/member/login.jsp?errMsg=fail");
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        con.close(rs, pstmt, conn);
    }

%>