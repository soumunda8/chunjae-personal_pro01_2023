<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%
    String id = request.getParameter("id");
    boolean adminYn = session.getAttribute("sid").equals("admin");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    String sql = "";

    try {

        /* 게시글, 댓글 삭제 */
        sql = "select count(*) as num from board where author = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        if(rs.next()) {

            rs.close();

            try {

                sql = "delete from board where author = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                cnt = pstmt.executeUpdate();

                if(cnt > 0){

                    pstmt.close();

                    sql = "select count(*) as num from comment where author = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, id);
                    rs = pstmt.executeQuery();

                    if(rs.next()) {

                        rs.close();
                        pstmt.close();

                        sql = "delete from comment where author = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, id);
                        pstmt.executeUpdate();

                    } else {

                        rs.close();

                    }

                    pstmt.close();

                }

            } catch (SQLException e) {
                System.out.println("SQL 구문 오류");
            } finally {
                pstmt.close();
            }
        } else {
            rs.close();
            pstmt.close();
        }

        /* 문의 삭제 */
        sql = "select count(*) as num from qna where author = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        if(rs.next()) {

            rs.close();
            pstmt.close();

            try {

                sql = "delete from qna where author = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                cnt = pstmt.executeUpdate();

            } catch (SQLException e) {
                System.out.println("SQL 구문 오류");
            } finally {
                pstmt.close();
            }
        } else {
            rs.close();
            pstmt.close();
        }

        sql = "delete from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        cnt = pstmt.executeUpdate();
        if(cnt > 0){
            if(adminYn) {
                response.sendRedirect(request.getContextPath() + "/admin/memberList.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/member/logout.jsp");
            }
        } else {
            out.println("<script>alert('탈퇴 처리를 진행하지 못했습니다.');history.go(-1);</script>");
        }
    } catch(SQLException e) {

        System.out.println("SQL 구문이 처리되지 못했습니다.");

    } finally {

        con.close(pstmt, conn);

    }

%>