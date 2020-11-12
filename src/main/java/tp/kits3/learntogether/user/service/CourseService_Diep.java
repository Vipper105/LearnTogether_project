package tp.kits3.learntogether.user.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.CourseLevelDao;
import tp.kits3.learntogether.user.dao.CoursesDao;
import tp.kits3.learntogether.user.dao.LessonDao;
import tp.kits3.learntogether.user.dao.SectionDao;
import tp.kits3.learntogether.user.dao.UserDao;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.Section;

@Service
public class CourseService_Diep {

	@Autowired
	private CoursesDao courseDao;

	@Autowired
	private SectionDao sectionDao;

	@Autowired
	private LessonDao lessonDao;

	@Autowired
	private CourseLevelDao courseLevelDao;

	@Autowired
	private SectionService sectionService;

	@Autowired
	private LessonService lessonService;
	
	@Autowired
	private UserDao userDao;

	public boolean addCourse(Course course) {
		courseDao.add(course);
		if (course.getId().intValue() > 0) {
			return true;
		}
		return false;
	}

	public List<Course> getDraftCoursesByInstructorID(int instructorID) {
		List<Course> draftList = courseDao.getDraftCoursesByInstructorID(instructorID);
		Collections.sort(draftList, Collections.reverseOrder());
		return draftList;
	}

	public Course getCourseByID(int courseID) {
		Course course = courseDao.findOne(courseID);
		List<Section> sectionList = sectionDao.getSectionByCourseID(courseID);
		course.setListSection(sectionList);

		List<Lesson> lessonListByCourseID = new ArrayList<>();
		for (Section currentSection : sectionList) {
			List<Lesson> lessonListBySectionID = lessonDao.getLessonsBySectionID(currentSection.getId());
			for (Lesson currentLesson : lessonListBySectionID) {
				if (course.isLessonNoVideo() == false && currentLesson.getUrlVid() == null) {
					course.setLessonNoVideo(true);
				}
				lessonListByCourseID.add(currentLesson);
			}
		}
		course.setLessonList(lessonListByCourseID);
		return course;
	}

	public Course getCourseInfosByCourseID(int courseID) {

		Course course = courseDao.findOne(courseID);
		course.setListSection(sectionDao.getSectionByCourseID(courseID));
		course.setSectionLessonMap(sectionService.getAllSectionLessonByCourseID(courseID));
		course.setSectionTestMap(sectionService.getAllSectionTestByCourseID(courseID));
		int userID = userDao.getUserByInstructorID(course.getInstructorId());
		course.setUser(userDao.findOne(userID));
		if (course.getCourseLevelId() != null) {
			course.setCourseLevel(courseLevelDao.findOne(course.getCourseLevelId()));
		}
		return course;
	}

	public void updateSelectedCourse(Course selectedCourse) {
		courseDao.update(selectedCourse);
	}

	public void deleteCourseByID(int courseID) {
		List<Section> sectionListByCourseID = sectionService.getSectionByCourseID(courseID);
		for (Section currentSection : sectionListByCourseID) {
			List<Lesson> lessonList = lessonService.getLessonsBySectionID(currentSection.getId());
			for(Lesson currentLesson : lessonList) {
				lessonService.deleteLessonByID(currentLesson.getId());
			}
			sectionService.deleteSectionByID(currentSection.getId());
		}
		courseDao.delete(courseID);
	}
}
