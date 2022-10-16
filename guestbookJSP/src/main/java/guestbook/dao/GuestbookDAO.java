package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import guestbook.bean.GuestbookDTO;


public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

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
	public void guestbookList() {
		String sql= "select*from guestbook order by 1";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
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

	}
}
