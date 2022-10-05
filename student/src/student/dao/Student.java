package student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Student {
	String name;
	String value;
	int code;
	Connection conn;
	PreparedStatement pstmt;

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
		while(true) {
			System.out.print("***************\n"
							 + "   관리\n"
							 + "***************\n"
							 + "  1. 입력\n"
							 + "  2. 검색\n"
							 + "  3. 삭제\n"
							 + "  4. 종료\n"
							 + "***************\n"
							 + "   번호선택 : ");
			int num=scan.nextInt();
			if(num==4) break;
			
		}
	}
	
	public void insertArticle() {
		while(true) {
			System.out.print("***************\n"
					 + "  1. 학생\n"
					 + "  2. 교수\n"
					 + "  3. 관리자\n"
					 + "  4. 이전메뉴\n"
					 + "***************\n"
					 + "   번호선택 : ");
			int num = scan.nextInt();
			if (num == 4)
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
			} else {
				System.out.println("다시 입력하세요. ");
				continue;
			}
			value= scan.next();
			
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
			}

		}
	}
	
	
	
	
	
	
	
	public static void main(String[] args) { // main
		Student student = new Student();
		student.menu();
		System.out.println("프로그램을 종료합니다.");
		
	}

}
