<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
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
					<input type="text" name="name" id="name" value="${member.name }"/>
					<div id="nameDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">아이디</td>
				<td>
					<input type="text" name="id" id="id" value="${member.id }" readonly/>
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd"/>
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
				
				<c:if test="${member.gender =='1' }">
				<input type="radio" name="gender"  value="0" />남
					<input type="radio" name="gender"  value="1" checked/>여
				</c:if>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">핸드폰</td>
				<td>
				<c:if test="${member.tel1 == '011'}">
					<select name="tel1">
					<option value="010">010</option>
					<option value="011" selected>011</option>
					<option value="019">019</option>
					</select>
				</c:if>
				<c:if test="${member.tel1 == '019'}">
					<select name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019" selected>019</option>
					</select>
				</c:if>
					-
					<input type="tel" name="tel2" maxlength="4" style="width:50px;" value="${member.tel2 }"/>
					-
					<input type="tel" name="tel3" maxlength="4" style="width:50px;" value="${member.tel3 }"/>
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="text" name="email1" value="${member.email1 }"/> @ 
					<input type="text" name="email2" list="email2" value="${member.email2 }"/>
					<datalist id=email2>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.com">daum.com</option>
					</datalist>
					
<!-- 					<select id="email3" name="email3" onchange="change()">
						<option value="">직접입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.com">daum.com</option>
					</select> -->
				</td>
			</tr>
			<tr>
				<td width="100" align="center">주소</td>
				<td>
					<input type="text" name="zipcode" id="zipcode" value="${member.zipcode }"readonly style="margin-bottom:5px;"/>
					<input type="button" value="우편번호검색" onclick="checkPost()" /><br>
					<input type="text" id="addr1" name="addr1" value="${member.addr1 }" readonly placeholder="주소" style="width:330px; margin-bottom:5px;"/><br>
					<input type="text" id="addr2" name="addr2" value="${member.addr2 }" placeholder="상세주소" style="width:330px;"/>
					
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

</body>
</html>