package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.EssayAdminDao;
import tp.kits3.learntogether.admin.vo.Essay;


@Service
public class EssayAdminService {
	@Autowired 
	EssayAdminDao EssayAdminDao;
	
	public List<Essay> findAll()
	{
		return EssayAdminDao.findAll();
	}
	public Essay findOne(Integer id)
	{
		return EssayAdminDao.findOne(id);
	}
	public List<Essay> findByTestId(Integer id)
	{
		return EssayAdminDao.findbyTestId(id);
	}
	public boolean insert(Essay t)
	{
		EssayAdminDao.add(t);
		return true;
	}
	public void update(Essay t)
	{
		EssayAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		EssayAdminDao.delete(t);
		
	}
}
