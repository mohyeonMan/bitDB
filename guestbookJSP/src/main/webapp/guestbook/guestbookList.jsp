<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 int pg = Integer.parseInt(request.getParameter("pg"));
 
 int endNum = pg*3; /* 페이지 처리를 위한 변수 */
 int startNum = endNum-2;

Map<String,Integer> map = new HashMap<String,Integer>(); //페이지 수를 나눠주기 위한 맵 컬렉션
map.put("startNum", startNum);
map.put("endNum", endNum);

GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
ArrayList<GuestbookDTO> list = new ArrayList<>();

guestbookDAO.guestbookList(list,map);

int totalA = guestbookDAO.getTotalA();	//총 게시물의 수 
int totalPage = (totalA+2)/3;	//총 페이지 수
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook List</title>
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
<%
if (list!=null){%>
<h2>방명록</h2>
<input type="button" value="방명록 작성" onclick="location.href='guestbookWriteForm.jsp'">

<%for(int i =0;i<list.size();i++){%>

<hr>
	<table border=1px cellpadding="5" >
		<tr>
			<th width="100">작성자</th>
			<td width="150"><%=list.get(i).getName()%></td>
			<th width="100">작성일</th>
			<td width="150"><%=list.get(i).getLogtime()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan= "3"><%=list.get(i).getEmail()%></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan= "3"><%=list.get(i).getHomepage()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan= "3"><%=list.get(i).getSubject()%></td>
		</tr>
		<tr>
			<td colspan="4" height="100" ><pre style="white-space:pre-wrap"><%=list.get(i).getContent()%></pre></td>
		</tr>
	</table>
<%}%> 

<!-- 페이지번호 -->
<%for(int i=1;i<=totalPage;i++){%>
	<%if(i==pg){ %>
		<a id="currentPaging" href="guestbookList.jsp?pg=<%=i%>"><%=i%>
	<%}else{ %>
		<a id="paging" href="guestbookList.jsp?pg=<%=i%>"><%=i%>
	<%} %>
<%} %>

<%} else {%>
<h2>방명록을 불러오는데 실패했습니다.</h2>
<%} %>
<br>



</body>
</html>