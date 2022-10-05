package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {
	private Connection conn;
	private PreparedStatement pstmt;

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userName = "c##java";
	private String password = "bit";


	public UpdateMain() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("driver loading success");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, userName, password);
			System.out.println("connection success");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateArticle() {
		this.getConnection();
		Scanner scan = new Scanner(System.in);
		System.out.print("수정할 이름을 입력하세요. : ");
		String name = scan.next();

		try {
			pstmt = conn.prepareStatement("update dbtest set age=age+1 , height = height+1 where name like ?");
			pstmt.setString(1,"%"+name+"%");

			int num = pstmt.executeUpdate();
			System.out.println(num + "개의 행이 변경되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		UpdateMain updateMain = new UpdateMain();

		updateMain.updateArticle();
	}

}
