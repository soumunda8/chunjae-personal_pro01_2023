<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../layout/encoding.jsp" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    int type = Integer.parseInt(request.getParameter("type"));
    String loginId = (String) session.getAttribute("sid");
    String author = request.getParameter("author");

    int cnt = 0;
    String scriptStr = "";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    if(loginId != null && (loginId.equals("admin") || loginId.equals(author))) {
        DBC con = new MariaDBCon();
        conn = con.connect();

        try {
            String sql = "delete from board where bno = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
            cnt = pstmt.executeUpdate();

            scriptStr = "<script>";
            scriptStr += "history.go(-1);";
            scriptStr += "</script>";
            if(cnt > 0){

                if(type == 1) {
                    response.sendRedirect(request.getContextPath() + "/board/listNotice.jsp");
                } else if(type == 2) {
                    // 자유게시판일 경우
                    pstmt.close();

                    sql = "select count(*) as num from comment where bno = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, bno);
                    rs = pstmt.executeQuery();
                    if(rs.next()) {
                        rs.close();
                        pstmt.close();

                        sql = "delete from comment where bno = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, bno);
                        pstmt.executeUpdate();

                        response.sendRedirect(request.getContextPath() + "/board/listBoard.jsp");
                    } else {
                        rs.close();
                    }

                } else {
                    out.println("<script>location.href='" + request.getContextPath() + "/';</script>");
                }
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

        if(type == 1) {
            scriptStr += "location.href='" + request.getContextPath() + "/board/getNotice.jsp?bno=" + bno + "';";
        } else if (type == 2) {
            scriptStr += "location.href='" + request.getContextPath() + "/board/getBoard.jsp?bno=" + bno + "';";
        } else {
            scriptStr += "location.href='" + request.getContextPath() + "/';";
        }

        scriptStr += "</script>";
        out.println(scriptStr);
    }

%>