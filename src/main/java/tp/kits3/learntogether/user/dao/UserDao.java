package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IUserDAO;
import tp.kits3.learntogether.user.vo.User;

@Repository
public class UserDao implements IUserDAO<User> {

	@Autowired
	private SqlSession session;

	@Override
	public void add(User t) {
		session.insert("mappers.userMapper.insert", t);
	}

	public void addRegister(User t) {
		session.insert("mappers.userMapper.insertRegister", t);
	}

	public void updatePassword(User t) {
		session.update("mappers.userMapper.updatePassword", t);
	}

	@Override
	public void delete(int id) {
		session.delete("mappers.userMapper.delete", id);
	}

	@Override
	public List<User> findAll() {
		List<User> listUser = session.selectList("mappers.userMapper.selectAll");
		return listUser;
	}

	@Override
	public User findOne(int id) {
		User user = session.selectOne("mappers.userMapper.selectOne", id);
		return user;
	}

	@Override
	public User findOneUserByUsername(String username) {
		User user = session.selectOne("mappers.userMapper.findOneUserByUsername", username);
		return user;
	}

	@Override
	public User findOneUserByEmail(String email) {
		User user = session.selectOne("mappers.userMapper.findOneUserByEmail", email);
		return user;
	}

	/**
	 * @author Cong
	 *
	 */
	public void updateProfile(User t) {
		session.update("mappers.userMapper.update", t);
	}

	@Override
	public int getUserByInstructorID(int instructorID) {
		return session.selectOne("mappers.userMapper.getUserByInstructorID", instructorID);
	}

	/**
	 * @author Vo Duc Hoa
	 *
	 */

	@Override
	public void update(User t) {
//		System.out.println("---: "+ t.getAmount());
		session.update("mappers.userMapper.update", t);
	}

	public User findUserByResetToken(String resetToken) {
		return session.selectOne("mappers.userMapper.findByResetToken", resetToken);
	}

}
