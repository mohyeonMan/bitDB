<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook WriteForm</title>
<style type="text/css">
div{
	color:red;
	font-size:0.7em;
}
</style>
</head>
<body>
<h2>방명록 작성</h2>
<hr>
<form name="guestbookWriteForm" method="get" action="guestbookWrite.jsp">
<table border=1px cellpadding="5" >
	<tr>
		<th width=100px;>작성자</th>
		<td><input type="text" size="30em" name="name" placeholder="작성자 입력">
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" size="40em" name="email" placeholder="이메일 입력">
		</td>
	</tr>
	<tr>
		<th>홈페이지</th>
		<td><input type="text" size="50em" name="homepage" value="http://"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" size="70em" name="subject" placeholder="제목입력">
		<div id="subjectDiv"></div></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><div id="contentDiv"></div>
		<textarea rows="1" cols="5" style="width: 100%; height: 200px;" name="content" placeholder="내용입력" ></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" onclick="checkGuestbookWrite()" value="글작성">
		<input type="reset" value="다시 작성">
		<input type="button" onclick="location.href='guestbookList.jsp?pg=1'" value="글목록">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
function checkGuestbookWrite(){
	document.getElementById("subjectDiv").innerText ="";
	document.getElementById("contentDiv").innerText ="";
	
	if(document.guestbookWriteForm.subject.value ==""){
		document.getElementById("subjectDiv").innerText ="제목을 입력해주세요.";
		document.guestbookWriteForm.subject.focus();
	} 
	else if(document.guestbookWriteForm.content.value ==""){
		document.getElementById("contentDiv").innerText ="내용을 입력해주세요.";
			document.guestbookWriteForm.content.focus();
	}
	else document.guestbookWriteForm.submit();
}
</script>
</body>
</html>