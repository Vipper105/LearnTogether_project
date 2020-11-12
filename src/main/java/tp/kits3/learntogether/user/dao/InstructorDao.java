package tp.kits3.learntogether.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.user.interfaces.IInstructor;
import tp.kits3.learntogether.user.vo.Instructor;

@Repository
public class InstructorDao implements IInstructor<Instructor> {

	@Autowired
	private SqlSession session;
	
	@Options(useGeneratedKeys=true)
	@Override
	public void add(Instructor t) {
		session.insert("mappers.instructorMapper.insert",t);
	}

	@Override
	public Instructor selectInstructorByUserID(int userID) {
		return session.selectOne("mappers.instructorMapper.selectInstructorByUserID", userID);
	}

	@Override
	public void update(Instructor t) {
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<Instructor> findAll() {
		return null;
	}

	@Override
	public Instructor findOne(int id) {
		Instructor instructor = session.selectOne("mappers.instructorMapper.selectOne", id);
		return instructor;
	}
}
