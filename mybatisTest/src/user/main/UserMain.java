package user.main;

import java.util.Scanner;

import user.service.UserDeleteService;
import user.service.UserInsertService;
import user.service.UserSearchService;
import user.service.UserSelectService;
import user.service.UserService;
import user.service.UserUpdateService;

public class UserMain {
	public static void main(String[] args) {
		UserMain userMain = new UserMain();
		userMain.menu();
		System.out.println("\n프로그램 종료.");
		
	}
	
	public void menu() {
		Scanner sc = new Scanner(System.in);
		int num;
		UserService userService=null;
				
		while(true) {
			System.out.print("***************\n"
							+ "  1. 입력\n"
							+ "  2. 출력\n"
							+ "  3. 수정\n"
							+ "  4. 삭제\n"
							+ "  5. 검색\n"
							+ "  6. 종료\n"
							+ "***************\n"
							+ "   번호입력 : ");
			num=sc.nextInt();
			if(num==6)break;
			
			if(num==1) userService = new UserInsertService();
			else if (num==2) userService = new UserSelectService();
			else if (num==3) userService = new UserUpdateService();
			else if (num==4) userService = new UserDeleteService();
			else if (num==5) userService = new UserSearchService();
			
			userService.execute();
		}
	}

}
