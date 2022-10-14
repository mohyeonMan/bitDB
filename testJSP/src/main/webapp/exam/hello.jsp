<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
//전역변수(필드), 1번만 처리.
String name ="박지훈";
int age = 25;
%>

<%
//스크립트릿(scriptlet) 요청시마다 호출된다. 메소드처럼.
//톰캣 restart, JSP의 내용 수정시 초기화된다. 자바파일은 수정과 동시에 컴파일하기 때문.
age++;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello JSP~<br>
안녕하세요 JSP~<br>
<!-- 출력문의 활용. -->
나의 이름은 <%=name%> 입니다.<br>
나의 이름은 <%out.println(name);%> 입니다.<br>
나이는 <%=age%>세 입니다. 
<!-- HTML주석.<%=age%>-->
<%-- JSP주석. 소스코드에서도 볼수없다.--%>
</body>
</html>

<!-- 
hello.jsp파일을 생성하면
내부에서 hello_jsp.java 서블릿 파일을 작성한 후,
hello_jsp.class파일로 컴파일된다. 톰캣도 restart한다.
파일이 바뀔때마다 컴파일을 하고, 톰캣을 restart하기 때문에 프로그램이 무겁다.

작성된 서블릿파일 - D:\java_ee\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\testJSP\org\apache\jsp

서블릿파일이 작성되기 때문에 내장객체도 생성된다.
가장많이 쓰는것은 request, response,session,page
-->