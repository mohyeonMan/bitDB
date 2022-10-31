<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 결과</title>
</head>
<body>
<script type="text/javascript">
		window.onload = function(){ // 창이 열림과 동시에 메소드실행.
			alert("게시글이 작성되었습니다.");
			location.href='boardList.do?pg=1';
		}
	</script>
</body>
</html>