<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path =  request.getContextPath();
    int bno = Integer.parseInt(request.getParameter("bno"));

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
            <table class="table tb2">
                <tbody>
                <tr>
                    <th>제목</th>
                    <td><%=bd.getTitle() %></td>
                </tr>
                <tr>
                    <th class="txt_top">내용</th>
                    <td><%=bd.getContent() %></td>
                </tr>
                </tbody>
            </table>
            <div class="btn_group txt_right">
                <a href="<%=adminPath %>/noticeModify.jsp?bno=<%=bno %>" class="inBtn inBtn1">수정</a>
                <a href="<%=path %>/board/removeBoardPro.jsp?bno=<%=bno %>&author=admin&type=1" class="inBtn inBtn2">삭제</a>
                <a href="<%=adminPath %>/noticeList.jsp" class="inBtn inBtn1">목록</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
