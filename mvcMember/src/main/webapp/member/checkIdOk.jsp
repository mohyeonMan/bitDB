<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${id }는 사용 가능합니다.</h3><br>
<input type="button" value="사용하기" onclick="checkIdClose('${id}')">
<script type="text/javascript">
function checkIdClose(id){
	 //document 쓰면 안된다. 해당 body를 의미
	opener.writeForm.id.value = id; // 현재 열려있는 writeForm. 꺼져있으면 안들어간다.
	opener.writeForm.idDup.value = id;
	opener.writeForm.pwd.focus();
	window.close();
}
</script>
</body>
</html>