<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

Map<String, String> map= new HashMap<String, String>();
map.put("id", (String)session.getAttribute("memId"));
map.put("name", (String)session.getAttribute("memName"));
map.put("email", (String)session.getAttribute("memEmail"));
map.put("subject", request.getParameter("subject"));
map.put("content", request.getParameter("content"));

BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.write(map);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 결과</title>
</head>
<body>
<script type="text/javascript">
		window.onload = function(){ // 창이 열림과 동시에 메소드실행.
			alert("게시글이 작성되었습니다.");
			location.href='../index.jsp';
		}
	</script>
</body>
</html>