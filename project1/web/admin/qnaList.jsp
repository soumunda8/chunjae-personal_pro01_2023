<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String path = request.getContextPath();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    List<Qna> qnaList = new ArrayList<>();
    try {
        String sql = "select * from qnaList order by resdate desc";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Qna qna = new Qna();
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setAnswer(rs.getString("answer"));
            qna.setAuthor(rs.getString("author"));
            qna.setResdate(rs.getString("resdate"));
            qna.setAnswerdate(rs.getString("answerdate"));
            qna.setAnsweryn(rs.getBoolean("answeryn"));
            qna.setName(rs.getString("name"));
            qnaList.add(qna);
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::관리자페이지-문의관리</title>
    <%@ include file="../layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/admin.css">
    <style>
        .num {width:5%;}
    </style>
</head>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="../layout/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2>문의 관리</h2>
        <div class="container">
            <table class="table tb1">
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:auto;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                </colgroup>
                <thead>
                <tr>
                    <th class="num dt-head-center">번호</th>
                    <th class="title">제목</th>
                    <th class="writer dt-head-center">작성자</th>
                    <th class="date dt-head-center">작성일</th>
                    <th class="dt-head-center">답변여부</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if(qnaList.size() > 0){
                        int num = 1;
                        for(Qna qna : qnaList) {
                            Date date = ymd.parse(qna.getResdate());  //날짜데이터로 변경
                            String dateStr = ymd.format(date);

                            String title = "";
                            if(qna.getTitle().length() > 86) {
                                title = qna.getTitle().substring(85) + "...";
                            } else {
                                title = qna.getTitle();
                            }

                %>
                <tr>
                    <td class="num dt-center"><%=num %></td>
                    <td class="title txtLeft"><%=title %></td>
                    <td class="writer dt-center"><%=qna.getName() %></td>
                    <td class="date dt-center"><%=dateStr %></td>
                    <td class="dt-center">
                        <% if(qna.isAnsweryn()) { %>
                        <a class="table_btn finish" href="javascript:return false">답변완료</a>
                        <% } else { %>
                        <a class="table_btn" href="<%=adminPath %>/qnaModifyAnswer.jsp?qno=<%=qna.getQno() %>">답변하기</a>
                        <% } %>
                    </td>
                </tr>
                <%  num++; } } else { %>
                <tr><td class="dt-center" colspan="4">등록된 공지사항이 없습니다.</td></tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>