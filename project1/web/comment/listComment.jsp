<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@include file="../layout/encoding.jsp"%>
<%
    List<Comment> commentList = new ArrayList<>();

    try {
        sql = "SELECT * FROM commentList WHERE bno = ? ORDER BY cno ASC;";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        rs = pstmt.executeQuery();

        while(rs.next()){
            Comment c = new Comment();
            c.setCno(rs.getInt("cno"));
            c.setBno(rs.getInt("bno"));
            c.setName(rs.getString("name"));
            c.setAuthor(rs.getString("author"));
            c.setContent(rs.getString("content"));
            c.setResdate(rs.getString("resdate"));
            commentList.add(c);
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

%>
<div class="comment_area">
    <% if(commentList.size() > 0) { %>
    <ul class="comment_list">
    <%
        int num = 1;
        for(Comment c : commentList) {
    %>
        <li>
            <div class="comment_top">
                <p class="comment_writer"><%=num %>. <%=c.getName() %><span class="comment_date"><%=c.getResdate() %></span></p>
                <% if(sid != null && (sid.equals("admin") || sid.equals(c.getAuthor()))) {%>
                <a href="<%=path %>/comment/removeCommentPro.jsp?cno=<%=c.getCno() %>&bno=<%=c.getBno() %>" class="comment_btn">삭제하기</a>
                <% } %>
            </div>
            <div class="comment_con">
                <%=c.getContent()%>
            </div>
        </li>
    <%
        num++;
        }
    %>
    </ul>
    <% } else { %>
    <div class="no_comment">
        등록된 댓글이 없습니다.
    </div>
    <% } %>
    <% if(sid != null) { %>
    <div class="comment_add">
        <form action="<%=path %>/comment/addCommentPro.jsp" method="post">
            <input type="hidden" name="author" id="author" class="inData" value="<%=sid %>" readonly>
            <input type="hidden" name="bno" id="bno" class="inData" value="<%=bno %>" readonly>
            <textarea rows="1" cols="50" name="content" id="content" class="tet" maxlength="50" required placeholder="댓글내용" autofocus></textarea>
            <input type="submit" class="comment_btn inBtn inBtn1" value="댓글 등록">
        </form>
    </div>
    <% } %>
</div>