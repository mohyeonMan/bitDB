package student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.xml.transform.Result;

public class Student {
	private String name;
	private String value;
	private int code;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userName = "c##java";
	private String password = "bit";
	Scanner scan = new Scanner(System.in);

	public Student() {
		try {
			Class.forName(driver); // driver load
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void menu() {
		while (true) {
			System.out.print("***************\n" + "   관리\n" + "***************\n" + "  1. 입력\n" + "  2. 검색\n"
					+ "  3. 삭제\n" + "  4. 종료\n" + "***************\n" + "   번호선택 : ");
			int num = scan.nextInt();
			if (num > 4) {
				System.out.println("\n다시 입력하세요.\n");
				continue;
			}
			if (num == 4)
				break;

			else if (num == 1)
				insertArticle();
			else if (num == 2)
				selectArticle();
			else if (num == 3)
				deleteArticle();

		}
	}
	
	public void insertArticle() {
		int num;
		while(true) {
			System.out.print("***************\n"
					 + "  1. 학생\n"
					 + "  2. 교수\n"
					 + "  3. 관리자\n"
					 + "  4. 이전메뉴\n"
					 + "***************\n"
					 + "   번호선택 : ");
			num = scan.nextInt();
			if (num > 4) {
				System.out.println("\n다시 입력하세요.\n");
				continue;
			} else if (num == 4)
				break;
			System.out.print("이름입력 : ");
			name = scan.next();
			if (num == 1) {
				code = 1;
				System.out.print("학번 입력 : ");
			} else if (num == 2) {
				code = 2;
				System.out.print("과목 입력 : ");
			} else if (num == 3) {
				code = 3;
				System.out.print("부서 입력 : ");
			} else if (num == 4)
				break;

			value = scan.next();

			getConnection();

			String sql = "insert into student values(?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, value);
				pstmt.setInt(3, code);
				pstmt.executeUpdate();
				System.out.println("\n입력 완료되었습니다.\n");
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
	}

	public void selectArticle() {
		int num;
		String sql = null;
		while (true) {
			System.out.print("***************\n"
					 + "  1. 이름검색\n"
					 + "  2. 전체검색\n"
					 + "  3. 이전메뉴\n"
					 + "***************\n"
					 + "   번호선택 : ");
			num = scan.nextInt();

			getConnection();
			if (num == 1) {
				System.out.print("검색할 이름 입력 : ");
				name = scan.next();
				sql = "select*from student where name like ?";
			} else if (num == 2) {
				sql = "select*from student";
			} else if (num == 3)
				break;
			else {
				System.out.println("\n다시 입력하세요.\n");
				continue;
			}
			System.out.println();
			try {
				pstmt = conn.prepareStatement(sql);
				if (num == 1)
					pstmt.setString(1, "%" + name + "%");
				rs = pstmt.executeQuery(); // ResultSet 에 담아온다.

				while (rs.next()) {
					System.out.print("이름 : " + rs.getString("name") + "\t");
					switch (rs.getInt("code")) {
					case 1:
						System.out.print("학번 : ");
						break;
					case 2:
						System.out.print("과목 : ");
						break;
					case 3:
						System.out.print("부서 : ");
						break;
					}
					System.out.println(rs.getString("value"));
				}
				System.out.println();


			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
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

	public void deleteArticle() {
		System.out.println();
		System.out.print("삭제할 이름 입력 : ");
		name = scan.next();

		getConnection();

		String sql = "delete student where name = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);

			int su = pstmt.executeUpdate();

			System.out.println(su + "개의 행 이(가) 삭제되었습니다.");

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

	public static void main(String[] args) { // main
		Student student = new Student();
		student.menu();
		System.out.println("프로그램을 종료합니다.");
	}

}
