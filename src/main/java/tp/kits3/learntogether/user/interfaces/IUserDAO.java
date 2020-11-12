package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import tp.kits3.learntogether.user.vo.User;

public interface IUserDAO<T extends User> extends IService<T>{

	User findOneUserByUsername(String username);
	
	User findOneUserByEmail(String email);
	
	void addRegister(User user);
	
	void updatePassword(User t);
	
	int getUserByInstructorID(int instructorID);
}

