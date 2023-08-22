<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::인사말</title>
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
                  <p><a href="<%=path %>/">HOME</a> &gt; <a href="<%=path %>/company01.jsp">소개</a> &gt; <span>인사말</span></p>
              </div>
              <div class="content_wrap">
                  <h3>소개</h3>
                  <div class="intro">
                      <p class="logo"><span class="mainCol">Plus</span> &amp; <span class="subCol">Plus</span> Edu</p>
                      <div class="intro_con">
                          <p>교육브랜드 <span class="mainCol">Plus</span> &amp; <span class="subCol">Plus</span> Edu는 학생의 성장과 즐거움을 더합니다.</p>
                          <ul>
                              <li>더함 <span class="mainCol">Plus</span> : "<span class="mainCol">Plus</span>"는 성장과 발전을 의미합니다.<span class="mainCol">Plus</span> &amp; <span class="subCol">Plus</span> Edu는 학생들이 더 나은 사람으로 성장하도록 돕고, 동시에 지속적인 발전과 성장을 추구합니다.</li>
                              <li>더함 <span class="subCol">Plus</span>: 교육 과정에서 즐거움과 기쁨을 경험하는 것 또한 중요합니다. <span class="mainCol">Plus</span> &amp; <span class="subCol">Plus</span> Edu는 학생들이 학습을 통해 새로운 경험과 지식을 얻는 동시에 즐거움을 느끼는 것을 강조합니다.</li>
                          </ul>
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
