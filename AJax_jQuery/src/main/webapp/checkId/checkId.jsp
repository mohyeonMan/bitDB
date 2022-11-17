<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> <%-- XML파일 태그 시작전의 공백문자 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
DB연동 - 아이디가 "park"이면 이미있는 아이디. true 반환.
--%>

<c:set var="result" value="false"/>
<c:if test="${param.user_id == 'park' }">
	<c:set var="result" value="true"/>
</c:if>

<?xml version="1.0" encoding="UTF-8"?>
<check_id>
	<result>${result }</result>
</check_id>