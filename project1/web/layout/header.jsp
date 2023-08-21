<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String sid = session.getAttribute("sid")!=null ? (String) session.getAttribute("sid") : null;
%>
<div class="hd_wrap hd_top">
    <nav class="tnb inner">
        <ul class="menu clearfix">
            <li class="home none"><a href="<%=path %>/"><i class="fas fa-home"></i>Plus&Plus Edu</a></li>
            <% if(sid != null) { %>
            <li><a href="<%=path %>/member/logoutPro.jsp"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
            <% if(sid.equals("admin")) { %>
            <li class="none"><a href="<%=path %>/admin/memberList.jsp">관리자페이지</a></li>
            <% } else { %>
            <li class="none"><a href="javascript:return false"><i class="fas fa-home"></i>마이페이지</a></li>
            <!-- 문의내역에 신청 현황리스트 + 문의하기 2차탭으로 -->
            <% } %>
            <% } else { %>
            <li><a href="<%=path %>/member/term.jsp"><i class="fas fa-user-plus"></i>회원가입</a></li>
            <li class="none"><a href="<%=path %>/member/login.jsp"><i class="fas fa-sign-in-alt"></i>로그인</a></li>
            <% } %>
        </ul>
    </nav>
</div>
<div class="hd_wrap hd_con">
    <div class="inner">
        <a href="<%=path %>/" class="logo"><img src="<%=path %>/image/common/logo.png" alt="플러스앤플러스에듀 로고"><p><span class="mainCol">Plus</span> & <span class="subCol">Plus</span> Edu</p></a>
        <nav class="gnb">
            <ul class="menu">
                <li class="item1">
                    <a href="<%=path %>/company01.jsp" class="dp1">소개</a>
                    <ul class="sub">
                        <li><a href="<%=path %>/company01.jsp">인사말</a></li>
                        <li><a href="<%=path %>/company02.jsp">연혁</a></li>
                        <li><a href="<%=path %>/company03.jsp">오시는길</a></li>
                    </ul>
                </li>
                <li class="item2">
                    <a href="javascript:return false" class="dp1">온라인교육</a>
                    <ul class="sub">
                        <li><a href="javascript:return false">서울시평생학습 포털</a></li>
                        <li><a href="javascript:return false">KOCW</a></li>
                        <li><a href="javascript:return false">K-MOOC</a></li>
                    </ul>
                </li>
                <li class="item3">
                    <a href="javascript:return false" class="dp1">자격증</a>
                    <ul class="sub">
                        <li><a href="javascript:return false">정보처리기사</a></li>
                        <li><a href="javascript:return false">정보처리산업기사</a></li>
                        <li><a href="<%=path %>/board/listBoard.jsp">자유게시판</a></li>
                    </ul>
                </li>
                <li class="item4">
                    <a href="<%=path %>/board/listNotice.jsp" class="dp1">커뮤니티</a>
                    <ul class="sub">
                        <li><a href="<%=path %>/board/listNotice.jsp">공지사항</a></li>
                        <% if(sid != null && !sid.equals("admin")) { %>
                        <li><a href="<%=path %>/qna/addQna.jsp">문의하기</a></li>
                        <% } %>
                        <li><a href="javascript:return false">자주하는질문</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>