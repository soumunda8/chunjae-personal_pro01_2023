<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::정보처리산업기사</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
  </head>
  <body>
  <div class="wrap">
      <header class="header" id="header">
          <%@ include file="/layout/header.jsp" %>
      </header>
      <div class="contents">
          <div class="sub_visual visual03">
              <div class="inner">
                  <h2>자격증</h2>
              </div>
          </div>
          <div class="inner">
              <div class="breadcrumb">
                  <p><a href="<%=path %>/">HOME</a> &gt; <a href="<%=path %>/license01.jsp">자격증</a> &gt; <span>정보처리산업기사</span></p>
              </div>
              <div class="content_wrap">
                  <h3>정보처리산업기사</h3>
                  <div>
                      <h4>시험일정</h4>
                      <table class="table tb1">
                          <colgroup>
                              <col style="width:14%;">
                              <col style="width:14%;">
                              <col style="width:15%;">
                              <col style="width:13%;">
                              <col style="width:auto;">
                              <col style="width:13%;">
                              <col style="width:12%;">
                          </colgroup>
                          <caption class="blind">정보처리기사 시험일정</caption>
                          <thead>
                          <tr>
                              <th scope="col">구분</th>
                              <th scope="col">필기원서접수(인터넷)(휴일제외)</th>
                              <th scope="col">필기시험</th>
                              <th scope="col">필기합격<br>(예정자)발표</th>
                              <th scope="col">실기원서접수<br>(휴일제외)</th>
                              <th scope="col">실기시험</th>
                              <th scope="col">최종합격자 발표일</th>
                          </tr>
                          </thead>
                          <tbody>
                          <tr>
                              <td>2023년 정기 기사 1회</td>
                              <td>2023.01.10 ~ 2023.01.19<br>[빈자리접수 : 2023.02.07~2023.02.08]</td>
                              <td>2023.02.13<br>~<br>2023.03.15</td>
                              <td>2023.03.21</td>
                              <td>2023.03.28<br>~<br>2023.03.31<br>빈자리접수 :<br>2023.04.16~<br>2023.04.17</td>
                              <td>2023.04.22~2023.06.25</td>
                              <td>2023.06.27</td>
                          </tr>
                          <tr>
                              <td>2023년 정기 기사 2회</td>
                              <td>2023.04.17 ~ 2023.04.20<br>[빈자리접수 : 2023.05.07~2023.05.08]</td>
                              <td>2023.05.13<br>~<br>2023.06.04</td>
                              <td>2023.06.14</td>
                              <td>2023.06.27<br>~<br>2023.06.30<br>빈자리접수 :<br>2023.07.16~<br>2023.07.17</td>
                              <td>2023.07.22~2023.08.06</td>
                              <td>2023.09.01</td>
                          </tr>
                          <tr>
                              <td>2023년 정기 기사 3회</td>
                              <td>2023.06.19 ~ 2023.06.22<br>[빈자리접수 : 2023.07.02~2023.07.03]</td>
                              <td>2023.07.08<br>~<br>2023.07.23</td>
                              <td>2023.08.02</td>
                              <td>2023.09.04<br>~<br>2023.09.07<br>빈자리접수 :<br>2023.10.01~<br>2023.10.02</td>
                              <td>2023.10.07~2023.10.20</td>
                              <td>2023.11.15</td>
                          </tr>
                          </tbody>
                      </table>
                      <div class="btn_group txt_center">
                          <a href="https://www.q-net.or.kr/crf005.do?id=crf00505&gSite=Q&gId=" class="inBtn inBtn1" title="큐넷:정보처리산업기사" target="_blank">시험정보 바로가기</a>
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
