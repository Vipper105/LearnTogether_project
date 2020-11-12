package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.StatusUserAdminDao;
import tp.kits3.learntogether.admin.vo.StatusUser;


@Service
public class StatusUserAdminService {
	@Autowired 
	StatusUserAdminDao statusUserAdminDao;
	
	public List<StatusUser> findAll()
	{
		return statusUserAdminDao.findAll();
	}
	public StatusUser findOne(Integer id)
	{
		return statusUserAdminDao.findOne(id);
	}
	public boolean insert(StatusUser t)
	{
		statusUserAdminDao.add(t);
		return true;
	}
	public void update(StatusUser t)
	{
		statusUserAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		statusUserAdminDao.delete(t);
		
	}
}
