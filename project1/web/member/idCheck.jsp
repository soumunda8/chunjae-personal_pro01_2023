<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
    String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>아이디 중복 검사</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
</head>
<style>

</style>
<body>
<div class="container">
    <form name="child" id="idCheckForm" action="<%=path %>/member/idLoad.jsp" method="post">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=id %>" placeholder="12글자 이내">
        <input type="button" value="아이디 중복 검사"  onclick="invalidCheck()">

    </form>
    <script>
        function invalidCheck(){
            var id = document.getElementById("id").value;
            if(id.length > 12){
                alert("아이디의 글자수는 16글자 이내입니다.");
                return false;
            }
            document.getElementById("idCheckForm").submit();
        }
    </script>
</div>
</body>
</html>