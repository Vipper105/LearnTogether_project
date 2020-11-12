package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.LessonAdminDao;
import tp.kits3.learntogether.admin.vo.Lesson;


@Service
public class LessonAdminService {
	@Autowired 
	LessonAdminDao lessonAdminDao;
	
	public List<Lesson> findAll()
	{
		return lessonAdminDao.findAll();
	}
	public Lesson findOne(Integer id)
	{
		return lessonAdminDao.findOne(id);
	}
	public boolean insert(Lesson t)
	{
		lessonAdminDao.add(t);
		return true;
	}
	public void update(Lesson t)
	{
		lessonAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		lessonAdminDao.delete(t);
		
	}
	public List<Lesson> findBySessionId(Integer id) {
		return lessonAdminDao.findbySessionId(id);
	}
}
