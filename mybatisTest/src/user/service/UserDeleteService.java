package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.print("\n삭제 할 아이디 입력 : ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO=userDAO.getUser(id);
		
		System.out.println(userDTO);
		
		if(userDTO == null) {
			System.out.println("삭제할 아이디가 없습니다");
			return;
		}else {
			System.out.println(	userDTO.getName()+"\t"
					+	userDTO.getId()+"\t"
					+	userDTO.getPwd()+"\t\n");
			userDAO.delete(userDTO);
			System.out.println("\n삭제되었습니다.");
		}
	}
}
