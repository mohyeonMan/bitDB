<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<style type="text/css">

#pagingDiv{
	text-align:center;
	width:950px;
	margin-top:10px;
	margin: auto;
}
#pagingDiv:after{
	clear:both;
}
#currentPaging{
	border: 1px solid green;
	padding:7px 10px;
	margin:10px;
	text-decoration: underline;
	cursor:pointer;
}
#paging{
	color:black;
	text-decoration: none;
	cursor:pointer;
}
input{
	float:left;
}
.subjectA:hover{
	color:green;
	text-decoration: underline;
	cursor:pointer;
}
.back:hover{
	background: lightgray;
}


</style>
</head>
<body>
<h2>게시판</h2>
<hr>
	<table border=1px cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
		<tr>
			<th style="width: 100px;">글번호</th>
			<th style="width: 400px;">제목</th>
			<th style="width: 100px;">작성자</th>
			<th style="width: 100px;">조회수</th>
			<th style="width: 200px;">작성일</th>
		</tr>
	<c:forEach var="boardDTO" items="${requestScope.list}">
		
		<tr>
				<td align="center">${boardDTO.seq}</td>
				<td ><a class="subjectA" onclick="isLogin('${requestScope.id}',${boardDTO.seq},${requestScope.pg})">
															${boardDTO.subject}</a></td>
				<td align="center">${boardDTO.id}</td>
				<td align="center">${boardDTO.hit} </td>
				<td align="center">${boardDTO.logtime} </td>
			</tr>
		</c:forEach>

</table>


<!-- 세션확인 후 로그인 or 글쓰기 -->

<c:if test="name!=null || id!=null">
<br>
<input type="button" onclick="location.href='boardWriteForm.do'" value="글쓰기" float="left">
</c:if>
<c:if test="name==null || id!==null">
<br>
<input type="button" onclick="location.href='../member/loginForm.do'" value="로그인">
</c:if>
<input type="button" onclick="location.href='../index.jsp'" value="메인으로">
<div id="pagingDiv" >${boardPaging.getPagingHTML()}</div>
</body>
<script type="text/javascript">
function boardPaging(pg){
	location.href="boardList.do?pg="+pg;
}
function isLogin(id,seq,pg){
	if(id =='null '){
		alert("로그인해주세요");
		location.href = '../member/loginForm.do';
	} else{
		location.href="boardView.do?seq="+seq+"&pg="+pg;
	}
}
</script>
</html>