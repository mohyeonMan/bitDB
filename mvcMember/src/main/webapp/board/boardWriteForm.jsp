<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style type="text/css">
div{
	color:red;
	font-size:0.7em;
	font-weight:bold;
}
</style>
</head>
<body>
<h2>게시글 작성</h2>
<hr>
<form name="boardWriteForm" method="post" action="boardWrite.do">
<table border=1px cellpadding="5" cellspacing="0">
	<tr>
		<th width="70">제목</th>
		<td><input type="text" size="70em" name="subject"  placeholder="제목입력">
		<div id="subjectDiv"></div></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><div id="contentDiv"></div>
		<textarea rows="1" cols="5" style="width: 100%; height: 200px;" name="content" placeholder="내용입력" ></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" onclick="boardWriteCheck()" value="글쓰기">
		<input type="reset" value="다시 작성">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
function boardWriteCheck(){
	document.getElementById("subjectDiv").innerText ="";
	document.getElementById("contentDiv").innerText ="";
	
	if(document.boardWriteForm.subject.value ==""){
		document.getElementById("subjectDiv").innerText ="제목을 입력해주세요.";
		document.boardWriteForm.subject.focus();
	} 
	else if(document.boardWriteForm.content.value ==""){
		document.getElementById("contentDiv").innerText ="내용을 입력해주세요.";
			document.boardWriteForm.content.focus();
	}
	else document.boardWriteForm.submit();
}
</script>
</body>
</html>