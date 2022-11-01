package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("memName");
		request.setAttribute("memName", name);
		session.invalidate(); //모든 세션을 없애기.
		return "/member/logout.jsp";
	}

}
