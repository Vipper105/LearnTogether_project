package tp.kits3.learntogether.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.user.interfaces.ICourseLevel;
import tp.kits3.learntogether.user.vo.CourseLevel;

@Repository
public class CourseLevelDao implements ICourseLevel<CourseLevel>{

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(CourseLevel t) {
		
	}

	@Override
	public void update(CourseLevel t) {
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<CourseLevel> findAll() {
		List<CourseLevel> list = session.selectList("mappers.courseLevelMapper.selectAll");
		return list;
	}

	@Override
	public CourseLevel findOne(int id) {
		return session.selectOne("mappers.courseLevelMapper.selectOne", id);
	}

}
