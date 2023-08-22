<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.sql.*" %>
<%
    String path =  request.getContextPath();

    int qno = Integer.parseInt(request.getParameter("qno"));

    Qna qna = new Qna();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {

        String sql = "select * from qnaList where qno = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, qno);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setAnswer(rs.getString("answer"));
            qna.setAuthor(rs.getString("author"));
            qna.setResdate(rs.getString("resdate"));
            qna.setAnswerdate(rs.getString("answerdate"));
            qna.setAnsweryn(rs.getBoolean("answeryn"));
            qna.setName(rs.getString("name"));
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
    <title>플러스앤플러스에듀::나의 문의내역-수정하기</title>
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
                <h3>나의 문의내역 수정하기</h3>
                <form action="<%=path %>/qna/modifyQnaPro.jsp" method="post">
                    <input type="hidden" id="qno" name="qno" value="<%=qno %>">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th><label for="title">문의 제목</label></th>
                            <td><input type="text" class="inData" name="title" id="title" value="<%=qna.getTitle() %>" required></td>
                        </tr>
                        <tr>
                            <th class="txt_top"><label for="content">문의 내용</label></th>
                            <td>
                                <textarea name="content" id="content" cols="80" rows="10" maxlength="990" class="inData">
                                    <%=qna.getContent() %>
                                </textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn_group txt_right">
                        <button type="submit" class="inBtn inBtn1">수정하기</button>
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