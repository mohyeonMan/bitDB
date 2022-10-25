<%@page import="javax.script.ScriptContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String)session.getAttribute("memName");
String id = (String)session.getAttribute("memId");
int no = Integer.parseInt(request.getParameter("no"));
int pg = Integer.parseInt(request.getParameter("pg"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
</head>
<body>
<%if(name==null||id==null){ %>
	<script type="text/javascript">
	alert("로그인해주세요");
	location.href = '../member/loginForm.jsp';
	</script>
<%}else{ %>
	no=<%=no %> ,pg=<%=pg %>
<%} %>
</html>