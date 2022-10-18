<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
MemberDAO memberDAO = MemberDAO.getInstance();
boolean exist = memberDAO.isExistId(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="" action="checkId.jsp"><!-- 재귀적 -->
		
		<%if (exist) {%>
			<%=id%>는 사용 불가능합니다.<br> 
			<input type="text" name="id"> 
			<input type="submit" value="중복체크">
			
		<%} else {%>
			<%=id%>는 사용 가능합니다.<br>
			<input type="button" value="사용하기" onclick="checkIdClose('<%=id%>')"><!-- 문자는 따옴표. -->
		<%}%>
		
	</form>
<script type="text/javascript">
function checkIdClose(id){
	 //document 쓰면 안된다. 해당 body를 의미
	opener.writeForm.id.value = id; // 현재 열려있는 writeForm. 꺼져있으면 안들어간다.
	opener.writeForm.pwd.focus();
	window.close();
}
</script>
</body>
</html>