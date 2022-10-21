<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤 활용.
String name = memberDAO.login(id, pwd);
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
if(name!=null){
	//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name,"UTF-8")); 
												//한글이 깨져서 가는것을 방지하기위해 사용하는 스태틱클래스.
	//세션
	//HttpSession session = request.getSession();
	// 서블릿에서 기본적으로 세션을 만들기때문에 Duplicate error
	session.setAttribute("memName", name); //memName 세션에 name 추가. 30분 유지.
	response.sendRedirect("loginOk.jsp"); //세션에 추가되었으므로 데이터를 가져갈 필요가 없다.
	
	
}else{
	response.sendRedirect("loginFail.jsp");
} %>
</body>
</html>