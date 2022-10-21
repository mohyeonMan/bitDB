package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	
	private static UserDAO userDAO = new UserDAO();	
	public static UserDAO getInstance() {
		return userDAO;
	}

	public UserDAO() {
	 //환경설정파일(mybatis.config.xml) 읽어오기.
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			//추상. new 안됨. getResourceAsReader는 src폴더 기준. 
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			//
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("userSQL.write",userDTO);
		sqlSession.commit(); // 자동커밋 안해줍니다.
		sqlSession.close();
		//MAPER
	}
	public List<UserDTO> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getList");
		//1줄 가져올땐 selectOne
		sqlSession.close();
		return list;
	}
	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO= sqlSession.selectOne("userSQL.getUser",id);
		sqlSession.close();
		return userDTO;
	}

	public int update(Map<String, String> map) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt=sqlSession.update("userSQL.update",map); // executeUpdate()처럼 정수 반환.
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}

	public void delete(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete",userDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<UserDTO> search(Map<String, String> map) {	
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.search",map);
		sqlSession.close();
		return list;
	}
}
