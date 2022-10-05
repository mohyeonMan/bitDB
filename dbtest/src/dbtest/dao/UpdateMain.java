package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain { 
	private Connection conn;
	private PreparedStatement pstmt;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userName = "c##java";
	private String password = "bit";

	public UpdateMain() { // 인스턴스 생성하며 driver 구동
		try {
			Class.forName(driver); //driver를 불러온다.
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public void getConnection() { //DB와 연결한다.
		try {
			conn = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateArticle() { //
		Scanner scan = new Scanner(System.in);
		System.out.print("수정할 이름을 입력하세요. : ");
		String name = scan.next();
		
		this.getConnection();
		String sql = "update dbtest set age=age+1 , height = height+1 where name like ?";

		try {
			pstmt = conn.prepareStatement(sql); // SQL 문법에 맞게 번역.
			pstmt.setString(1, "%" + name + "%"); // ?와 %는 같이 사용할수없다. 둘다 와일드카드 이기 때문.

			int num = pstmt.executeUpdate(); //실행한 횟수를 반환.
			System.out.println(num + "개의 행이 변경되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 반드시 닫아줘야한다. 
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
