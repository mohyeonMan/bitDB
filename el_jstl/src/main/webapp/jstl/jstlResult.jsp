<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/> <!-- request.setCharacterEncoding("UTF-8") -->
<ul>
	<li>이름 : ${param.name }</li>
	<li>나이 : ${param.age }
		<c:if test="${param.age >=19}"><strong>성인</strong></c:if>
		<c:if test="${param.age <19}"><strong>청소년</strong></c:if></li>
		
	<%-- Mapper파일 에서의 명령어와 비슷하다. --%>
	<%-- <li>색깔 : <c:if test="${param.color =='red'}">빨강</c:if>
				<c:if test="${param.color =='green'}">초록</c:if>
				<c:if test="${param.color =='blue'}">파랑</c:if>
				<c:if test="${param.color =='magenta'}">보라</c:if>
				<c:if test="${param.color =='cyan'}">하늘</c:if></li> --%>
	<li> 색깔 : <c:choose>
					<c:when test="${param.color =='red'}">빨강</c:when>
					<c:when test="${param.color =='green'}">초록</c:when>
					<c:when test="${param.color =='blue'}">파랑</c:when>
					<c:when test="${param.color =='magenta'}">보라</c:when>
					<c:when test="${param.color =='cyan'}">하늘</c:when>
				</c:choose>
	
	<%-- <li>취미 : ${paramValues['hobby'][0] } 
			${paramValues['hobby'][1] }
			${paramValues['hobby'][2] }
			${paramValues['hobby'][3] }
			${paramValues['hobby'][4] } </li> --%>
			
	<li> 취미 : <c:forEach var="data" items="${paramValues.hobby }">
			${data }
			</c:forEach>
	</li>
</ul>
</body>
</html>