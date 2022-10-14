<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="result.jsp"> <!-- 같은 폴더에 있기 때문에 폴더 안써도된다. -->
	<table border="1">
		<tr>
			<th width="50" align="center">X</th> 
			<td><input type="text" name="x"></td>
		</tr>	
		<tr>
			<th align="center">Y</th>
			<td><input type="text" name="y"></td>
		</tr>	
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="계산">
			<input type="reset" value="취소"></td>
		</tr>
	</table>
</form>
</body>
</html>