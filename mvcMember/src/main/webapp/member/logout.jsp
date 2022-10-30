<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<script type="text/javascript">
		window.onload = function(){ // 창이 열림과 동시에 메소드실행.
			alert(${requestScope.memName}+"님 로그아웃 되었습니다.");
			location.href='login.do';
		}
	</script>
</body>
</html>