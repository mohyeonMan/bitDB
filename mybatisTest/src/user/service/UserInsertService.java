package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService {

	@Override
	public void execute() {
		UserDTO userDTO = new UserDTO();
		
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		userDTO.setName(scan.next());
		System.out.print("아이디 입력 : ");
		userDTO.setId(scan.next());
		System.out.print("비밀번호 입력 : ");
		userDTO.setPwd(scan.next());
		
		//DB
		UserDAO userDAO= UserDAO.getInstance();
		userDAO.write(userDTO);
		System.out.println("성공!");
		
		
	}

}
