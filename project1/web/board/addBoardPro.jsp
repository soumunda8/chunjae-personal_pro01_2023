<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../layout/encoding.jsp" %>
<%
    int boardType = Integer.parseInt(request.getParameter("boardType"));
    String loginId = (String) session.getAttribute("sid");
    String title = request.getParameter("title");
    String content =  request.getParameter("content");

    int cnt = 0;
    String scriptStr = "";
    Connection conn = null;
    PreparedStatement pstmt = null;

    if(loginId != null && ((boardType == 2) || (boardType == 1 && loginId.equals("admin")))) {

        DBC con = new MariaDBCon();
        conn = con.connect();

        try {
            String sql = "insert into board(boardType, title, content, author) values(?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardType);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.setString(4, loginId);
            cnt = pstmt.executeUpdate();

            scriptStr = "<script>";
            scriptStr += "history.go(-1);";
            scriptStr += "</script>";
            if (cnt > 0) {
                if(boardType == 1) {
                    response.sendRedirect(request.getContextPath() +"/board/listNotice.jsp");
                } else if (boardType == 2) {
                    response.sendRedirect(request.getContextPath() +"/board/listBoard.jsp");
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

        if(boardType == 1) {
            scriptStr += "location.href='" + request.getContextPath() + "/board/listNotice.jsp';";
        } else if (boardType == 2) {
            scriptStr += "location.href='" + request.getContextPath() + "/board/listBoard.jsp';";
        } else {
            scriptStr += "location.href='" + request.getContextPath() + "/';";
        }

        scriptStr += "</script>";
        out.println(scriptStr);
    }

%>