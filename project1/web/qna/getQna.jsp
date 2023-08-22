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
    <title>플러스앤플러스에듀::나의 문의내역-상세보기</title>
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
                <h3>나의 문의내역 상세보기</h3>
                <div class="board_detail">
                    <div class="board_detail_top">
                        <div class="detail_top1">
                            <h5 class="board_title">[문의내역 제목]&emsp;<%=qna.getTitle() %></h5>
                        </div>
                        <div>
                            <p class="writer"><%=qna.getName() %></p>
                            <p class="date"><%=qna.getResdate() %></p>
                        </div>
                    </div>
                    <div class="board_detail_con">
                        <%=qna.getContent() %>
                    </div>
                </div>
                <% if(qna.isAnsweryn()) { %>
                <div class="qna_answer">
                    <p class="qna_info">[답변일자] <span><%=qna.getAnswerdate() %></span></p>
                    <p class="qna_info">[답변내용] <span><%=qna.getAnswer() %></span></p>
                </div>
                <% } else { %>
                <div class="qna_answer no_answer">
                    <h5>답변이 없습니다.</h5>
                </div>
                <% } %>
                <div class="btn_group txt_right">
                    <a href="<%=path %>/qna/listQna.jsp" class="inBtn inBtn1">목록</a>
                    <a href="<%=path %>/qna/removeQnaPro.jsp?qno=<%=qno %>" class="inBtn inBtn2">삭제</a>
                    <% if(!qna.isAnsweryn()) { %>
                    <a href="<%=path %>/qna/modifyQna.jsp?qno=<%=qno %>" class="inBtn inBtn1">수정</a>
                    <% }%>
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