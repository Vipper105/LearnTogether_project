package tp.kits3.learntogether.admin.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.admin.dao.CourseAdminDao;
import tp.kits3.learntogether.admin.vo.Course;

@Service
public class CourseAdminService {
	@Autowired CourseAdminDao courseddminDao;
	
	
	public List<Course> findAll()
	{
		return courseddminDao.findAll();
	}
	public List<Course> findApprove()
	{
		return courseddminDao.findApprove();
	}
	public List<HashMap<String,Object>> selectCategory()
	{
		return courseddminDao.selectCategory();
	}
	public Course findOne(Integer id)
	{
		return courseddminDao.findOne(id);
	}
	public boolean insert(Course t)
	{
		courseddminDao.add(t);
		return true;
	}
	public void update(Course t)
	{
		courseddminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		courseddminDao.delete(t);
		
	}
	public void approveCourse(Integer t)
	{
		courseddminDao.ApproveCourse(t);
	}
	public void noApproveCourse(Integer t)
	{
		courseddminDao.ApproveCourse(t);
	}
	
}
