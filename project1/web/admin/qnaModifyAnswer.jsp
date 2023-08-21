<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path =  request.getContextPath();
    int qno = Integer.parseInt(request.getParameter("qno"));

    String sql = "";
    Qna qna = new Qna();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {

        sql = "select * from qnaList where qno = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, qno);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setAnswer(rs.getString("answer"));
            qna.setAuthor(rs.getString("author"));
            qna.setResdate(rs.getString("resdate"));
            qna.setAnswerdate(rs.getString("answerdate"));
            qna.setAnsweryn(rs.getBoolean("answeryn"));
            qna.setName(rs.getString("name"));
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

    String state = "";
    if(qna.isAnsweryn()) {
        state = "수정";
    } else {
        state = "등록";
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::관리자페이지-문의관리</title>
    <%@ include file="../layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/admin.css">
</head>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="../layout/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2>문의 관리 답변<%=state %></h2>
        <div class="container">
            <table class="table tb2">
                <tbody>
                <tr>
                    <th>문의 제목</th>
                    <td><%=qna.getTitle() %></td>
                </tr>
                <tr>
                    <th>문의 내용</th>
                    <td><%=qna.getContent() %></td>
                </tr>
                </tbody>
            </table>

            <form action="<%=adminPath %>/qnaModifyAnswerPro.jsp" method="post">
                <input type="hidden" value="<%=qno %>" name="qno" id="qno">
                <input type="hidden" value="<%=qna.isAnsweryn() %>" name="answeryn" id="answeryn">
                <table class="table tb2 answer">
                    <tbody>
                    <tr>
                        <th class="txt_top">답변 내용</th>
                        <td>
                            <textarea name="answer" id="answer" cols="80" rows="10" maxlength="990" class="inData">
                                <% if(qna.isAnsweryn()) { %>
                                <%=qna.getAnswer() %>
                                <% } %>
                            </textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_group txt_right">
                    <input type="submit" value="답변<%=state %>" class="inBtn inBtn1">
                    <a href="<%=adminPath %>/qnaList.jsp" class="inBtn inBtn2">목록</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
