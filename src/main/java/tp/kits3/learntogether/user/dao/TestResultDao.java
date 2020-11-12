package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.ITestResultDAO;
import tp.kits3.learntogether.user.vo.TestResult;


@Repository
public class TestResultDao implements ITestResultDAO<TestResult>{

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(TestResult t) {
		session.insert("mappers.testResultMapper.insert", t);	
	}
	
	@Override
	public List<TestResult> findAllByUserTest(int userId,int testId) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("userID",userId);
		map.put("testID",testId);
		List<TestResult> list=session.selectList("mappers.testResultMapper.selectAllByUserTest", map);
		return list;
	}
	
	@Override
	public List<TestResult> findAllByUser(int userId) {
		return session.selectList("mappers.testResultMapper.selectAllByUser", userId);
	}

	@Override
	public void update(TestResult t) {
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<TestResult> findAll() {
		return null;
	}

	@Override
	public TestResult findOne(int id) {
		return null;
	}

}


