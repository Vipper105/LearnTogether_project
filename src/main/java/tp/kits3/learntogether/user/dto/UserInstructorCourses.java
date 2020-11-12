package tp.kits3.learntogether.user.dto;

import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.Instructor;
import tp.kits3.learntogether.user.vo.User;

@Repository
public class UserInstructorCourses {
	
	private Course course;
	private User user;
	private Instructor instructor;

	public UserInstructorCourses() {
		super();
	}
	
	public UserInstructorCourses(Course course, User user, Instructor instructor) {
		super();
		this.course = course;
		this.user = user;
		this.instructor = instructor;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Instructor getInstructor() {
		return instructor;
	}

	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}

}
