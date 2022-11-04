
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<input type="hidden" id="memId" value="${sessionScope.memId }">
<input type="hidden" id="seq" value="${seq }">
<input type="hidden" id="pg" value="${pg }">

<br>
<h2><span id="subjectSpan"></span></h2>
<br>
	<table id="boardViewTable" width="550" border="1" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<td width = "100px" align="center">글번호 : <span id="seqSpan"></span></td>
			<td width = "100px" align="center">작성자 : <span id="nameSpan"></span></td>
			<td width = "100px" align="center">조회수 : <span id="hitSpan"></span></td>
		</tr>  
		<tr>
			<td colspan="3" height="400px" valign="top">
			<div style="width:100%; height:100%; overflow:auto;">
				<pre style="white-space: pre-wrap; word-break:break-all;"><span id="contentSpan" style="overflow:auto;"></span></pre>
			</div>
			</td>
		</tr>
	</table>
	<br>
	<input type="button" value="목록" onclick="location.href='/miniProject_MVC/board/boardList.do?pg=${pg}'">
	<input type="hidden" class="loginCheck" onclick="location.href='/miniProject_MVC/board/boardUpdateForm.do?seq=${seq }&pg=${pg}'" value="글수정"/>
	<input type="hidden" class="loginCheck" id="boardDeleteBtn" value="글삭제"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
</body>
</html>