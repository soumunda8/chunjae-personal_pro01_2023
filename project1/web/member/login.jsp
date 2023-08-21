<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
    String errMsg = request.getParameter("errMsg")!=null ? "로그인에 실패했습니다." : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::로그인</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
  </head>
  <body class="join">
  <div class="join_wrap">
      <header class="join_header">
          <a href="<%=path %>/" class="logo"><img src="<%=path %>/image/common/logo.png" alt="플러스앤플러스에듀 로고"><p><span class="mainCol">Plus</span> & <span class="subCol">Plus</span> Edu</p></a>
      </header>
      <section class="join_content">
          <h2>로그인</h2>
          <article class="login_area">
              <form action="<%=path %>/member/loginPro.jsp" method="post">
                  <fieldset>
                      <legend class="blind">로그인</legend>
                      <ul class="input_area">
                          <li><label for="id" class="blind">아이디</label><input type="text" id="id" name="id" class="inData" placeholder="아이디" title="아이디"></li>
                          <li><label for="pw" class="blind">비밀번호</label><input type="password" id="pw" name="pw" class="inData" placeholder="비밀번호" title="비밀번호"></li>
                          <% if(!errMsg.equals("")) { %>
                          <li class="info show" id="errMsg"><i class="fas fa-exclamation-circle"></i> <%=errMsg %></li>
                          <% }%>
                      </ul>
                      <div class="btn_group">
                          <input type="submit" class="inBtn inBtn1" value="로그인">
                          <a href="<%=path %>/member/term.jsp" class="inBtn inBtn2" >회원가입</a>
                      </div>
                  </fieldset>
              </form>
          </article>
      </section>
      <footer class="join_footer">
          <p>COPYRIGHT ©2023 Plus&PlusEdu. ALL RIGHTS RESERVED.</p>
      </footer>
  </div>
  </body>
</html>
