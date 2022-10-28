package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns = {"*.do"},
		initParams = { @WebInitParam(name="propertyConfig", value="command.properties") }
		
			)//참조할 항목 나열
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig= config.getInitParameter("propertyConfig"); //xml--> property파일 읽어옴
		System.out.println("propertyConfig = "+propertyConfig);
		// xml파일에서 주소를 나열한 것을 대체.
		String realFolder = config.getServletContext().getRealPath("/WEB-INF"); //WEB-INF의 경로를 탐색
		String realPath = realFolder + "/" + propertyConfig; 					//경로 합병
		System.out.println("realPath = " + realPath);
		
		FileInputStream fin = null;
		Properties properties = new Properties(); //아직 설명안하심.
		try {
			fin = new FileInputStream(realPath);
			
			properties.load(fin);
			System.out.println("properties = "+properties);
	
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println();
		
		Iterator it = properties.keySet().iterator();
		while(it.hasNext()) {
			String key = (String)it.next();
			System.out.println("key = "+key);
			
			String className = properties.getProperty(key);
			System.out.println("className = "+className);
			
			try {
				Class<?> classType = Class.forName(className);
				Object ob = classType.newInstance();
				
				System.out.println("ob = "+ob);
				
				map.put(key, ob);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} 
			
			System.out.println();
		}//while
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response); //execute로 메소드를 합병.
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response); //execute로 메소드를 합병.
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("POST"))//form태그에서 설정한 메소드를 불러오기.
			request.setCharacterEncoding("UTF-8"); //post는 한글처리가 안되니까.
		
		//요청이 들어왔을 때 - http://localhost:8080/mvcmember/member/writeForm.do
		String category = request.getServletPath(); //url의 context명 이후를 가져온다. command.properties에서 url을 가져오기 위해 변수화
		System.out.println("category = "+category); //member/writeForm.do
		
		CommandProcess com = (CommandProcess)map.get(category); //member.service.WriteFormService 
		String view = null; 
		
		try {
			view = com.requestPro(request, response); //"/member/writeForm.jsp"
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		//forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);//상대번지
		dispatcher.forward(request, response);//제어권 넘기기
	}
	
}
