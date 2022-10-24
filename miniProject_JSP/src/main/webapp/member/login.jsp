<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤 활용.
MemberDTO memberDTO= memberDAO.login(id, pwd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

<%
// 페이지이동
if(memberDTO!=null){

	session.setAttribute("memName", memberDTO.getName()); //memName 세션에 name 추가. 30분 유지.
	session.setAttribute("memId",memberDTO.getId());
	session.setAttribute("memEmail",memberDTO.getEmail1()+"@"+memberDTO.getEmail2());

	response.sendRedirect("loginOk.jsp"); //세션에 추가되었으므로 데이터를 가져갈 필요가 없다.
	
}else{
	response.sendRedirect("loginFail.jsp");
} %>
</body>
</html>