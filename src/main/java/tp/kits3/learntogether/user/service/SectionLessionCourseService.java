package tp.kits3.learntogether.user.service;

import java.util.ArrayList;

/**
 * @author pho
 */

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.CoursesDao;
import tp.kits3.learntogether.user.dao.LessonDao;
import tp.kits3.learntogether.user.dao.SectionDao;
import tp.kits3.learntogether.user.dto.SectionLessionCourse;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.Section;

@Service
public class SectionLessionCourseService {
	@Autowired private CoursesDao courdao;
	@Autowired private SectionDao secdao;
	@Autowired private LessonDao lesdao;
	
	
	public List<SectionLessionCourse> getDataSecLesCour(int id) {
		List<Section> listsection = secdao.getSectionByCourseID(id);
		List<SectionLessionCourse> sllist= new ArrayList<SectionLessionCourse>();
		// get section and lesson of course
		for (int i = 0; i < listsection.size(); i++) {
			SectionLessionCourse sl = new SectionLessionCourse();
			sl.setSection(listsection.get(i));
			for (int j = 0; j < lesdao.getLessonsBySectionID(listsection.get(i).getId()).size(); j++) {
				Lesson lesson = (Lesson)lesdao.getLessonsBySectionID( listsection.get(i).getId()).get(j);
				sl.setLesson(lesson);
			}
			sllist.add(sl);
		}
		return sllist;
	}
	
	public int getSumCourWithInstructor(int id) {
		List<Course> list = courdao.findInstructor(id);
		return list.size();
	}
}
