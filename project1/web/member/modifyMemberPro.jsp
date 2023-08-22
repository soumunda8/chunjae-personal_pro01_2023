<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.util.*" %>
<%@ include file="../layout/encoding.jsp" %>
<%
    String loginId = (String) session.getAttribute("sid");
    String id = request.getParameter("id");
    String rePw = request.getParameter("rePw");
    String pwCk = request.getParameter("pwCk");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    String originPw = "";
    String addPw = "";
    String sql = "";
    String scriptStr = "";

    int cnt = 0;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    if(loginId != null && (loginId.equals("admin") || loginId.equals(id))) {
        DBC con = new MariaDBCon();
        conn = con.connect();

        try {
            sql = "select * from member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                originPw = AES256.decryptAES256(rs.getString("pw"), "%02x");
            }

            rs.close();
            pstmt.close();

            if(pwCk.equals(rePw)){
                addPw = originPw;
            } else {
                addPw = rePw;
            }
            addPw = AES256.encryptAES256(addPw, "%02x");

            sql = "update member set pw = ?, tel = ?, email = ? where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, addPw);
            pstmt.setString(2, tel);
            pstmt.setString(3, email);
            pstmt.setString(4, id);
            cnt = pstmt.executeUpdate();

            if(cnt > 0){
                response.sendRedirect(request.getContextPath() + "/member/mypage.jsp");
            } else {
                scriptStr = "<script>";
                scriptStr += "alert('정보변경이 실패하였습니다.');";
                scriptStr += "history.go(-1);";
                scriptStr += "</script>";
                out.println(scriptStr);
            }
        } catch (SQLException e) {
            System.out.println("개인정보 수정 SQL 구문 오류");
        } finally {
            con.close(pstmt, conn);
        }
    } else {
        scriptStr = "<script>";
        scriptStr += "alert('잘못된 접근입니다.');";
        scriptStr += "location.href='" + request.getContextPath() + "/';";
        scriptStr += "</script>";
        out.println(scriptStr);
    }

%>