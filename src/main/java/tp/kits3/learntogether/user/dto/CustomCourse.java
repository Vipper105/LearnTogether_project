package tp.kits3.learntogether.user.dto;

import java.util.List;

import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.Section;
import tp.kits3.learntogether.user.vo.Test;

public class CustomCourse {

	private Course course;
	private List<Section> sectionList;
	private List<Lesson> lessonList;
	private List<Test> testList;
	
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public List<Lesson> getLessonList() {
		return lessonList;
	}
	public void setLessonList(List<Lesson> lessonList) {
		this.lessonList = lessonList;
	}
	public List<Test> getTestList() {
		return testList;
	}
	public void setTestList(List<Test> testList) {
		this.testList = testList;
	}
}
