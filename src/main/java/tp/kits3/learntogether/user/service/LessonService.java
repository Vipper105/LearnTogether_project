package tp.kits3.learntogether.user.service;
/**
* 	@author: Diep Nguyen
*/

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.LessonDao;
import tp.kits3.learntogether.user.vo.Lesson;

@Service
public class LessonService {

	@Autowired
	private LessonDao dao;
	
	public boolean addLesson(Lesson lesson) {
		dao.add(lesson);
		if(lesson.getId().intValue() > 0) {
			return true;
		}
		return false;
	}
	
	public Lesson getLessonByID(int lessonID) {
		return dao.findOne(lessonID);
	}
	
	public List<Lesson> getLessonsBySectionID(int sectionID) {
		List<Lesson> lessonListBySectionID = dao.getLessonsBySectionID(sectionID);
		return lessonListBySectionID;
	}
	
	public void update(Lesson lesson) {
		dao.update(lesson);
	}
	
	public int calculateTotalVideoDurationByCourseID(int courseID) {
		return dao.calculateTotalVideoDurationByCourseID(courseID);
	}

	public void deleteLessonByID(int lessonID) {
		dao.delete(lessonID);
	}
}
