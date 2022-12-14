package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ParamServlet") // xml에 기록하는 대신 어노테이션으로 처리할 수 있다.. 한번에 확인하긴 좋지않다.
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 데이터 : http://localhost:8080/testServlet/ParamServlet?name=%EB%B0%95%EC%A7%80%ED%9B%88&age=28
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));

		// 응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("Hello Servlet <br>");
		out.println(name + "님의 나이는 " + age + "살 이므로");
		if (age >= 19)
			out.print("성인입니다.");
		else
			out.print("청소년 입니다.");
		out.println("</body>");
		out.println("</html>");

	}

	@Override
	public void destroy() {
	}
}
