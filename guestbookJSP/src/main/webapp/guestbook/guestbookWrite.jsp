<%@page import="guestbook.dao.GuestbookDAO"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
GuestbookDTO guestbookDTO = new GuestbookDTO(
		request.getParameter("name"),
		request.getParameter("email"),
		request.getParameter("homepage"),
		request.getParameter("subject"),
		request.getParameter("content")
		);
 GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
 int done= guestbookDAO.guestWrite(guestbookDTO);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook Write</title>
<style type="text/css">
body {
	font-size: 5;
}
</style>
</head>
<body>
<img src="../img/jjang.png" width="100" height= "100" 
	onclick="location.href='guestbookWriteForm.jsp'" 
	style="cursor: pointer"><br>
<% if(done==1){%>
방명록 작성에 <strong>성공</strong>했습니다.<br>
<input type="button" value="방명록으로" onclick="location.href='guestbookList.jsp?pg=1'">
<input type="button" value="새로 쓰기" onclick="history.back">
<%} else {%> 
방명록 작성에 <strong>실패</strong>하였습니다.<br>
<input type="button" value="이전으로" onclick="history.go(-1)">
<%} %>
</body>
</html>