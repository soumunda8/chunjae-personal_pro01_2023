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
        <h2>공지사항 상세보기</h2>
        <div class="container">
            <form action="<%=path %>/board/modifyBoardPro.jsp" method="post">
                <input type="hidden" value="<%=bno %>" name="bno" id="bno">
                <input type="hidden" value="1" name="type" id="type">
                <input type="hidden" value="admin" name="author" id="author">
                <table class="table tb2">
                    <tbody>
                    <tr>
                        <th><label for="title">공지 제목</label></th>
                        <td><input type="text" class="inData" name="title" id="title" value="<%=bd.getTitle() %>"></td>
                    </tr>
                    <tr>
                        <th class="txt_top"><label for="content">공지 내용</label></th>
                        <td>
                                <textarea name="content" id="content" cols="80" rows="10" maxlength="990" class="inData">
                                    <%= bd.getContent()%>
                                </textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_group">
                    <button type="submit" class="inBtn inBtn1">수정하기</button>
                    <a href="<%=adminPath %>/noticeGet.jsp?bno=<%=bno %>" class="inBtn inBtn2">취소하기</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>