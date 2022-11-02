package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import member.bean.MemberDTO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String subject = request.getParameter("subject"); 
		String content = request.getParameter("content");
		MemberDTO memberDTO= (MemberDTO) session.getAttribute("member");
		String id = memberDTO.getId();
		String name = memberDTO.getName();
		String email = memberDTO.getEmail1()+"@"+memberDTO.getEmail2();
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId(id);
		boardDTO.setName(name);
		boardDTO.setEmail(email);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.write(boardDTO);
		
		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		System.out.println(subject);
		System.out.println(content);

		
		return "/board/boardWrite.jsp";
	}

}
