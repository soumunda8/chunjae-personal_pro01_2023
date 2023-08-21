<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String path =  request.getContextPath();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    List<Board> boardList = new ArrayList<>();
    try {
        String sql = "select * from boardList where boardType = ? order by resdate desc";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, 1);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Board bd = new Board();
            bd.setBno(rs.getInt("bno"));
            bd.setTitle(rs.getString("title"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
            boardList.add(bd);
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

    String addId = "";
    if(boardList.size() > 0) {
        addId = "myTable";
    } else {
        addId = "";
    }

    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::공지사항</title>
    <%@ include file="../layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="header" id="header">
        <%@ include file="../layout/header.jsp" %>
    </header>
    <div class="contents">
        <div class="sub_visual visual04">
            <div class="inner">
                <h2>커뮤니티</h2>
            </div>
        </div>
        <div class="inner">
            <div class="breadcrumb">
                <p><a href="<%=path %>/"> HOME </a> &gt; <a href="<%=path %>/board/listNotice.jsp"> 커뮤니티 </a> &gt; <span> 공지사항 </span></p>
            </div>
            <div class="content_wrap">
                <h3>공지사항</h3>
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
                        <th class="title">제목</th>
                        <th class="date dt-head-center">작성일</th>
                        <th class="cnt dt-head-center">조회</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if(boardList.size() > 0){
                            int num = 1;
                            for(Board bd : boardList) {
                                Date date = ymd.parse(bd.getResdate());  //날짜데이터로 변경
                                String dateStr = ymd.format(date);

                                String title = "";
                                if(bd.getTitle().length() > 86) {
                                    title = bd.getTitle().substring(85) + "...";
                                } else {
                                    title = bd.getTitle();
                                }

                    %>
                    <tr>
                        <td class="num dt-center"><%=num %></td>
                        <td class="title txtLeft"><a href="<%=path %>/board/getNotice.jsp?bno=<%=bd.getBno() %>"><%=title %></a></td>
                        <td class="date dt-center"><%=dateStr %></td>
                        <td class="num dt-center"><%=bd.getCnt() %></td>
                    </tr>
                    <%  num++; } } else { %>
                    <tr><td class="dt-center" colspan="4">등록된 공지사항이 없습니다.</td></tr>
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