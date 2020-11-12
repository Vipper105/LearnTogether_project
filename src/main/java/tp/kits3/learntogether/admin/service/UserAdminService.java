package tp.kits3.learntogether.admin.service;
/**
 * @author NguyenDoanNam
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.UserAdminDao;
import tp.kits3.learntogether.admin.vo.User;

@Service
public class UserAdminService {
	@Autowired
	UserAdminDao userAdminDao;
	
	public List<User> findAll()
	{
		return userAdminDao.findAll();
	}
	public User findOne(Integer id)
	{
		User user = userAdminDao.findOne(id);

		return user;
	}
	public Integer selectTotalClient()
	{
		return userAdminDao.selectTotalClient();
	}
	public Integer selectNewUser()
	{
		return userAdminDao.selectNewUser();
	}
	public boolean insert(User t)
	{
		userAdminDao.add(t);
		return true;
	}
	public void update(User t)
	{
		userAdminDao.update(t);
		
	}
	public void delete(Integer id)
	{
		userAdminDao.delete(id);
		
	}
}
