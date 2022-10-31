<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
</head>
<body>
	<script type="text/javascript">
		window.onload = function() { // 창이 열림과 동시에 메소드실행.
			alert(${sessionScope.memName}+"님 환영합니다!");
			location.href = '../index.jsp';
		}
	</script>
</body>
</html>