<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

//String name= (String)session.getAttribute("memName");
			// 오브젝트타입으로 가져오므로 down casting 필요.
//쿠키
String name= null;
String id = null;

//특정쿠키를 가져올수 없다. 모든쿠키를 다 가져온다.
Cookie[] ar = request.getCookies();
if (ar!=null){
	for(int i=0;i<ar.length;i++){
		String cookieName = ar[i].getName();
		String cookieValue = ar[i].getValue();
		
		System.out.println("쿠키명 = "+cookieName);
		System.out.println("쿠키값 = "+cookieValue);
		System.out.println();
		
		if(cookieName.equals("memName")) name = cookieValue;
		if(cookieName.equals("memId")) id = cookieValue;
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
</head>
<body>
<h3><%=name%>님 로그인</h3>
<br>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
</body>
</html>