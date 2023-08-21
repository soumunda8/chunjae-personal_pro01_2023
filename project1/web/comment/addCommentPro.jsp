<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ include file="../layout/encoding.jsp" %>

<%
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    int bno = Integer.parseInt(request.getParameter("bno"));

    System.out.println(author + ", " + content + ", " + bno);

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try{
        String sql = "insert into comment(author, content, bno) values(?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, author);
        pstmt.setString(2, content);
        pstmt.setInt(3, bno);
        int cnt = pstmt.executeUpdate();

        if(cnt > 0){
            response.sendRedirect(request.getContextPath() + "/board/getBoard.jsp?bno="+bno);
        } else {
            out.println("<script>alert('댓글 등록에 문제가 생겼습니다.');history.go(-1);</script>");
        }

    } catch (SQLException e) {
        System.out.println("SQL구문 오류");
    } finally {
        con.close(pstmt, conn);
    }

%>