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
import tp.kits3.learntogether.user.interfaces.IResultEssayqDAO;
import tp.kits3.learntogether.user.vo.Resultessayq;


@Repository
public class ResultEssayqDao implements IResultEssayqDAO<Resultessayq> {

	@Autowired
	private SqlSession session;

	@Override
	public void add(Resultessayq t) {
		session.insert("mappers.resultEssayqMapper.insert", t);
	}

	@Override
	public List<Resultessayq> findAllUserID_TestID(int userId, int testId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userID", userId);
		map.put("testID", testId);
		List<Resultessayq> listResult = session.selectList("mappers.resultEssayqMapper.selectAllUserID_TestID", map);
		return listResult;
	}

	@Override
	public List<Resultessayq> findAllTestNotMark(int testId,int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("testID", testId);
		map.put("userID", userId);	
		return session.selectList("mappers.resultEssayqMapper.selectAllTestNotMark",map);
	}
	
	public List<Resultessayq> findAllResultEssay(int testId,int timesDoTest,int userId ){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("testID", testId);
		map.put("timesDoTest", timesDoTest);
		map.put("userID", userId);	
		return session.selectList("mappers.resultEssayqMapper.selectAllResultEssay",map);
	}
	
	@Override
	public Resultessayq selectOneByQuestionId_TimesDoTest(int id,int timesDoTest) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questionID", id);
		map.put("timesDoTest", timesDoTest);
		return session.selectOne("mappers.resultEssayqMapper.selectOneByQuestionId_TimesDoTest",map);
	}
	
	@Override
	public Resultessayq selectOneByAll(int timesDoTest,int questionId,int userId,int testId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("timesDoTest", timesDoTest);
		map.put("questionID", questionId);
		map.put("userID", userId);
		map.put("testID", testId);
		return session.selectOne("mappers.resultEssayqMapper.selectOneByAll",map);
	}

	@Override
	public List<Resultessayq> findAllTestNotMarkByTestID(int testId) {	
		return session.selectList("mappers.resultEssayqMapper.selectAllTestNotMarkByTestId",testId);
	}

	
	@Override
	public void update(Resultessayq t) {
		session.update("mappers.resultEssayqMapper.update",t);
	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<Resultessayq> findAll() {
		return null;
	}

	@Override
	public Resultessayq findOne(int id) {
		return null;
	}

}
