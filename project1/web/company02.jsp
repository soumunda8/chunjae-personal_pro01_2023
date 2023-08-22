<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::연혁</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
  </head>
  <body>
  <div class="wrap">
      <header class="header" id="header">
          <%@ include file="/layout/header.jsp" %>
      </header>
      <div class="contents">
          <div class="sub_visual visual01">
              <div class="inner">
                  <h2>소개</h2>
              </div>
          </div>
          <div class="inner">
              <div class="breadcrumb">
                  <p><a href="<%=path %>/">HOME</a> &gt; <a href="<%=path %>/company01.jsp">소개</a> &gt; <span>연혁</span></p>
              </div>
              <div class="content_wrap">
                  <h3>연혁</h3>
                  <h4 class="history"><span class="mainCol">Plus</span>&<span class="subCol">Plus</span>Edu가 디딘 첫걸음부터 지금까지의 발걸음을 담았습니다</h4>
                  <ul class="list_history">
                      <li>
                          <strong class="year_tit">2023년</strong>
                          <div class="month_con">
                              <div class="month_list">
                                  <em class="month_tit">08월</em>
                                  <ul class="date_list">
                                      <li>23. 홈페이지 오픈</li>
                                      <li>15. 교육서비스 개발</li>
                                  </ul>
                              </div>
                              <div class="month_list">
                                  <em class="month_tit">07월</em>
                                  <ul class="date_list">
                                      <li>31. Plus&PlusEdu 설립</li>
                                  </ul>
                              </div>
                          </div>
                      </li>
                      <li>
                          <strong class="year_tit">2022년</strong>
                          <div class="month_con">
                              <div class="month_list">
                                  <em class="month_tit">02월</em>
                                  <ul class="date_list">
                                      <li>23. XXXX</li>
                                  </ul>
                              </div>
                          </div>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <footer class="footer" id="footer">
          <%@ include file="/layout/footer.jsp" %>
      </footer>
  </div>
  </body>
</html>
