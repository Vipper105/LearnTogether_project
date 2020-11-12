package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.MyCoursesDao;
import tp.kits3.learntogether.user.dto.MyCourses;

@Service
public class MyCoursesService {
	
	@Autowired
	MyCoursesDao myCoursesDao;
	
	public List<MyCourses> getAll(int id){
		List<MyCourses> listMyCourses = myCoursesDao.findAllCourses(id);
		return listMyCourses;
	}

}
