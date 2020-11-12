package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.RoleAdminDao;
import tp.kits3.learntogether.admin.vo.Role;


@Service
public class RoleAdminService {
	@Autowired 
	RoleAdminDao roleAdminDao;
	
	public List<Role> findAll()
	{
		return roleAdminDao.findAll();
	}
	public Role findOne(Integer id)
	{
		return roleAdminDao.findOne(id);
	}
	public boolean insert(Role t)
	{
		roleAdminDao.add(t);
		return true;
	}
	public void update(Role t)
	{
		roleAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		roleAdminDao.delete(t);
		
	}
}
