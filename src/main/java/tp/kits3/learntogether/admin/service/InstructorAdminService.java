package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.InstructorAdminDao;
import tp.kits3.learntogether.admin.vo.Instructor;

@Service
public class InstructorAdminService {
	@Autowired InstructorAdminDao instructorAdminDao;
	
	
	public List<Instructor> findAll()
	{
		return instructorAdminDao.findAll();
	}
	public Instructor findOne(Integer id)
	{
		return instructorAdminDao.findOne(id);
	}
	public boolean insert(Instructor t)
	{
		instructorAdminDao.add(t);
		return true;
	}
	public void update(Instructor t)
	{
		instructorAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		instructorAdminDao.delete(t);
		
	}
}
