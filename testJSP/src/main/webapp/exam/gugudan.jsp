<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1px;>
<%for(int i=2;i<=9;i++){%>
	<tr>
	<%for(int dan=1;dan<=9;dan++){%>
	 <td width="100">&emsp;<%=dan+"*"+i+"="+dan*i%></td>
	<%}%>
	</tr>
<%}%>
</table>
</body>
</html>