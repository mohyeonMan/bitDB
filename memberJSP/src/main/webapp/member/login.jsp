<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤 활용.
String name = memberDAO.memberLogin(id,pwd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(name==null){%>
	아이디 또는 비밀번호가 틀렸습니다.
<%}else{%>
	<%=name%>님 로그인
<%} %>
</body>
</html>