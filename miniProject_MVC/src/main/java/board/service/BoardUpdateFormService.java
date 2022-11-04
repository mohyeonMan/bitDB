package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("seq",request.getParameter("seq"));
		request.setAttribute("pg",request.getParameter("pg"));
		
		request.setAttribute("display","/board/boardUpdateForm.jsp");
		return "/index.jsp";
	}

}
