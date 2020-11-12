package tp.kits3.learntogether.admin.dao;
/**
 * @author NguyenDoanNam
 */
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Course;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class CourseAdminDao implements IService<Course> {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Course t) {
		session.insert("mapperAdmin.courseMapper.insert", t);
	}

	@Override
	public void update(Course t) {
		session.update("mapperAdmin.courseMapper.update", t);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Course> findAll() {
		List<Course> list = session.selectList("mapperAdmin.courseMapper.selectAll");
		return list;
	}

	@Override
	public Course findOne(int id) {
		Course course = session.selectOne("mapperAdmin.courseMapper.selectbyId", id);
		return course;
	}

	public List<Course> findOneCourCate(int id) {
		List<Course> course = session.selectList("mapperAdmin.courseMapper.selectOneCate", id);
		return course;
	}
	
	public List<Course> findApprove() {
		List<Course> course = session.selectList("mapperAdmin.courseMapper.selectApprove");
	
		return course;
	}
	public void ApproveCourse(Integer id) {
		session.update("mapperAdmin.courseMapper.approveCourse", id);

	}
	public void noApproveCourse(Integer id) {
		session.update("mapperAdmin.courseMapper.noApproveCourse", id);
	}
	
	public List<HashMap<String,Object>> selectCategory()
	{
		List<HashMap<String,Object>> results = session.selectList("mapperAdmin.courseMapper.selectCategory");
		return results;
	}
	

}
