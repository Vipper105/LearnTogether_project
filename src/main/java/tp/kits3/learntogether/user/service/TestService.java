package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.TestDao;
import tp.kits3.learntogether.user.vo.Test;

/**
 * @author PhungDinhHuy
 *
 */

@Service
public class TestService {

	@Autowired
	TestDao testDao;

	public void addTest(Test test) {
		testDao.add(test);
	}

	public Test findOneTest(int id) {
		return testDao.findOne(id);
	}

	public List<Test> findAllTestBySectionID(int sectionID) {
		return testDao.listTestBySectionID(sectionID);
	}

	public List<Test> findMultiTestBySectionID(int sectionID,int typeID) {
		return testDao.listMultiTestBySectionID(sectionID,typeID);
	}

	public List<Test> findEssayTestBySectionID(int sectionID,int typeID) {
		return testDao.listEssayTestBySectionID(sectionID,typeID);
	}

	public void updateTest(Test test) {
		testDao.update(test);
	}
	
	public void updateScoreTest(Test test) {
		testDao.updateScore(test);
	}
	
	

}
