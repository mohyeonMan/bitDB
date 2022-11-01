<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Failed</title>
</head>
<body>
<script type="text/javascript">
		window.onload = function(){ // 창이 열림과 동시에 메소드실행.
			alert("아이디 또는 비밀번호가 다릅니다.");
			location.href='loginForm.do';
		}
	</script>
</body>
</html>