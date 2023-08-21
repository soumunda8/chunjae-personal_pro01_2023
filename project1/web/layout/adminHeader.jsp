<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String adminPath = path + "/admin";
    String admin_login = (String) session.getAttribute("sid");
    String scriptStr = "";

    boolean check_admin = admin_login != null && admin_login.equals("admin");

    if(!check_admin) {
        scriptStr = "<script>";
        scriptStr += "alert('잘못된 접근입니다.');";
        scriptStr += "location.href='" + path + "/';";
        scriptStr += "</script>";
        out.println(scriptStr);
    }
%>
<div class="admin_hd_wrap" id="adminHdWrap">
    <a href="<%=path %>/" class="logo">
        <img src="<%=path %>/image/common/logo.png" alt="plus&plusEdu 로고타입">
        <p><span class="mainCol">Plus</span> & <span class="subCol">Plus</span> Edu</p>
    </a>
    <nav id="adminHdGnb">
        <h2>관리자페이지</h2>
        <ul class="menu">
            <li class="item1">
                <a href="<%=adminPath %>/memberList.jsp" class="dp1">회원 관리</a>
            </li>
            <li class="item2">
                <a href="<%=adminPath %>/noticeList.jsp" class="dp1">공지사항 관리</a>
            </li>
            <li class="item3">
                <a href="<%=adminPath %>/qnaList.jsp" class="dp1">문의 관리</a>
            </li>
        </ul>
    </nav>
</div>

<script>
</script>