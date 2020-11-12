package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.CourseLevelDao;
import tp.kits3.learntogether.user.vo.CourseLevel;

@Service
public class CourseLevelService {

	 @Autowired
		private CourseLevelDao dao;
		
		public List<CourseLevel> getCourseLevelList() {
			List<CourseLevel> courseLevelList = dao.findAll();
			return courseLevelList;
		}
}
