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
            out.println("<script>");
            out.println("window.opener.handleIdCheckCompletion(\""+id+"\");");
            out.println("opener.document.getElementById('myForm').getElementById('id').value = " + id + ";");
            out.println("opener.document.getElementById('myForm').getElementById('ckItem').value = 'yes';");
            out.println("</script>");
            out.println("<button type='button' onclick='fnc1()'>"+"사용하기"+"</button>");
            out.println("<button type='button' onclick='fnc2()'>"+"수정하기"+"</button>");
        }

    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<script>
    function fnc1(){
        /*
        opener.document.frm1.id.value = cid;
        opener.document.frm1.ck_item.value = "yes";
        */
        window.close();
    }
    function fnc2(){
        window.history.go(-1);
    }
</script>