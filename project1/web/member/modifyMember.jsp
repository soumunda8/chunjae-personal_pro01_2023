<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.dto.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.util.*" %>
<%
    String path =  request.getContextPath();
    String loginId = (String) session.getAttribute("sid");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    Member mem = new Member();
    try {
        String sql = "SELECT * FROM member WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, loginId);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            mem.setName(rs.getString("name"));
            mem.setId(rs.getString("id"));
            mem.setTel(rs.getString("tel"));
            mem.setEmail(rs.getString("email"));
            mem.setRegdate(rs.getString("regdate"));
            mem.setPoint(rs.getInt("point"));
            mem.setPw(rs.getString("pw"));
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

    String originPw = AES256.decryptAES256(mem.getPw(), "%02x");
    String rePw = originPw.substring(0, 2);
    for(int i = 0; i < originPw.length()-2; i++){
        rePw += "*";
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀::마이페이지</title>
    <%@ include file="../layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="header" id="header">
        <%@ include file="../layout/header.jsp" %>
    </header>
    <div class="contents">
        <div class="sub_visual visual05">
            <div class="inner">
                <h2>마이페이지</h2>
            </div>
        </div>
        <div class="inner">
            <div class="breadcrumb">
                <p><a href="<%=path %>/"> HOME </a> &gt; <span> 마이페이지 </span></p>
            </div>
            <div class="content_wrap">
                <h3>마이페이지</h3>
                <form action="<%=path %>/member/modifyMemberPro.jsp" method="post">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th><label for="id">아이디</label></th>
                            <td><input type="text" name="id" id="id" class="inData" value="<%=mem.getId() %>" readonly></td>
                        </tr>
                        <tr>
                            <th><label for="rePw">비밀번호</label></th>
                            <td>
                                <input type="text" value="<%=rePw %>" name="rePw" id="rePw" class="inData" required>
                                <input type="hidden" value="<%=rePw %>" name="pwCk" id="pwCk" />
                            </td>
                        </tr>
                        <tr>
                            <th><label for="name">이름</label></th>
                            <td><input type="text" name="name" id="name" class="inData" value="<%=mem.getName() %>" readonly></td>
                        </tr>
                        <tr>
                            <th><label for="tel">전화번호</label></th>
                            <td><input type="text" value="<%=mem.getTel() %>" name="tel" id="tel" class="inData" required></td>
                        </tr>
                        <tr>
                            <th><label for="email">이메일</label></th>
                            <td><input type="text" value="<%=mem.getEmail() %>" name="email" id="email" class="inData" required></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn_group txt_right">
                        <input type="submit" class="inBtn inBtn1" value="수정하기">
                        <a href="<%=path %>/member/mypage.jsp" class="inBtn inBtn1">취소하기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="footer" id="footer">
        <%@ include file="../layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>