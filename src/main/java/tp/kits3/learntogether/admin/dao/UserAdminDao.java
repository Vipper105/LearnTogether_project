package tp.kits3.learntogether.admin.dao;

/**
 * @author NguyenDoanNam
 */
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.User;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class UserAdminDao implements IService<User> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(User t) {
		session.insert("mapperAdmin.userMapper.insert", t);
	}

	@Override
	public void update(User t) {
		session.update("mapperAdmin.userMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.userMapper.deleteById", id);
	}

	@Override
	public List<User> findAll() {
		List<User> list = session.selectList("mapperAdmin.userMapper.selectAll");
		return list;
	}

	@Override
	public User findOne(int id) {
		User user = session.selectOne("mapperAdmin.userMapper.selectbyId", id);
		return user;
	}
	
	public Integer selectTotalClient() {
		return session.selectOne("mapperAdmin.userMapper.selectTotalClient");
	}
	public Integer selectNewUser() {
		return session.selectOne("mapperAdmin.userMapper.selectNewUser");
	}

}
