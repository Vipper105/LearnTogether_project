package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.TestResultDao;
import tp.kits3.learntogether.user.vo.TestResult;

/**
 * @author PhungDinhHuy
 *
 */

@Service
public class TestResultService {

	@Autowired
	TestResultDao testResultDao;

	public void addTestResult(TestResult testResult) {
		testResultDao.add(testResult);
	}

	public List<TestResult> findAllByUserTest(int userId, int testId) {
		return testResultDao.findAllByUserTest(userId, testId);
	}
	
	public List<TestResult> findAllByUser(int userId) {
		return testResultDao.findAllByUser(userId);
	}

}
