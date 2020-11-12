package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.CourseOrderAdminDao;
import tp.kits3.learntogether.admin.vo.CourseOrder;


@Service
public class CourseOrderAdminService {
	@Autowired 
	CourseOrderAdminDao courseOrderAdminDao;
	
	public List<CourseOrder> findAll()
	{
		return courseOrderAdminDao.findAll();
	}
	public CourseOrder findOne(Integer id)
	{
		return courseOrderAdminDao.findOne(id);
	}
	public boolean insert(CourseOrder t)
	{
		courseOrderAdminDao.add(t);
		return true;
	}
	public void update(CourseOrder t)
	{
		courseOrderAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		courseOrderAdminDao.delete(t);
		
	}
}
