package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService{

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		int num;
		UserDAO userDAO = UserDAO.getInstance();
		String from;
			System.out.print("***************\n"
							+ "1. 이름으로 검색\n"
							+ "2. 아이디로 검색\n"
							+ "***************\n"
							+ "   번호입력 : ");
			num=scan.nextInt();
			
			List<UserDTO> list=null;
			
			if(num==1) {
				System.out.println("찾고자 하는 이름 입력 : ");
				String name=scan.next();
				list =userDAO.search(name);
					
			}
			else if (num==2) {
				from="id";
				System.out.println("찾고자 하는 아이디 입력 : ");
				String id =scan.next();
				list =userDAO.search(id);
			}
			
			for(UserDTO userDTO : list) {
				System.out.println(	userDTO.getName()+"\t"
								+	userDTO.getId()+"\t"
								+	userDTO.getPwd()+"\t");
			}
	}

}


/* 
* 1. 이름검색
* 2. 아이디 검색
* 번호 선택 :1
* 
* 1번선택시 						2번선택시
* 찾고자 하는 이름 입력 : 동 			찾고자 하는 아이디 입력 :n
* 홍길동	hong	111				홍길동	hong	111
* 희동이	baby	111				코난		conan	111
*
*
*=> userDAO.search() 메소드 1개.
*=> userMapper.xml에서 <select id="search"태그 하나로 해결. #{} 안에 %를 넣을수 없음. 검색하기.
*=> #{} 안에 %를 넣을수 없음. 검색하기.
*/