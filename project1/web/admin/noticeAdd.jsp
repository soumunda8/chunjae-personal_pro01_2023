<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
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
        <h2>공지사항 등록하기</h2>
        <div class="container">
            <form action="<%=path %>/board/addBoardPro.jsp" method="post">
                <input type="hidden" value="1" name="boardType" id="boardType">
                <table class="table tb2">
                    <tbody>
                    <tr>
                        <th><label for="title">공지 제목</label></th>
                        <td><input type="text" class="inData" name="title" id="title" required></td>
                    </tr>
                    <tr>
                        <th class="txt_top"><label for="content">공지 내용</label></th>
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
</body>
</html>