package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.ITestTypeDAO;
import tp.kits3.learntogether.user.vo.TestType;

@Repository
public class TestTypeDao implements ITestTypeDAO<TestType> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(TestType t) {

	}

	@Override
	public void update(TestType t) {

	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<TestType> findAll() {
		List<TestType> list = session.selectList("mappers.testTypeMapper.selectAll");
		return list;
	}

	@Override
	public TestType findOneByType(String type) {
		TestType testType=session.selectOne("mappers.testTypeMapper.selectOneByType",type);
		return testType;
	}

	@Override
	public TestType findOne(int id) {
		TestType testType=session.selectOne("mappers.testTypeMapper.selectOne",id);
		return testType;
	}

}
