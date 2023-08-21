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
      <section class="join_content join_detail">
          <h2>회원가입</h2>
          <ul class="join_step">
              <li><i>1</i>약관동의</li>
              <li class="on"><i>2</i>기본정보입력</li>
              <li><i>3</i>회원가입완료</li>
          </ul>
          <form action="<%=path %>/member/joinPro.jsp" name="frm1" id="loginFrm" class="frm" onsubmit="return inform(this)">
              <fieldset>
                  <legend class="blind">기본정보입력</legend>
                  <div class="form_list_m">
                      <dl>
                          <dt>아이디 <i class="fas fa-asterisk"></i></dt>
                          <dd class="btn">
                              <input type="text" name="id" id="id" class="inData" placeholder="아이디를 입력해주세요." title="아이디" required>
                              <button type="button" id="ckBtn" class="inBtn inBtn1" onclick="idCheck()">아이디 중복체크</button>
                              <input type="hidden" name="ckItem" id="ckItem" value="no">
                          </dd>
                      </dl>
                      <dl>
                          <dt>비밀번호 <i class="fas fa-asterisk"></i></dt>
                          <dd>
                              <input type="password" name="pw" class="inData" id="pw" placeholder="비밀번호를 입력하세요." title="비밀번호" required>
                          </dd>
                          <dd>
                              <input type="password" name="rePw" class="inData" id="rePw" placeholder="비밀번호를 다시 입력하세요." title="비밀번호 재입력" required>
                          </dd>
                          <dd class="info" id="errMsg"><i class="fas fa-exclamation-circle"></i> 비밀번호가 다릅니다. 확인부탁드립니다.</dd>
                      </dl>
                      <dl>
                          <dt>이름 <i class="fas fa-asterisk"></i></dt>
                          <dd>
                              <input type="text" name="name" id=name" class="inData" placeholder="이름을 입력하세요." title="이름" required>
                          </dd>
                      </dl>
                      <dl>
                          <dt>전화번호</dt>
                          <dd>
                              <input type="text" name="tel" maxlength="13" id="tel" class="inData" placeholder="010-XXXX-XXXX로 입력해주세요." title="전화번호">
                          </dd>
                      </dl>
                      <dl>
                          <dt>이메일 <i class="fas fa-asterisk"></i></dt>
                          <dd>
                              <input type="text" name="email" id="email" class="inData" placeholder="이메일 주소를 입력하세요." title="이메일" required>
                          </dd>
                      </dl>
                  </div>
                  <div class="btn_group">
                      <button type="submit" class="inBtn inBtn1">회원가입</button>
                  </div>
              </fieldset>
          </form>
          <script>
          function inform(frm){

              var resultFlag = true;

              var ckItem = frm.ckItem.value;
              if(ckItem != "yes") {
                  alert("아이디 중복 검사를진행하시기 바랍니다.");
                  frm.id.focus();
                  resultFlag = false;
              }

              var pw = frm.pw.value;
              var pw2 = frm.rePw.value;
              if(pw != pw2) {
                  alert("비밀번호와 비밀번호 확인이 서로 다릅니다.")
                  frm.pw.focus();
                  resultFlag = false;
              }

              return resultFlag;

          }

          function idCheck() {
              var child;
              var id = document.getElementById("id");
              if(id.value!="") {
                  child = window.open("idCheck.jsp?id="+id.value, "child", "width=400,height=400");
                  return false;
              } else {
                  alert("아이디 입력란에 아이디를 입려하고, 진행하시기 바랍니다.");
                  id.focus();
                  return false;
              }
          }
      </script>
      </section>
      <footer class="join_footer">
          <p>COPYRIGHT ©2023 Plus&PlusEdu. ALL RIGHTS RESERVED.</p>
      </footer>
  </div>
  </body>
</html>
