package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.SectionAdminDao;
import tp.kits3.learntogether.admin.vo.Section;


@Service
public class SectionAdminService {
	@Autowired 
	SectionAdminDao sectionAdminDao;
	
	public List<Section> findAll()
	{
		return sectionAdminDao.findAll();
	}
	public Section findOne(Integer id)
	{
		return sectionAdminDao.findOne(id);
	}
	public List<Section> findByCourseId(Integer courseId)
	{
		return sectionAdminDao.findByCourseId(courseId);
	}
	public boolean insert(Section t)
	{
		sectionAdminDao.add(t);
		return true;
	}
	public void update(Section t)
	{
		sectionAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		sectionAdminDao.delete(t);
		
	}

}
