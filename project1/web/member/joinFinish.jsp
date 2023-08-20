<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::회원가입</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
  </head>
  <body class="join">
  <div class="join_wrap">
      <header class="join_header">
          <a href="<%=path %>/" class="logo"><img src="<%=path %>/image/common/logo.png" alt="플러스앤플러스에듀 로고"><p><span class="mainCol">Plus</span> & <span class="subCol">Plus</span> Edu</p></a>
      </header>
      <section class="join_content">
          <h2>회원가입</h2>
          <ul class="join_step">
              <li><i>1</i>약관동의</li>
              <li><i>2</i>기본정보입력</li>
              <li class="on"><i>3</i>회원가입완료</li>
          </ul>
          <p class="finish01">회원가입을 축하합니다.</p>
          <p class="finish02">더 많은 서비스를 즐기세요.</p>
          <div class="btn_group">
              <a href="<%=path %>/member/login.jsp" class="inBtn inBtn1" >로그인하기</a>
          </div>
      </section>
      <footer class="join_footer">
          <p>COPYRIGHT ©2023 Plus&PlusEdu. ALL RIGHTS RESERVED.</p>
      </footer>
  </div>
  </body>
</html>
