package tp.kits3.learntogether.admin.dao;

/**
 * @author NguyenDoanNam
 */
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.admin.vo.Instructor;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class InstructorAdminDao implements IService<Instructor> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Instructor t) {
		session.insert("mapperAdmin.instructorMapper.insert", t);
	}

	@Override
	public void update(Instructor t) {
		session.update("mapperAdmin.instructorMapper.update", t);
	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<Instructor> findAll() {
		List<Instructor> list = session.selectList("mapperAdmin.instructorMapper.selectAll");
		return list;
	}

	@Override
	public Instructor findOne(int id) {
		Instructor instructor = session.selectOne("mapperAdmin.instructorMapper.selectbyId", id);
		return instructor;
	}

}
