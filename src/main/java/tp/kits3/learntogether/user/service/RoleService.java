package tp.kits3.learntogether.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.RoleDao;
import tp.kits3.learntogether.user.vo.Role;
/**
 * @author PhungDinhHuy
 *
 */
@Service
public class RoleService {

	@Autowired
	RoleDao roleDao;
	
	public Role getRoleByRoleName(String rolename) {
		return roleDao.findRoleByRoleName(rolename);
	}
	
	public Role getRoleByRoleID(int roleID) {
		return roleDao.findRoleByRoleID(roleID);
	}
	
	
}
