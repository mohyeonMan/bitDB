<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
body {
	margin-left: 200px;
	margin-top: 100px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

Div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
	margin-left: 10px;
}
</style>
</head>
<body>
	<h1>로그인</h1>
	<form name="loginForm">
		<table border="1" cellpadding="5">
			<tr>
				<td width="100" align="center">아이디</td>
				<td width="200"><input type="text" name="id" id="id"
					style="width: 150px;" />
					<div id="idDiv"></div>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"
					style="width: 200px;" />
					<div id="pwdDiv"></div></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div id="loginResult"></div>
					<input type="button" id="loginBtn" value="로그인" onclick="checkLogin()" />
					<input type="button" value="회원가입"	onClick="location.href='writeForm.do'" />
				</td>
			</tr>
		</table>

	</form>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		$('#loginBtn').click(function() {
			$('#idDiv').empty(); //$('#idDiv').text('');
			$('#pwdDiv').empty();

			if ($('#id').val() == '') {
				$('#idDiv').text('아이디를 입력하세요');
				$('#id').focus();
			} else if ($('#pwd').val() == '') {
				$('#pwdDiv').text('비밀번호를 입력하세요');
				$('#pwd').focus();
			} else {
				$.ajax({
					url : '/miniProject_MVC/member/login.do',
					type : 'post',
					data : 'id=' + $('#id').val() + '&pwd=' + $('#pwd').val(),
					//	json 형식
					//	data: { 'id':$('#id').val(), 'pwd':$('#pwd').val() }
					dataType : 'text',
					success : function(data) {
						data = data.trim();

						if (data == 'ok') {
							location.href='../index.jsp';
						} else if (data == 'fail') {
							$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다.');
							$('#loginResult').css('color','blue')
						}
					},
					error : function(err) {
						//alert(err)
						console.log(err); //콘솔창에 뜨게해라
					}
				})
			}
		});
	</script>
</body>
</html>