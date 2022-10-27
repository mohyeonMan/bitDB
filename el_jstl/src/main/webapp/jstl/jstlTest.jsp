
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>*** 변수 설정 ***</h3>

<c:set var="name" value="박지훈"></c:set> <%-- var name == "박지훈" --%>
<c:set var="age" value="28"></c:set>

이름은 <c:out value="${name }"></c:out> 입니다.<br>
나이는 ${age}살 입니다.<br>

<h3>*** forEach ***</h3>

<!-- for(int i=1;i<=10;i++) -->
<c:forEach var="i" begin="1" end="10" step="1">
<c:set var="sum" value="${sum+i}"></c:set> 
</c:forEach>
<br>

 1~10 합 = ${sum }
<br>

<c:forEach var="i" begin="0" end="9" step="1"> <!-- step < 1 불가능. 무한루프 불가능.-->
${10-i}
</c:forEach>

<h3>*** forToken ***</h3>
<c:forTokens var="car" items="가,나,다,라,마,바,사" delims=",">
	${car }<br> 
</c:forTokens><!--  줄바꿈도 반복 -->




</body>
</html>