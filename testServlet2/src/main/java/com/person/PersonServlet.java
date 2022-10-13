package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1. 데이터 받아오기
		String name= request.getParameter("name");
		String gender=request.getParameter("gender");
		String color=request.getParameter("color");
		String[] hobby= request.getParameterValues("hobby");
		String[] subject= request.getParameterValues("subject");
		
		if(gender.equals("0")) gender="남성";
		else gender="여성";
		//2. 응답.
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();

		out.println("<html>\n"
				+ "<head>\n"
				+ "<style>\n"
				+ "li{color:"+color+"}\n"
				+ "</style>\n"
				+ "</head>\n"
				+ "<body>\n"
				+ "<ul>\n"
				+ "<li>이름 : "+name+"</li><br>\n"
				+ "<li>성별 : "+gender+"</li><br>\n"
				+ "<li>색깔 : "+color+"</li><br>\n"
				+ "<li>취미 : \n");
		for (int i = 0; i < hobby.length; i++) {
			out.println(hobby[i]);
		}
		out.println("</li><br>");
		out.println("<li>과목 : ");
		for (int i = 0; i < subject.length; i++) {
			out.println(subject[i]);
		}

		out.println("</li><br>\n"
				+ "</ul>\n"
				+ "</body>\n"
				+ "</html>\n");
	}

}
