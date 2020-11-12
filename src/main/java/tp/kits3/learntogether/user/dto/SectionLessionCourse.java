package tp.kits3.learntogether.user.dto;

import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.Section;


@Repository
public class SectionLessionCourse {

	private Section section;
	private Lesson lesson;
	
	public SectionLessionCourse() {
		super();
	}
	
	public SectionLessionCourse(Section section, Lesson lesson) {
		super();
		this.section = section;
		this.lesson = lesson;
	}
	
	public Section getSection() {
		return section;
	}
	
	public void setSection(Section section) {
		this.section = section;
	}
	
	public Lesson getLesson() {
		return lesson;
	}
	
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	
}
