package user.dao;

import java.io.IOException;
import java.io.Reader;

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
		sqlSession.insert("userSql.write",userDTO);
		sqlSession.commit(); // 자동커밋 안해줍니다.
		sqlSession.close();
		//MAPER
	}
}
