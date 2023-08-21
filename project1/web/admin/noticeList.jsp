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

    List<Board> boardList = new ArrayList<>();
    try {
        String sql = "select * from boardList where boardType = 1 order by resdate desc";
        pstmt = conn.prepareStatement(sql);
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

    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::관리자페이지-공지관리</title>
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
        <h2>공지사항 관리</h2>
        <div class="container">
            <table class="table tb1">
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
                    <td class="title txtLeft"><a href="<%=adminPath %>/noticeGet.jsp?bno=<%=bd.getBno() %>"><%=title %></a></td>
                    <td class="date dt-center"><%=dateStr %></td>
                    <td class="num dt-center"><%=bd.getCnt() %></td>
                </tr>
                <%  num++; } } else { %>
                <tr><td class="dt-center" colspan="4">등록된 공지사항이 없습니다.</td></tr>
                <% } %>
                </tbody>
            </table>
            <div class="btn_group txt_right">
                <a href="<%=adminPath %>/noticeAdd.jsp" class="inBtn inBtn1">등록</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
