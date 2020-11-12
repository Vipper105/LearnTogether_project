package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IRoleDAO;
import tp.kits3.learntogether.user.vo.Role;

@Repository
public class RoleDao implements IRoleDAO<Role>{

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Role t) {
		
	}

	@Override
	public void update(Role t) {
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<Role> findAll() {
		return null;
	}

	@Override
	public Role findOne(int id) {
		return null;
	}

	@Override
	public Role findRoleByRoleName(String rolename) { 
		Role role = session.selectOne("mappers.roleMapper.selectOneByRoleName", rolename);
		return role;
	}
	
	@Override
	public Role findRoleByRoleID(int roleID) {
		Role role = session.selectOne("mappers.roleMapper.selectOneByRoleID", roleID);
		return role;
	}
	
}
