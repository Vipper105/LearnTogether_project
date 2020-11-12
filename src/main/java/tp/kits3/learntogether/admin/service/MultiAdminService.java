package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.MultiAdminDao;
import tp.kits3.learntogether.admin.vo.MultiChoice;


@Service
public class MultiAdminService {
	@Autowired 
	MultiAdminDao MultiAdminDao;
	
	public List<MultiChoice> findAll()
	{
		return MultiAdminDao.findAll();
	}
	public MultiChoice findOne(Integer id)
	{
		return MultiAdminDao.findOne(id);
	}
	public List<MultiChoice> findByTestId(Integer id)
	{
		return MultiAdminDao.findbyTestId(id);
	}
	public boolean insert(MultiChoice t)
	{
		MultiAdminDao.add(t);
		return true;
	}
	public void update(MultiChoice t)
	{
		MultiAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		MultiAdminDao.delete(t);
		
	}
}
