<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
ResultSet rs=null;
guestbookDAO.guestbookList(rs);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook List</title>
</head>
<body>
<h2>방명록</h2>

<%while(rs.next()){%>
<hr>
	<table border=1px cellpadding="5" >
		<tr>
			<th width="100">작성자</th>
			<td width="150"><%=rs.getString("name")%></td>
			<th width="100">작성일</th>
			<td width="150"><%=rs.getString("logtime")%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan= "3"><%=rs.getString("email")%></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan= "3"><%=rs.getString("homepage")%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan= "3"><%=rs.getString("subject")%></td>
		</tr>
		<tr>
			<td colspan="4" height="100"><%=rs.getString("content")%></td>
		</tr>
	</table>
<%} %>
</body>
</html>