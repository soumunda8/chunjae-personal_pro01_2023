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
        <div class="sub_visual visual03">
            <div class="inner">
                <h2>마이페이지</h2>
            </div>
        </div>
        <div class="inner">
            <div class="breadcrumb">
                <p><a href="<%=path %>/"> HOME </a> &gt; <span> 마이페이지 </span></p>
            </div>
            <div class="content_wrap">
                <h3>마이페이지</h3><table class="table tb2">
                <tbody>
                    <tr>
                        <th>아이디</th>
                        <td><%=mem.getId() %></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <%=originPw.substring(0, 2) %>
                            <% for(int i=0;i<originPw.length()-2;i++) { out.print("*"); } %>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><%=mem.getName() %></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><%=mem.getTel() %></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><%=mem.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td><%=mem.getPoint() %></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_group txt_right">
                    <a href="<%=path %>/member/modifyMember.jsp?id=<%=mem.getId() %>" class="inBtn inBtn1">정보 수정</a>
                    <a href="<%=path %>/member/removeMemberPro.jsp?id=<%=mem.getId() %>" class="inBtn inBtn2">회원 탈퇴</a>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer" id="footer">
        <%@ include file="../layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>