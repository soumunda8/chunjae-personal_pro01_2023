<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%
    String path =  request.getContextPath();

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
            out.println("<p class='use'>사용 불가능한 아이디</p>");
            out.println("<div class='btn_group txt_center'>");
            out.println("<a href='" + request.getContextPath() + "/member/idCheck.jsp?id="+id+"' class='inBtn inBtn2'>아이디 중복 혹은 글자수 제한</a>");
            out.println("</div>");
        } else {
            out.println("<p class='use'>사용 가능한 아이디</p>");
            out.println("<div class='btn_group'>");
            out.println("<button type='button' onclick=\"fnc1('" + id + "')\" class='inBtn'>아이디 사용하기</button>");
            out.println("</div>");
        }

    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<style>
    .use {text-align:center;margin-top:100px;font-size:22px;}
    .btn_group {text-align:center;margin-top:20px;}

    .inBtn {display:inline-block;border-radius:50px;min-width:140px;text-align:center;padding:0 24px;line-height:40px;color:#fff;font-size:18px;border:none;cursor:pointer;box-sizing:border-box;background-color:#c24856;}
    .inBtn:hover, .inBtn:active {box-shadow:2px 2px 5px #333;}
    .inBtn2 {background-color:#ffa300;}
</style>
<script>
    function fnc1(cid) {
        opener.document.frm1.id.value = cid;
        opener.document.frm1.id.readOnly=true;
        opener.document.frm1.ckItem.value = "yes";
        window.close();
    }
</script>