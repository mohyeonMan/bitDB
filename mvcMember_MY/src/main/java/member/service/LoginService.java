package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(
				request.getParameter("id"),request.getParameter("pwd"));
		
		if (memberDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memName", memberDTO.getName()); // memName 세션에 name 추가. 30분 유지.
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());
		return "/member/loginOk.do";
		}else {
			return "/member/loginFail.do";
		}
	}
}
