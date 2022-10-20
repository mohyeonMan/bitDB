package user.service;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService implements UserService{

	@Override
	public void execute() {
		System.out.println();
		
	//DB	
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list= userDAO.getList(); //getList메소드를 통해 마이바티스를 거쳐서 List인터페이스의 형태로 반환.
	
	//response.
		for(UserDTO userDTO : list) {
			System.out.println(	userDTO.getName()+"\t"
							+	userDTO.getId()+"\t"
							+	userDTO.getPwd()+"\t");
		}
		System.out.println();
	}

}
