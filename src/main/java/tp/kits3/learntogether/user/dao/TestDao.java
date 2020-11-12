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
import tp.kits3.learntogether.user.interfaces.ITestDAO;
import tp.kits3.learntogether.user.vo.Test;

@Repository
public class TestDao implements ITestDAO<Test>{

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Test t) {	
		session.insert("mappers.testMapper.insert", t);
	}

	@Override
	public void update(Test t) {
		session.update("mappers.testMapper.update", t);
	}

	@Override
	public void updateScore(Test t) {
		session.update("mappers.testMapper.updateScore", t);
	}
	 
	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<Test> findAll() {
		return null;
	}

	@Override
	public Test findOne(int id) {
		Test test=session.selectOne("mappers.testMapper.selectOne", id);
		return test;
	}

	@Override
	public List<Test> listTestBySectionID(int sectionID) {
		//selectAllTestBySectionID
		List<Test> listTest=session.selectList("mappers.testMapper.selectAllTestBySectionID",sectionID);
		return listTest;
	}
	
	@Override
	public List<Test> listMultiTestBySectionID(int sectionID,int typeID) {
		//selectAllTestBySectionID
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("sectionID",sectionID);
		map.put("sectionID",typeID);
		return session.selectList("mappers.testMapper.selectMultiTestBySectionID",map);
	}
	
	@Override
	public List<Test> listEssayTestBySectionID(int sectionID,int typeID) {
		//selectAllTestBySectionID
		return session.selectList("mappers.testMapper.selectEssayTestBySectionID",sectionID);
	}

}


