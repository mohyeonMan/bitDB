<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#boardWriteForm div{
	color : red;
	font-size: 8pt;
	margin-left: 3pt;
	}
	#boardWriteForm table{
	border : 1px solid black;
	border-collapse : collapse;
	}
</style>
</head>
<body>
<h3>게시글 수정</h3>
<hr>
<input type="hidden" id="seq" value="${seq }">
<input type="hidden" id="pg" value="${pg }">
<form id="boardUpdateForm" name="boardUpdateForm">
	<table border="1">
		<tr>
			<td width="80" align="center">제목</td>
			<td width="150">
				<input type="text" name="subject" id="subject" style="width: 250px;">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<div id="contentDiv"></div>
				<textarea cols="30" rows="15" name="content" id="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글작성" id="boardUpdateBtn">
				<input type="button" value="다시 작성" onclick="location.reload()">
			</td>
		</tr>
	
	</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/boardUpdate.js"></script>
</body>
</html>