<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("memName"); // 하나의 세션 없애기.
session.invalidate(); //모든 세션을 없애기.

//쿠키
Cookie[] ar = request.getCookies();
if(ar!=null){
	for(int i=0;i<ar.length;i++){
		if(ar[i].getName().equals("memName")){
			ar[i].setMaxAge(0);
			response.addCookie(ar[i]);
		}
		if(ar[i].getName().equals("memId")){
			ar[i].setMaxAge(0);
			response.addCookie(ar[i]);
		}
	}
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<h2>로그아웃</h2>
</body>
</html>