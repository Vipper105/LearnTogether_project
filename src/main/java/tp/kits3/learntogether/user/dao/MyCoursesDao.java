package tp.kits3.learntogether.user.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.dto.MyCourses;
import tp.kits3.learntogether.user.interfaces.IMyCoursesDAO;

@Repository
public class MyCoursesDao implements IMyCoursesDAO<MyCourses>{

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(MyCourses t) {
		
	}

	@Override
	public void update(MyCourses t) {
		
	}

	@Override
	public void delete(int id) {
		
	}
	
	public List<MyCourses> findAllCourses(int id) {
		List<MyCourses> list = session.selectList("mappers.myCoursesMapper.selectAll", id);
		return list;
	}

	@Override
	public MyCourses findOne(int id) {
		return null;
	}

	@Override
	public List<MyCourses> findAll() {
		return null;
	}
	
}
