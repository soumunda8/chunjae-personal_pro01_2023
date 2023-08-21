<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../layout/encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));
    boolean answeryn = Boolean.parseBoolean(request.getParameter("answeryn"));
    String answer = request.getParameter("answer");
    String loginId = (String) session.getAttribute("sid");

    int cnt = 0;
    String scriptStr = "";
    String sql = "";
    Connection conn = null;
    PreparedStatement pstmt = null;

    if(loginId != null & loginId.equals("admin")) {

        DBC con = new MariaDBCon();
        conn = con.connect();

        try {
            if(answeryn) {
                sql = "update qna set answer = ?, answerdate = CURRENT_TIMESTAMP() where qno = ?";
            } else {
                sql = "update qna set answer = ?, answeryn = true, answerdate = CURRENT_TIMESTAMP() where qno = ?";
            }
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, answer);
            pstmt.setInt(2, qno);
            cnt = pstmt.executeUpdate();

            if(cnt > 0){
                out.println("<script>location.href='" + request.getContextPath() + "/admin/qnaModifyAnswer.jsp?qno=" + qno + "';</script>");
            } else {
                scriptStr = "<script>";
                scriptStr += "alert('답변을 하지 못했습니다.')";
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