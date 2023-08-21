<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::문의하기</title>
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
                <p><a href="<%=path %>/"> HOME </a> &gt; <a href="<%=path %>/board/listNotice.jsp"> 커뮤니티 </a> &gt; <span> 문의하기 </span></p>
            </div>
            <div class="content_wrap">
                <h3>문의하기</h3>
                <form action="<%=path %>/qna/addQnaPro.jsp" method="post">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th><label for="title">문의 제목</label></th>
                            <td><input type="text" class="inData" name="title" id="title" required></td>
                        </tr>
                        <tr>
                            <th class="txt_top"><label for="content">문의 내용</label></th>
                            <td>
                                <textarea name="content" id="content" cols="80" rows="10" maxlength="990" class="inData"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn_group txt_right">
                        <button type="submit" class="inBtn inBtn1">등록하기</button>
                        <a href="<%=path %>/qna/listQna.jsp" class="inBtn inBtn2">나의 문의 내역</a>
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