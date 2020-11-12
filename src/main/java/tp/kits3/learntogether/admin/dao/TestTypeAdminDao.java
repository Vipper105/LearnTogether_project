package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.TestType;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class TestTypeAdminDao implements IService<TestType> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(TestType t) {
		session.insert("mapperAdmin.TestTypeMapper.insert", t);
	}

	@Override
	public void update(TestType t) {
		session.update("mapperAdmin.testTypeMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.testTypeMapper.deleteById", id);
	}

	@Override
	public List<TestType> findAll() {
		List<TestType> list = session.selectList("mapperAdmin.testTypeMapper.selectAll");
		return list;
	}

	@Override
	public TestType findOne(int id) {
		TestType TestType = session.selectOne("mapperAdmin.testTypeMapper.selectbyId", id);
		return TestType;
	}

}
