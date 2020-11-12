package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.StatusAdminDao;
import tp.kits3.learntogether.admin.vo.Status;


@Service
public class StatusAdminService {
	@Autowired 
	StatusAdminDao statusAdminDao;
	
	public List<Status> findAll()
	{
		return statusAdminDao.findAll();
	}
	public Status findOne(Integer id)
	{
		return statusAdminDao.findOne(id);
	}
	public boolean insert(Status t)
	{
		statusAdminDao.add(t);
		return true;
	}
	public void update(Status t)
	{
		statusAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		statusAdminDao.delete(t);
		
	}
	public List<Status> getStatusList() {
		List<Status> StatusList = statusAdminDao.findAll();
		return StatusList;
	}
}
