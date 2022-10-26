<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>** include directive **</h3>
<%@ include file="today.jsp" %> <!-- include로 포함하여 컴파일. -->

<h3>** include JSP tag **</h3> <!-- 컴파일하여 결과물을 포함 -->
<jsp:include page="image.jsp"/> <!-- 변수명 등 이 겹칠일이 없어 더 선호됨.-->

<%String name = "홍길동"; %>  
main.jsp의 name = <%=name %> 
</body>
</html>