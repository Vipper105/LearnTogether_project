package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Role;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class RoleAdminDao implements IService<Role> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Role t) {
		session.insert("mapperAdmin.roleMapper.insert", t);
	}

	@Override
	public void update(Role t) {
		session.update("mapperAdmin.roleMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.roleMapper.deleteById", id);
	}

	@Override
	public List<Role> findAll() {
		List<Role> list = session.selectList("mapperAdmin.roleMapper.selectAll");
		return list;
	}

	@Override
	public Role findOne(int id) {
		Role role = session.selectOne("mapperAdmin.roleMapper.selectbyId", id);
		return role;
	}

}
