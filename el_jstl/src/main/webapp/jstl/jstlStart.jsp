<%@page import="com.jstl.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<String> list = new ArrayList<String>();
list.add("가");
list.add("나");
list.add("다");
list.add("라");
list.add("마");
list.add("바");
list.add("사");

List<PersonDTO> list2 = new ArrayList<PersonDTO>();
PersonDTO aa= new PersonDTO("박지훈",28);
PersonDTO bb= new PersonDTO("원숭이",28);
PersonDTO cc= new PersonDTO("바봉",28);
list2.add(aa);
list2.add(bb);
list2.add(cc);

request.setAttribute("list", list);
request.setAttribute("list2", list2); 


/* response.sendRedirect("jstlEnd.jsp"); */
RequestDispatcher dispatcher = request.getRequestDispatcher("jstlEnd.jsp");
dispatcher.forward(request, response);
%>


<%-- <jsp:forward page="jstlEnd.jsp"></jsp:forward> --%>