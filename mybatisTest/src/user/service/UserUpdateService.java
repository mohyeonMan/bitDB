package user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService{

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.print("\n수정 할 아이디 입력 : ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO=userDAO.getUser(id);
		
		System.out.println(userDTO); // toString override 해서 가져온다.
		
		if(userDTO == null) {
			System.out.println("찾는 아이디가 없습니다");
			return;
		}
		else {
			System.out.println(	userDTO.getName()+"\t"
							+	userDTO.getId()+"\t"
							+	userDTO.getPwd()+"\t\n");
			System.out.print("수정 할 이름 입력 : ");
			String name = scan.next();
			System.out.print("수정 할 비밀번호 입력 : ");
			String pwd = scan.next();
			
			Map<String, String> map = new HashMap<String,String>();
			map.put("name",name);
			map.put("id", id);
			map.put("pwd", pwd);
			int su =userDAO.update(map);
			
		}
	}
}

