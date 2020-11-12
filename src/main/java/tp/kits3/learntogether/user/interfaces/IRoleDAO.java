package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import tp.kits3.learntogether.user.vo.Role;


public interface IRoleDAO<T extends Role> extends IService<T>{

	Role findRoleByRoleName(String rolename);
	
	Role findRoleByRoleID(int roleID);
	
}

