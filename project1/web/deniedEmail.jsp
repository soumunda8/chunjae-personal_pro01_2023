<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path =  request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::이메일무단수집거부</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
  </head>
  <body>
  <div class="wrap">
      <header class="header" id="header">
          <%@ include file="/layout/header.jsp" %>
      </header>
      <div class="contents">
          <div class="sub_visual visual05">
              <div class="inner">
                  <h2>고객센터</h2>
              </div>
          </div>
          <div class="inner">
              <div class="breadcrumb">
                  <p><a href="<%=path %>/">HOME</a> &gt; <a href="<%=path %>/privacy.jsp">고객센터</a> &gt; <span>이메일무단수집거부</span></p>
              </div>
              <div class="content_wrap">
                  <h3>이메일무단수집거부</h3>
                  <div class="cs_area">
                      <div>
                          <h4>Plus&PlusEdu의 이메일무단수집 거부방침을 알려드립니다.</h4>
                          <p>본 홈페이지에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 홈페이지 운영자 또는 관리자의 사전 동의 없이 이메일 주소 무단 수집행위는 불법행위입니다.</p><br>
                          <p>이를 위반시「정보통신망 이용촉진 및 정보보호 등에 관한 법률」제50조의 2에 의거하여 형사 처벌됩니다.정보통신망 이용촉진 및 정보보호 등에 관한 법률 제50조의2 (전자우편주소의 무단 수집행위 등 금지)</p>
                          <p>본 홈페이지에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 홈페이지 운영자 또는 관리자의 사전 동의 없이 이메일 주소 무단 수집행위는 불법행위입니다.</p><br>
                          <p>이를 위반시「정보통신망 이용촉진 및 정보보호 등에 관한 법률」제50조의 2에 의거하여 형사 처벌됩니다.정보통신망 이용촉진 및 정보보호 등에 관한 법률 제50조의2 (전자우편주소의 무단 수집행위 등 금지)</p>
                          <p class="pdl10">① 누구든지 인터넷 홈페이지 운영자 또는 관리자의 사전 동의 없이 인터넷 홈페이지에서 자동으로 전자우편주소를 수집하는 프로그램이나 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니된다.</p>
                          <p class="pdl10">② 누구든지 제1항을 위반하여 수집된 전자우편주소를 판매·유통하여서는 아니 된다.</p>
                          <p class="pdl10">③ 누구든지 제1항과 제2항에 따라 수집·판매 및 유통이 금지된 전자우편주소임을 알면서 이를 정보 전송에 이용하여서는 아니된다.</p>
                      </div>
                      <div>
                          <h4>이메일주소 무단수집으로 인한 피해 신고</h4>
                          <ul class="ul_type01">
                              <li>전화 : XXX-XXX-XXXX</li>
                              <li>주소 : 서울시 금천구 가산로9길 54</li>
                              <li>개인정보보호책임관 : XXX</li>
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
