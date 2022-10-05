package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {
	private Connection conn;
	private PreparedStatement pstmt;

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userName = "c##java";
	private String password = "bit";

	public InsertMain() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // driver load
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

	public void insertArticle() {
		Scanner scan = new Scanner(System.in);
		System.out.print("이름을 입력하세요. : ");
		String name = scan.next();
		System.out.print("나이를 입력하세요. : ");
		int age = scan.nextInt();
		System.out.print("키를 입력하세요. : ");
		double height = scan.nextDouble();

		this.getConnection();

		try {
			pstmt = conn.prepareStatement("insert into dbtest values(?,?,?,sysdate)"); // 데이터가 들어갈자리에 물음표로 치환.
			pstmt.setString(1, name); // 들어갈 값들을 치환해서 밖으로 빼준다.
			pstmt.setInt(2, age);
			pstmt.setDouble(3, height);

			int num = pstmt.executeUpdate(); // 실행 - 갯수 리턴.
			System.out.println(num + "개의 행이 삽입되었습니다."); // 커밋이 자동으로 일어난다.
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
	}

	public static void main(String[] args) {

		InsertMain insertMain = new InsertMain();

		insertMain.insertArticle();

	}
}
