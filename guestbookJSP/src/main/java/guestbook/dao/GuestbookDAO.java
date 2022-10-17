package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import guestbook.bean.GuestbookDTO;


public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userName = "c##java";
	private String password = "bit";
	
	public static GuestbookDAO guestbookDAO= new GuestbookDAO();
	public static GuestbookDAO getInstance() {
		return guestbookDAO;
	}
	
	public GuestbookDAO() {
		try {
			Class.forName(driver); // driver load
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public void getConnection() { // DB와 연결
		try {
			conn = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int guestWrite(GuestbookDTO guestbookDTO) {
		int done =0;
		String sql="insert into guestbook values(seq_guestbook.NEXTVAL,?,?,?,?,?,sysdate)";
		getConnection();
		
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guestbookDTO.getName());
		pstmt.setString(2, guestbookDTO.getEmail());
		pstmt.setString(3, guestbookDTO.getHomepage());
		pstmt.setString(4, guestbookDTO.getSubject());
		pstmt.setString(5, guestbookDTO.getContent());
			done=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return done;
	}

	public void guestbookList(ArrayList<GuestbookDTO> list,Map<String,Integer> map) {
		ResultSet rs = null;
		String sql = "select * from (select rownum rn, tt.* from"
				+ " (select seq, name, email, homepage, subject, content, to_char(logtime,'YYYY.MM.DD') as logtime "
				+ "from guestbook order by seq desc) tt) "
				+ "where rn >=? and rn<=?";
			//--1. guestbook테이블을 변수 tt로 지정.
			//--2. hidden column rownum을 추출.
			//--3. rownum의 1~3번 select.
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, map.get("startNum"));
			pstmt.setInt(2, map.get("endNum"));
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO(
						rs.getInt("seq"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("homepage"),
						rs.getString("subject"),
						rs.getString("content"),
						rs.getString("logtime"));
				list.add(guestbookDTO);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		}finally { 
			try {
				if (rs !=null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public int getTotalA() {
		ResultSet rs=null;
		int totalA =0;
		String sql = "select count(*) as totalA from guestbook";
		//테이블의 모든 컬럼수 확인
		getConnection();
		
		try {
		pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totalA=rs.getInt("totalA");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { 
			try {
				if (rs !=null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return totalA;
	}
}
