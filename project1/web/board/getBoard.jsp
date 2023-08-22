<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.sql.*" %>
<%
    String path =  request.getContextPath();

    int bno = Integer.parseInt(request.getParameter("bno"));
    String writer = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
    boolean commentYn = request.getParameter("comment") != null;

    int cnt = 0;
    String sql = "";
    Board bd = new Board();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {

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

        if(!writer.equals("admin") && !bd.getAuthor().equals(writer) && !commentYn) {

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
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::자유게시판-상세보기</title>
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
                <h2>자격증</h2>
            </div>
        </div>
        <div class="inner">
            <div class="breadcrumb">
                <p><a href="<%=path %>/"> HOME </a> &gt; <a href="<%=path %>/license01.jsp"> 자격증 </a> &gt; <span> 자유게시판 </span></p>
            </div>
            <div class="content_wrap">
                <h3>자유게시판 상세보기</h3>
                <div class="board_detail">
                    <div class="board_detail_top">
                        <div class="detail_top1">
                            <h5 class="board_title">[자유게시판 제목]&emsp;<%=bd.getTitle() %></h5>
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
                    <% if(sid != null && (sid.equals("admin") || sid.equals(bd.getAuthor()))) { %>
                    <a href="<%=path %>/board/modifyBoard.jsp?bno=<%=bno %>" class="inBtn inBtn1">수정</a>
                    <a href="<%=path %>/board/removeBoardPro.jsp?bno=<%=bno %>&author=<%=bd.getAuthor() %>&type=2" class="inBtn inBtn2">삭제</a>
                    <% } %>
                    <a href="<%=path %>/board/listBoard.jsp" class="inBtn inBtn1">목록</a>
                </div>
                <%@include file="../comment/listComment.jsp"%>
            </div>
        </div>
    </div>
    <footer class="footer" id="footer">
        <%@ include file="../layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>