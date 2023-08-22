<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::자유게시판-등록하기</title>
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
                <h3>자유게시판 등록하기</h3>
                <form action="<%=path %>/board/addBoardPro.jsp" method="post">
                    <input type="hidden" value="2" name="boardType" id="boardType">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th><label for="title">자유게시판 제목</label></th>
                            <td><input type="text" class="inData" name="title" id="title" required></td>
                        </tr>
                        <tr>
                            <th class="txt_top"><label for="content">자유게시판 내용</label></th>
                            <td>
                                <textarea name="content" id="content" cols="80" rows="10" maxlength="990" class="inData"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn_group txt_right">
                        <button type="submit" class="inBtn inBtn1">등록하기</button>
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