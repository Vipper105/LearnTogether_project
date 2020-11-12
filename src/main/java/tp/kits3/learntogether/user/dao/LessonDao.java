package tp.kits3.learntogether.user.dao;

/**
* 	@author: Diep Nguyen
*/

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.ILesson;
import tp.kits3.learntogether.user.vo.Lesson;

@Repository
public class LessonDao implements ILesson<Lesson> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Lesson t) {
		session.insert("mappers.lessonMapper.insert",t);
	}

	@Override
	public void update(Lesson t) {
		session.update("mappers.lessonMapper.update",t);
	}

	@Override
	public void delete(int id) {
		session.delete("mappers.lessonMapper.delete", id);
	}

	@Override
	public List<Lesson> findAll() {
		return null;
	}

	@Override
	public Lesson findOne(int id) {
		Lesson lesson = session.selectOne("mappers.lessonMapper.selectOne", id);
		return lesson;
	}

	@Override
	public List<Lesson> getLessonsBySectionID(int sectionID) {
		List<Lesson> lessonsListBySectionID = session.selectList("mappers.lessonMapper.getLessonsBySectionID", sectionID);
		return lessonsListBySectionID;
	}

	@Override
	public int calculateTotalVideoDurationByCourseID(int courseID) {
		if(session.selectOne("mappers.lessonMapper.calculateTotalVideoDurationByCourseID", courseID) == null) {
			return 0;
		}
		return session.selectOne("mappers.lessonMapper.calculateTotalVideoDurationByCourseID", courseID);
	}

}
