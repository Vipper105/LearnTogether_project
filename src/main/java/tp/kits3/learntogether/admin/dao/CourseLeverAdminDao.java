package tp.kits3.learntogether.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.admin.vo.CourseLevel;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class CourseLeverAdminDao implements IService<CourseLevel> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(CourseLevel t) {
		session.insert("mapperAdmin.courseLevelMapper.insert", t);
	}

	@Override
	public void update(CourseLevel t) {
		session.update("mapperAdmin.courseLevelMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.courseLevelMapper.deleteById", id);
	}

	@Override
	public List<CourseLevel> findAll() {
		List<CourseLevel> list = session.selectList("mapperAdmin.courseLevelMapper.selectAll");
		return list;
	}

	@Override
	public CourseLevel findOne(int id) {
		CourseLevel courseLevel = session.selectOne("mapperAdmin.courseLevelMapper.selectbyId", id);
		return courseLevel;
	}

}
