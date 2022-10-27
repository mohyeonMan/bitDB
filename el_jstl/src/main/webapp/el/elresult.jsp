<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--
//데이터 받아오기
int x = Integer.parseInt(request.getParameter("x"));
int y = Integer.parseInt(request.getParameter("y")); 이제 사용하지않는다.
--%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>

${param['x']} + ${param['y']} = ${param['x']+param['y']} <br>
${param['x']} - ${param['y']} = ${param['x']-param['y']} <br>
${param.x} * ${param.y} = ${param.x*param.y} <br>
${param.x} / ${param.y} = ${param.x/param.y} <br>
<!-- 값이 없어도 에러가 나지않는다. 출력되지 않고 처리. -->
</body>
</html>