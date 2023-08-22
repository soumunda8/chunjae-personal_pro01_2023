<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::자주하는질문</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
  </head>
  <body>
  <div class="wrap">
      <header class="header" id="header">
          <%@ include file="/layout/header.jsp" %>
      </header>
      <div class="contents">
          <div class="sub_visual visual04">
              <div class="inner">
                  <h2>커뮤니티</h2>
              </div>
          </div>
          <div class="inner">
              <div class="breadcrumb">
                  <p><a href="<%=path %>/">HOME</a> &gt; <a href="<%=path %>/board/listNotice.jsp"> 커뮤니티</a> &gt; <span>자주하는질문</span></p>
              </div>
              <div class="content_wrap">
                  <h3>자주하는질문</h3>
                  <div>
                      <ul class="qna_list">
                          <li>
                              <div class="que">1. 자격증은 무슨 정보를 가지고 있나요?</div>
                              <div class="ans">[답변] 자격 일시, 자격 정보 등 가지고 있습니다. 그리고 해당 자격증 신청 페이지로 이동합니다.</div>
                          </li>
                          <li>
                              <div class="que">2. 혹시 자격증이 더 증가되나요?</div>
                              <div class="ans">[답변] 넵, 문의하기를 통해 많이 취합되는 자격증은 추가가 될 예정입니다.</div>
                          </li>
                      </ul>
                      <script>
                          $(document).ready(function(){
                              $(".qna_list li").click(function(){
                                  $(this).find(".ans").slideToggle(500);
                                  $(this).find(".que").toggleClass("on");
                              });
                          });
                      </script>
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
