package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.CourseLeverAdminDao;
import tp.kits3.learntogether.admin.vo.CourseLevel;


@Service
public class CourseLevelAdminService {
	@Autowired 
	CourseLeverAdminDao courseLeverAdminDao;
	
	public List<CourseLevel> findAll()
	{
		return courseLeverAdminDao.findAll();
	}
	public CourseLevel findOne(Integer id)
	{
		return courseLeverAdminDao.findOne(id);
	}
	public boolean insert(CourseLevel t)
	{
		courseLeverAdminDao.add(t);
		return true;
	}
	public void update(CourseLevel t)
	{
		courseLeverAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		courseLeverAdminDao.delete(t);
		
	}
}
