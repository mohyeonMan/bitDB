package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, String> map= new HashMap<String, String>();
		HttpSession session = request.getSession();
		map.put("id", (String)session.getAttribute("memId"));
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		map.put("subject", request.getParameter("subject"));
		map.put("content", request.getParameter("content"));

		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.write(map);
		
		return "/board/boardWrite.jsp";
	}

}
