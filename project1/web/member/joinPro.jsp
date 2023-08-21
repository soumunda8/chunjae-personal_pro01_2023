<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.util.*" %>
<%@ include file="/layout/encoding.jsp"%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");

    pw = AES256.encryptAES256(pw, "%02x");

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {
        String sql = "INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES(?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.setString(4, email);
        pstmt.setString(5, tel);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            response.sendRedirect(request.getContextPath() + "/member/joinFinish.jsp");
        } else {
            String scriptStr = "";
            scriptStr = "<script>";
            scriptStr += "alert('회원가입이 잘못되었습니다.');";
            scriptStr += "history.go(-1);";
            scriptStr += "</script>";
            out.println(scriptStr);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        con.close(pstmt, conn);
    }

%>