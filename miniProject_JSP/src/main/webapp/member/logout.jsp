<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String)session.getAttribute("memName");
session.invalidate(); //모든 세션을 없애기.
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<input type="hidden" id="name" value=<%=name%>>
<script type="text/javascript">
		window.onload = function(){ // 창이 열림과 동시에 메소드실행.
			alert(document.getElementById("name").value+"님 로그아웃 되었습니다.");
			location.href='../index.jsp';
		}
	</script>
</body>
</html>