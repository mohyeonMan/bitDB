<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
	table{
	border : 1px solid black;
	border-collapse : collapse;
	}
form[name="updateForm"] div{
	color : red;
	font-size : 8pt;
	font-weight : bold;
	margin-left:10px;
	}
</style>
</head>
<body> 
	<h3>회원정보 수정</h3>
	<form name="updateForm" id="updateForm">
		<table border ="1" width="500" cellpadding="10">
			<tr>
				<td width="100" align="center">이름</td>
				<td>
					<input type="text" name="name" id="name" />
					<div id="nameDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">아이디</td>
				<td>
					<input type="text" name="id" id="id" readonly/>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd"/>
					<input type="hidden" id="checkPwd"/>
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">재확인</td>
				<td>
					<input type="password" id="repwd"/>
					<div id="repwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">성별</td>
				<td>
				<input type="radio" name="gender" id="male" value="0" />남
					<input type="radio" name="gender" id="female" value="1"/>여
				</td>
			</tr>
			<tr>
				<td width="100" align="center">핸드폰</td>
				<td>
					<select name="tel1" id="tel1">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="019">019</option>
					</select>
					-
					<input type="tel" id="tel2" name="tel2" maxlength="4" style="width:50px;"/>
					-
					<input type="tel" id="tel3" name="tel3" maxlength="4" style="width:50px;"/>
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="text" name="email1" id="email1"/> @ 
					<input type="text" name="email2" id="email2" list="email2"/>
					<datalist id=email2>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.com">daum.com</option>
					</datalist>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">주소</td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly style="margin-bottom:5px;"/>
					<input type="button" value="우편번호검색" onclick="checkPost()" /><br>
					<input type="text" id="addr1" name="addr1" readonly placeholder="주소" style="width:330px; margin-bottom:5px;"/><br>
					<input type="text" id="addr2" name="addr2" placeholder="상세주소" style="width:330px;"/>
					
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="updateBtn"/>
					<input type="reset" value="되돌리기">
				</td>
			</tr>
			
		</table>
	</form>
	
	<!-- <script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script> -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script><!-- CDN 방식. 다운로드X -->
	<script src="../js/member.js"></script>
	<!-- 우편 번호 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../js/post.js"></script>
	<script type="text/javascript">
	$(function(){
		 $.ajax({
			 url:'/miniProject_MVC/member/getMember.do',
			 type: 'post',
			 dataType: 'json',
			 success:function(data){
				 $('#name').val(data.name);
				 $('#id').val(data.id);
				 $('#pwd').val(data.pwd);
				 $('#checkPwd').val(data.pwd);
				 $('input[name="gender"]:eq('+data.gender+')').attr("checked", true);
				 if(data.tel1 == '010'){
					$('#tel1 option:eq(0)').attr('selected', 'selected');
				}else if(data.tel1 == '011'){
					$('#tel1 option:eq(1)').attr('selected', 'selected');
				}else if(data.tel1 == '019'){
					$('#tel1 option:eq(2)').attr('selected', 'selected');
				}
				 $('#tel2').val(data.tel2);
				 $('#tel3').val(data.tel3);
				 $('#email1').val(data.email1);
				 $('#email2').val(data.email2);
				 $('#zipcode').val(data.zipcode);
				 $('#addr1').val(data.addr1);
				 $('#addr2').val(data.addr2);
			 },
			 error:function(err){
				 console.log(err)
			 }
		 });
	});
	
	
/*	$(document).ready(function(){
		$('#name').attr('value', '${member.name}');
		
		var tel1 = '${member.tel1}';
		if(tel1 == '010'){
			$('#tel1 option:eq(0)').attr('selected', 'selected');
		}else if(tel1 == '011'){
			$('#tel1 option:eq(1)').attr('selected', 'selected');
		}else if(tel1 == '019'){
			$('#tel1 option:eq(2)').attr('selected', 'selected');
		}
		
		var gender= '${member.gender}';
		if(gender=='0'){
			$('#male').attr('checked','checked');
		}else{
			$('#female').attr('checked','checked');
		}
	});
*/
	</script>
</body>
</html>