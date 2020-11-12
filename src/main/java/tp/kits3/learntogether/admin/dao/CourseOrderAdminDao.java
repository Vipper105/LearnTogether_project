package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.CourseOrder;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class CourseOrderAdminDao implements IService<CourseOrder> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(CourseOrder t) {
		session.insert("mapperAdmin.courseOrderMapper.insert", t);
	}

	@Override
	public void update(CourseOrder t) {
		session.update("mapperAdmin.courseOrderMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.courseOrderMapper.deleteById", id);
	}

	@Override
	public List<CourseOrder> findAll() {
		List<CourseOrder> list = session.selectList("mapperAdmin.courseOrderMapper.selectAll");
		return list;
	}

	@Override
	public CourseOrder findOne(int id) {
		CourseOrder CourseOrder = session.selectOne("mapperAdmin.courseOrderMapper.selectbyId", id);
		return CourseOrder;
	}

}
