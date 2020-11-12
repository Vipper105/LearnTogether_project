package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Lesson;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class LessonAdminDao implements IService<Lesson> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Lesson t) {
		session.insert("mapperAdmin.lessonMapper.insert", t);
	}

	@Override
	public void update(Lesson t) {
		session.update("mapperAdmin.lessonMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.lessonMapper.deleteById", id);
	}

	@Override
	public List<Lesson> findAll() {
		List<Lesson> list = session.selectList("mapperAdmin.lessonMapper.selectAll");
		return list;
	}

	@Override
	public Lesson findOne(int id) {
		Lesson Lesson = session.selectOne("mapperAdmin.lessonMapper.selectbyId", id);
		return Lesson;
	}
	
	public List<Lesson> findbySessionId(int id) {
		List<Lesson> Lesson = session.selectList("mapperAdmin.lessonMapper.selectbySessionId", id);
	
		return Lesson;
	}

}
