<%@page import="board.bean.BoardPaging"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 한페이지의 게시물 수
int pg = Integer.parseInt(request.getParameter("pg"));
int endNum = pg*5;
int startNum = endNum-4;

Map<String,Integer> map = new HashMap<String,Integer>();
map.put("startNum",startNum);
map.put("endNum",endNum);

BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.list(map);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

//총 페이지수와 한번에 표시되는 페이지 수 
int totalA=boardDAO.getTotal();

BoardPaging boardPaging = new BoardPaging();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);

boardPaging.makePagingHTML();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<style type="text/css">

#pagingDiv{
	/*border:1px solid red;*/
	text-align:center;
	width:950px;
	margin-top:10px;
}
#currentPaging{
	border: 1px solid green;
	padding:7px 10px;
	margin:10px;
	text-decoration: underline;
	cursor:pointer;
}
#paging{
	color:black;
	text-decoration: none;
	cursor:pointer;
}
input{
	float:left;
}
.subjectA:hover{
	color:green;
	text-decoration: underline;
	cursor:pointer;
}


</style>
</head>
<body>
<%if (list!=null){ %>
<h2>게시판</h2>
<hr>
	<table border=1px cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
		<tr>
			<th style="width: 100px;">글번호</th>
			<th style="width: 400px;">제목</th>
			<th style="width: 100px;">작성자</th>
			<th style="width: 100px;">조회수</th>
			<th style="width: 200px;">작성일</th>
		</tr>
<%for (BoardDTO boardDTO : list){%>
		<tr>
			<td align="center"><%=boardDTO.getSeq()%></td>
			<td><span class="subjectA" onclick="location.href='boardView.jsp?no=<%=boardDTO.getSeq()%>&pg=<%=pg%>'">
			<%=boardDTO.getSubject()%></span></td>
			<td><%=boardDTO.getId()%></td>
			<td align="center"><%=boardDTO.getHit()%></td>
			<td><%=sdf.format(boardDTO.getLogtime())%></td>
		</tr>
<%}}%>
</table>


<!-- 세션확인 후 로그인 or 글쓰기 -->
<%
String name = (String)session.getAttribute("memName");
String id = (String)session.getAttribute("memId");
%>
<% if (name!=null || id !=null){ %>
<br>
<input type="button" onclick="location.href='boardWriteForm.jsp'" value="글쓰기" float="left">
<%}else{ %>
<br>
<input type="button" onclick="location.href='../member/loginForm.jsp'" value="로그인">
<%} %>
<input type="button" onclick="location.href='../index.jsp'" value="메인으로">
<div id="pagingDiv"><%=boardPaging.getPagingHTML()%></div>
</body>
<script type="text/javascript">
function boardPaging(pg){
	location.href="boardList.jsp?pg="+pg;
}
</script>
</html>