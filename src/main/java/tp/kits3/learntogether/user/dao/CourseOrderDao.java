package tp.kits3.learntogether.user.dao;

/**
 * @author VoDucHoa
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.ICourseOrderDao;
import tp.kits3.learntogether.user.vo.CourseOrder;

@Repository
public class CourseOrderDao implements ICourseOrderDao<CourseOrder>{

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(CourseOrder t) {
		session.insert("mappers.courseOrderMapper.insert", t);
	}

	@Override
	public void update(CourseOrder t) {
		session.update("mappers.courseOrderMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.delete("mappers.courseOrderMapper.delete", id);
	}

	@Override
	public List<CourseOrder> findAll() {
		List<CourseOrder> list =  session.selectList("mappers.courseOrderMapper.selectAll");
		return list;
	}

	@Override
	public CourseOrder findOne(int id) {
		CourseOrder courseorder = session.selectOne("mappers.courseOrderMapper.selectOne", id);
		return courseorder;
	}
	
}
