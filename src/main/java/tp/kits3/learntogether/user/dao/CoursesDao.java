package tp.kits3.learntogether.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.user.interfaces.ICourses;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.Section;

@Repository
public class CoursesDao implements ICourses<Course> {
	
	@Autowired
	private SqlSession session;
	
	@Options(useGeneratedKeys=true)
	@Override
	public void add(Course t) {
		session.insert("mappers.courseMapper.insert",t);
	}

	@Override
	public void update(Course t) {
		session.update("mappers.courseMapper.update",t);
	}

	@Override
	public void delete(int id) {
		session.delete("mappers.courseMapper.delete", id);
	}

	@Override
	public List<Course> findAll() {
		List<Course> list = session.selectList("mappers.courseMapper.selectAll");
		return list;
	}

	@Override
	public Course findOne(int id) {
		return session.selectOne("mappers.courseMapper.selectOne", id);
	}
	

	public List<Course> findOneCourCate(int id) {
		List<Course> course = session.selectList("mappers.courseMapper.selectOneCate", id);
		return course;
	}
	

	public List<Course> findBySearch(String txt) {
		List<Course> list = session.selectList("mappers.courseMapper.selectBySearch", txt);
		return list;
	}

	@Override
	public List<Course> getDraftCoursesByInstructorID(int instructorID) {
		List<Course> draftList = session.selectList("mappers.courseMapper.selectDraftCoursesByInstructorID", instructorID);
		return draftList;
	}
	
	/**
	 * @author Huy
	 */
	
	@Override
	public List<Course> selectCoursesByInstructorID(int instructorID) {
		List<Course> draftList = session.selectList("mappers.courseMapper.selectCoursesByInstructorID", instructorID);
		return draftList;
	}
	
	/**
	 * @author pho
	 */
	public List<Course> findCourseLimit(int page) {
		List<Course> course = session.selectList("mappers.courseMapper.selectLimit", page);
		return course;
	}
	public List<Course> findAllView() {
		List<Course> list = session.selectList("mappers.courseMapper.selectAllView");
		return list;
	}
	public List<Course> findInstructor(int id) {
		List<Course> course = session.selectList("mappers.courseMapper.selectInstructor", id);
		return course;
	}
}
