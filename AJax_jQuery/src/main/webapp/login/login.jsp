<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> <%-- XML파일 태그 시작전의 공백문자 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- DB연동- 아이디가 "park", 비밀번호 "123" 이면 로그인 성공으로 취급 --%>
<c:set var="result" value="true"/>
<c:set var="message" value="박지훈님 로그인."/>

<c:if test="${param.user_id != 'park'}">
	<c:set var="result" value="false"/>
	<c:set var="message" value="가입되지 않은 아이디입니다."/>
</c:if>
<c:if test="${param.user_password != '123'}">
	<c:set var="result" value="false"/>
	<c:set var="message" value="비밀번호가 다릅니다."/>
</c:if>
	
<?xml version="1.0" encoding="UTF-8"?>
<login>
	<result>${result}</result>
	<message>${message}</message>
</login>