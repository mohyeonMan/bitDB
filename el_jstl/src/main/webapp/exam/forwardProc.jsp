<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("apple", "사과");

//페이지 이동
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp"); //상대주소 파일과 데이터를 합병.
dispatcher.forward(request,response);// 제어권 넘겨주기
%>
<%-- <jsp:forward page="forwardResult.jsp" /> 구닥다리--%>