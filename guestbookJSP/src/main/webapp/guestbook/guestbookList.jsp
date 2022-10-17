<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
ArrayList<GuestbookDTO> list = new ArrayList<>();
guestbookDAO.guestbookList(list);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook List</title>
</head>
<body>
<h2>방명록</h2>

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
			<td colspan="4" height="100"><%=list.get(i).getContent()%></td>
		</tr>
	</table>
<%} %>
</body>
</html>