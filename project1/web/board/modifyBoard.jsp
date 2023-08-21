<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.sql.*" %>
<%
    String path =  request.getContextPath();
    int bno = Integer.parseInt(request.getParameter("bno"));

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
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::자유게시판-수정하기</title>
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
                <p><a href="<%=path %>/"> HOME </a> &gt; <a href="javascript:return false"> 자격증 </a> &gt; <span> 자유게시판 </span></p>
            </div>
            <div class="content_wrap">
                <h3>자유게시판 수정하기</h3>
                <form action="<%=path %>/board/modifyBoardPro.jsp" method="post">
                    <input type="hidden" value="<%=bno %>" name="bno" id="bno">
                    <input type="hidden" value="2" name="type" id="type">
                    <input type="hidden" value="<%=bd.getAuthor() %>" name="author" id="author">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th><label for="title">자유게시판 제목</label></th>
                            <td><input type="text" class="inData" name="title" id="title" value="<%=bd.getTitle() %>"></td>
                        </tr>
                        <tr>
                            <th><label for="content">자유게시판 내용</label></th>
                            <td>
                                <textarea name="content" id="content" cols="80" rows="10" maxlength="990" class="inData">
                                    <%= bd.getContent()%>
                                </textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn_group txt_right">
                        <button type="submit" class="inBtn inBtn1">수정하기</button>
                        <a href="<%=path %>/board/getBoard.jsp?bno=<%=bno %>" class="inBtn inBtn2">취소하기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="footer" id="footer">
        <%@ include file="../layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>