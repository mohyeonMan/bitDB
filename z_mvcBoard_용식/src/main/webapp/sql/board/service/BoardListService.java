package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 한페이지의 게시물 수
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg*5;
		int startNum = endNum-4;

		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum",startNum);
		map.put("endNum",endNum);

		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.list(map);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//총 페이지수와 한번에 표시되는 페이지 수 
		int totalA=boardDAO.getTotal();

		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);

		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("memName");
		String id = (String)session.getAttribute("memId");

		
	      request.setAttribute("id", id);
	      request.setAttribute("list", list);
	      request.setAttribute("paging", boardPaging.getPagingHTML());
	      request.setAttribute("pg", pg);

		
		return "/board/boardList.jsp";
	}

}
