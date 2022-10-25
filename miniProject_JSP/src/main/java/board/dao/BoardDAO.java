package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	private static BoardDAO boardDAO = new BoardDAO();
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("member-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void write(Map<String, String> map) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.write",map);
		sqlSession.commit();
		sqlSession.close();
	}
	public List<BoardDTO> list(Map<String, Integer> map) {
		List<BoardDTO> list=null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		list = sqlSession.selectList("boardSQL.list",map);
		sqlSession.close();
		return list;
	}
	public int getTotal() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int a= sqlSession.selectOne("boardSQL.getPgs");
		sqlSession.close();
		return a;
	}
}
