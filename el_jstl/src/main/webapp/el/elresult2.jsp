<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tld" uri="tld" %> <!--  custom tag -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
<h3>자바클래스의 메소드를 활용</h3>

${param['x']} + ${param['y']} = ${tld:sum(param['x'],param['y'])} <br>

</body>
</html>