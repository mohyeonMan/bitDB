<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int pg = Integer.parseInt(request.getParameter("pg"));
int endNum = pg*5;
int startNum = endNum-4;

Map<String,Integer> map = new HashMap<String,Integer>();
map.put("startNum",startNum);
map.put("endNum",endNum);

BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.list(map);
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

int pgs=(list.size()+4)/5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<style type="text/css">
#currentPaging{
	color:red;
	text-decoration: underline;
	font-size:18pt;
}
#paging{
	color:black;
	text-decoration: none;
}

</style>
</head>
<body>
<%if (list!=null){ %>
<form>
<h2>게시판</h2>
<hr>
	<table border=1px cellpadding="5" cellspacing="0" >
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	</table>
	<table border=1px cellpadding="5" cellspacing="0">	
<%for (BoardDTO boardDTO : list){%>
		<tr>
			<td><%=boardDTO.getSeq()%></td>
			<td><%=boardDTO.getSubject()%></td>
			<td><%=boardDTO.getId()%></td>
			<td><%=simpleDateFormat.format(boardDTO.getLogtime())%></td>
			<td><%=boardDTO.getHit()%></td>
		</tr>
<%}}%>
</table>
</form>
<%for(int i=1;i<=pgs;i++){%>
<%if(i==pg){ %>
	<a id="currentPaging" href="boardList.jsp?pg=<%=i%>"><%=i%></a>
<%}else{ %>
	<a id="paging" href="boardList.jsp?pg=<%=i%>"><%=i%></a>
<%} %>
<%} %>
</body>
</html>