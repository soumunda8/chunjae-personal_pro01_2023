<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.plusnplus.db.*" %>
<%@ page import="com.plusnplus.vo.*" %>
<%@ page import="java.util.*" %>
<%
    String path =  request.getContextPath();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";

    DBC con = new MariaDBCon();
    conn = con.connect();

    List<Board> noticeList = new ArrayList<>();
    try {
        sql = "select * from boardList where boardType = ? limit 4";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, 1);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Board bd = new Board();
            bd.setBno(rs.getInt("bno"));
            bd.setTitle(rs.getString("title"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
            noticeList.add(bd);
        }
    } catch (SQLException e) {
        System.out.println("공지사항 글 불러오기 SQL 문 오류");
    } finally {
        rs.close();
        pstmt.close();
    }

    List<Board> boardList = new ArrayList<>();
    try {
        sql = "select * from boardList where boardType = ? limit 4";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, 2);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Board bd = new Board();
            bd.setBno(rs.getInt("bno"));
            bd.setTitle(rs.getString("title"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
            boardList.add(bd);
        }
    } catch (SQLException e) {
        System.out.println("자유게시판 글 불러오기 SQL 문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>플러스앤플러스에듀</title>
    <%@ include file="/layout/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/css/main.css">
  </head>
  <body>
  <div class="wrap">
      <header class="header" id="header">
          <%@ include file="/layout/header.jsp" %>
      </header>
      <div class="contents">
          <div class="inner">
              <figure class="vs">
                  <ul class="img_box">
                      <li class="item1 active">
                          <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                          <div class="bg_box"></div>
                          <h2 class="vs_tit">교육에 대한 끊임없는 도전<br><strong>행복한 내일을 함께 합니다</strong></h2>
                      </li>
                      <li class="item2">
                          <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                          <div class="bg_box"></div>
                          <h2 class="vs_tit">“나눔의 힘! 실천의 힘!”<br><strong>작은 따뜻함으로 세상을 바꿉니다</strong>
                          </h2>
                      </li>
                  </ul>
                  <ul class="btn_box">
                      <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                      <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
                  </ul>
                  <button type="button" class="play_btn"></button>
              </figure>
              <script>
                  $(function(){
                      $(".btn_box li .vs_btn").click(function(){
                          var par = $(this).parents("li").index();
                          $(".img_box li").removeClass("active");
                          $(".img_box li").eq(par).addClass("active");
                          $(".btn_box li").removeClass("active");
                          $(".btn_box li").eq(par).addClass("active");
                      });
                      var sw = 1;
                      var int1 = setInterval(function(){
                          if(sw==1){
                              autoplay(1);
                              sw = 0;
                          } else {
                              autoplay(0);
                              sw = 1;
                          }
                      }, 3500);

                      function autoplay(n){
                          $(".img_box li").removeClass("active");
                          $(".img_box li").eq(n).addClass("active");
                          $(".btn_box li").removeClass("active");
                          $(".btn_box li").eq(n).addClass("active");
                      }

                      $(".play_btn").click(function(){
                          if($(this).hasClass("active")){
                              $(this).removeClass("active");
                              sw = 1;
                              int1 = setInterval(function(){
                                  if(sw==1){
                                      autoplay(1);
                                      sw = 0;
                                  } else {
                                      autoplay(0);
                                      sw = 1;
                                  }
                              }, 3500);
                          } else {
                              $(this).addClass("active");
                              sw = 0;
                              clearInterval(int1);
                          }
                      });
                  });
              </script>
          </div>
          <div class="board_wrap">
              <div class="inner">
                  <h2 class="page_tit">커뮤니티</h2>
                  <ul class="board_lst">
                      <li class="item1">
                          <div class="board_tit">
                              <h3>공지사항</h3>
                              <a href="<%=path %>/board/listNotice.jsp" class="btn_more"><i class="fas fa-plus"></i></a>
                          </div>
                          <ul class="board_con">
                              <%
                                  if(noticeList.size() > 0){
                                      for(Board bd : noticeList) {
                                          String dateStr = bd.getResdate().substring(0, 10);
                                          String title = "";
                                          if(bd.getTitle().length() > 70) {
                                              title = bd.getTitle().substring(69) + "...";
                                          } else {
                                              title = bd.getTitle();
                                          }

                              %>
                              <li><a href="<%=path %>/board/getNotice.jsp?bno=<%=bd.getBno() %>"><%=title %><span class="date"><%=dateStr %></span></a></li>
                              <% } } else { %>
                              <li class="no_date">
                                  등록된 공지사항이 없습니다.
                              </li>
                              <% } %>
                          </ul>
                      </li>
                      <li class="item2">
                          <div class="board_tit">
                              <h3>자유게시판</h3>
                              <a href="<%=path %>/board/listBoard.jsp" class="btn_more"><i class="fas fa-plus"></i></a>
                          </div>
                          <ul class="board_con">
                              <%
                                  if(boardList.size() > 0){
                                      for(Board bd : boardList) {
                                          String dateStr = bd.getResdate().substring(0, 10);
                                          String title = "";
                                          if(bd.getTitle().length() > 70) {
                                              title = bd.getTitle().substring(69) + "...";
                                          } else {
                                              title = bd.getTitle();
                                          }

                              %>
                              <li><a href="<%=path %>/board/getBoard.jsp?bno=<%=bd.getBno() %>"><%=title %><span class="date"><%=dateStr %></span></a></li>
                              <% } } else { %>
                              <li class="no_date">
                                  등록된 자유게시판이 없습니다.
                              </li>
                              <% } %>
                          </ul>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <footer class="footer" id="footer">
          <%@ include file="/layout/footer.jsp" %>
      </footer>
  </div>
  </body>
</html>
