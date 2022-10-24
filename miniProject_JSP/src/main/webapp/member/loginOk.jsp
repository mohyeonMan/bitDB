<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String name = (String) session.getAttribute("memName");
// 오브젝트타입으로 가져오므로 down casting 필요.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
</head>
<body>
<input type="hidden" id="name" value=<%=name%>>
	<script type="text/javascript">
		window.onload = function() { // 창이 열림과 동시에 메소드실행.
			alert(document.getElementById("name").value+"님 환영합니다!");
			location.href = '../index.jsp';
		}
	</script>
</body>
</html>