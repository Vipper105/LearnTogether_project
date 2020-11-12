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
import tp.kits3.learntogether.user.interfaces.IResultMultiqDAO;
import tp.kits3.learntogether.user.vo.Resultmultiq;


@Repository
public class ResultMultiqDao implements IResultMultiqDAO<Resultmultiq> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Resultmultiq t) {
		session.insert("mappers.resultMultiqMapper.insert", t);
	}

	@Override
	public void update(Resultmultiq t) {

	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<Resultmultiq> findAll() {
		List<Resultmultiq> listResult = session.selectList("mappers.resultMultiqMapper.selectAll");
		return listResult;
	}

	@Override
	public Resultmultiq findOne(int id) {
		return null;
	}

	@Override
	public List<Resultmultiq> findAllUserID_TestID(int userId, int testId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userID", userId);
		map.put("testID", testId);
		List<Resultmultiq> listResult = session.selectList("mappers.resultMultiqMapper.selectAllUserID_TestID",map);
		return listResult;
	}
	
	public List<Resultmultiq> findAllByTimesDoTest(int userId,int testId,int timesDoTest){
		Map<String,Object>  map =new HashMap<String,Object>();
		map.put("userID", userId);
		map.put("testID",testId);
		map.put("timesDoTest",timesDoTest);
		
		List<Resultmultiq> listResult=session.selectList("mappers.resultMultiqMapper.selectAllTimesDoTest",map);
		return listResult;
	}
	
}
