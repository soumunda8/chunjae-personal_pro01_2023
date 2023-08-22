<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String path =  request.getContextPath();
    String loginId = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    List<Qna> qnaList = new ArrayList<>();

    String addId = "";

    if(!loginId.equals("")) {
        try {
            String sql = "SELECT * FROM qnaList where author = ? order by resdate desc";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, loginId);
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

        if(qnaList.size() > 0) {
            addId = "myTable";
        } else {
            addId = "";
        }
    } else {
        String scriptStr = "<script>";
        scriptStr += "alert('잘못된 접근입니다.');";
        scriptStr += "location.href='" + request.getContextPath() + "/';";
        scriptStr += "</script>";
        out.println(scriptStr);
    }

    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::나의 문의내역</title>
    <%@ include file="../layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="header" id="header">
        <%@ include file="../layout/header.jsp" %>
    </header>
    <div class="contents">
        <div class="sub_visual visual05">
            <div class="inner">
                <h2>마이페이지</h2>
            </div>
        </div>
        <div class="inner">
            <div class="breadcrumb">
                <p><a href="<%=path %>/"> HOME </a> &gt; <a href="<%=path %>/member/mypage.jsp"> 마이페이지 </a> &gt; <span> 나의 문의내역 </span></p>
            </div>
            <div class="content_wrap">
                <h3>나의 문의내역</h3>
                <div class="tab_area">
                    <ul>
                        <li><a href="<%=path %>/member/mypage.jsp">마이페이지</a></li>
                        <li class="on"><a href="javascript:return false">나의 문의내역</a></li>
                    </ul>
                </div>
                <table class="table tb1" id="<%=addId %>">
                    <colgroup>
                        <col style="width:8%;">
                        <col style="width:auto;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="num dt-head-center">번호</th>
                        <th class="title">문의 제목</th>
                        <th class="author dt-head-center">답변여부</th>
                        <th class="date dt-head-center">작성일</th>
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
                        <td class="title txtLeft"><a href="<%=path %>/qna/getQna.jsp?qno=<%=qna.getQno() %>"><%=title %></a></td>
                        <td class="date dt-center">
                            <% if(qna.isAnsweryn()) { %>
                            답변완료
                            <% } else { %>
                            답변미완료
                            <% } %>
                        </td>
                        <td class="date dt-center"><%=dateStr %></td>
                    </tr>
                    <%  num++; } } else { %>
                    <tr><td class="dt-center" colspan="4">등록된 문의내역이 없습니다.</td></tr>
                    <% } %>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order:[[0, "asc"]]
                        });
                    });
                </script>
            </div>
        </div>
    </div>
    <footer class="footer" id="footer">
        <%@ include file="../layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>
