<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path =  request.getContextPath();
    int bno = Integer.parseInt(request.getParameter("bno"));
    String writer = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

    int cnt = 0;
    String sql = "";
    Board bd = new Board();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {

        // 공지사항 글 가져오는 쿼리문
        sql = "select * from boardList where bno = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            bd.setTitle(rs.getString("title"));
            bd.setContent(rs.getString("content"));
            bd.setAuthor(rs.getString("author"));
            bd.setName(rs.getString("name"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
        }

        rs.close();
        pstmt.close();

        if(!bd.getAuthor().equals("admin") && !bd.getAuthor().equals(writer)) {
            // 조회수 증가 쿼리
            sql = "update board set cnt = cnt + 1 where bno = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
            cnt = pstmt.executeUpdate();
            if (cnt > 0) {
                System.out.println("조회수 증가 성공");
            } else {
                System.out.println("조회수 증가 실패");
            }
            pstmt.close();
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        conn.close();
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::공지사항-상세보기</title>
    <%@ include file="../layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="header" id="header">
        <%@ include file="../layout/header.jsp" %>
    </header>
    <div class="contents">
        <div class="sub_visual visual03">
            <div class="inner">
                <h2>커뮤니티</h2>
            </div>
        </div>
        <div class="inner">
            <div class="breadcrumb">
                <p><a href="<%=path %>/"> HOME </a> &gt; <a href="<%=path %>/board/listNotice.jsp"> 커뮤니티 </a> &gt; <span> 공지사항 </span></p>
            </div>
            <div class="content_wrap">
                <h3>공지사항 상세보기</h3>
                <div class="board_detail">
                    <div class="board_detail_top">
                        <div class="detail_top1">
                            <h5 class="board_title">[공지 제목]&emsp;<%=bd.getTitle() %></h5>
                            <p class="cnt">[조회수] <%=bd.getCnt() %></p>
                        </div>
                        <div>
                            <p class="writer"><%=bd.getName() %></p>
                            <p class="date"><%=bd.getResdate() %></p>
                        </div>
                    </div>
                    <div class="board_detail_con">
                        <%=bd.getContent() %>
                    </div>
                </div>
                <div class="btn_group txt_right">
                    <a href="<%=path %>/board/listNotice.jsp" class="inBtn inBtn1">목록</a>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer" id="footer">
        <%@ include file="../layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>