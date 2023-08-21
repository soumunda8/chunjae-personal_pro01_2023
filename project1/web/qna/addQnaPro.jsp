<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../layout/encoding.jsp" %>
<%
    String loginId = (String) session.getAttribute("sid");
    String title = request.getParameter("title");
    String content =  request.getParameter("content");

    int cnt = 0;
    String scriptStr = "";
    Connection conn = null;
    PreparedStatement pstmt = null;

    if(loginId != null) {

        DBC con = new MariaDBCon();
        conn = con.connect();

        try {
            String sql = "insert into qna(title, content, author) values(?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, loginId);
            cnt = pstmt.executeUpdate();

            scriptStr = "<script>";
            scriptStr += "history.go(-1);";
            scriptStr += "</script>";

            if (cnt > 0) {
                response.sendRedirect(request.getContextPath() +"/qna/listQna.jsp");
            } else {
                out.println(scriptStr);
            }

        } catch (SQLException e) {
            System.out.println("SQL 구문 오류");
        } finally {
            con.close(pstmt, conn);
        }
    } else {
        scriptStr = "<script>";
        scriptStr += "alert('잘못된 접근입니다.');";
        scriptStr += "history.go(-1);";
        scriptStr += "</script>";
        out.println(scriptStr);
    }

%>