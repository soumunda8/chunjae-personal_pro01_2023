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
    <form action="<%=path %>/member/idLoad.jsp" method="post" name="child" onsubmit="return invalidCheck(this)">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=id %>" placeholder="15글자 이내">
        <input type="submit" value="아이디중복검사">
    </form>
    <script>
        function invalidCheck(f) {
            var id = f.id.value;
            if(id.length > 15) {
                alert("아이디가 15글자를 초과했습니다.");
                f.id.focus();
            }
        }
    </script>
</div>
</body>
</html>