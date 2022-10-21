package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;

	// 한번 만들어둔 메모리를 재활용하기 위해 스태틱으로 생성
	private static MemberDAO memberDAO = new MemberDAO();

	// 만들어 둔 싱글톤 인스턴스를 불러오는 메소드.
	public static MemberDAO getInstance() {
		return memberDAO;
	}

	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("member-config.xml");
			//추상. new 안됨. getResourceAsReader는 src폴더 기준. 
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			//
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	

	public int write(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int a=sqlSession.insert("memberSQL.write",memberDTO);
		sqlSession.commit(); // 자동커밋 안해줍니다.
		sqlSession.close();
		return a;
	}

	public String login(String id, String pwd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login",map);
		sqlSession.close();		
		if(memberDTO!=null) {
			return memberDTO.getName();
		}
		else {
			return null;
		}
	}
	
	public boolean check(String id) {
		boolean exist=false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		exist = sqlSession.selectOne("memberSQL.check",id);
		sqlSession.close();
		return exist;

	
	}
	
		
	

}
