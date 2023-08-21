<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../layout/encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));
    String loginId = (String) session.getAttribute("sid");

    int cnt = 0;
    String scriptStr = "";
    Connection conn = null;
    PreparedStatement pstmt = null;

    if(loginId != null) {
        DBC con = new MariaDBCon();
        conn = con.connect();

        try {
            String sql = "delete from qna where qno = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qno);
            cnt = pstmt.executeUpdate();

            if(cnt > 0){
                out.println("<script>location.href='" + request.getContextPath() + "/qna/listQna.jsp';</script>");
            } else {
                scriptStr = "<script>";
                scriptStr += "alert('삭제를 진행하지 못했습니다.')";
                scriptStr += "history.go(-1);";
                scriptStr += "</script>";
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
        scriptStr += "location.href='" + request.getContextPath() + "/';";
        scriptStr += "</script>";
        out.println(scriptStr);
    }

%>