<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {
        String sql = "select * from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next() || id.length() > 15){
            out.println("<p>사용 불가능한 아이디</p>");
            out.println("<a href='" + request.getContextPath() + "/member/idCheck.jsp?id="+id+"'>아이디 중복 혹은 글자수 제한</a>");
        } else {
            out.println("<p>사용 가능한 아이디</p>");
            out.println("<button type='button' onclick=\"fnc1('" + id + "')\">아이디 사용하기</button>");
        }

    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<script>
    function fnc1(cid) {
        opener.document.frm1.id.value = cid;
        opener.document.frm1.id.readOnly=true;
        opener.document.frm1.ckItem.value = "yes";
        window.close();
    }
</script>