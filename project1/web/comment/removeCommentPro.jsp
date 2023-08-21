<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%@include file="../layout/encoding.jsp"%>

<%

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    int cno = Integer.parseInt(request.getParameter("cno"));
    int bno = Integer.parseInt(request.getParameter("bno"));

    try {
        String sql = "delete from comment where cno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, cno);
        int cnt = pstmt.executeUpdate();

        if(cnt > 0 ){
            System.out.println("삭제완료");
        } else {
            System.out.println("삭제실패");
        }
        response.sendRedirect(request.getContextPath() + "/board/getBoard.jsp?bno="+bno);
    } catch (SQLException e) {
        System.out.println("SQL 구문 오류");
    } finally {
        con.close(pstmt, conn);
    }

%>