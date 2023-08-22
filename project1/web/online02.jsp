<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::KOCW</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
  </head>
  <body>
  <div class="wrap">
      <header class="header" id="header">
          <%@ include file="/layout/header.jsp" %>
      </header>
      <div class="contents">
          <div class="sub_visual visual02">
              <div class="inner">
                  <h2>온라인교육</h2>
              </div>
          </div>
          <div class="inner">
              <div class="breadcrumb">
                  <p><a href="<%=path %>/">HOME</a> &gt; <a href="<%=path %>/online01.jsp">온라인교육</a> &gt; <span>KOCW</span></p>
              </div>
              <div class="content_wrap">
                  <h3>KOCW</h3>
                  <div class="online">
                      <img src="<%=path %>/image/sub/online02.png" alt="KOCW" />
                      <div class="btn_group txt_center">
                          <a href="http://www.kocw.net/home/index.do" title="KOCW" target="_blank" class="inBtn inBtn1">사이트 이동</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <footer class="footer" id="footer">
          <%@ include file="/layout/footer.jsp" %>
      </footer>
  </div>
  </body>
</html>
