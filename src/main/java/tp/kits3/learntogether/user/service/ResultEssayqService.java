package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.ResultEssayqDao;
import tp.kits3.learntogether.user.vo.Resultessayq;

/**
 * @author PhungDinhHuy
 *
 */
@Service
public class ResultEssayqService {

	@Autowired
	ResultEssayqDao resultEssayqDao;

	public void addResultEssay(Resultessayq t) {
		resultEssayqDao.add(t);
	}

	public List<Resultessayq> findAllResultEssayByUserTest(int userId, int testId) {
		return resultEssayqDao.findAllUserID_TestID(userId, testId);

	}

	public List<Resultessayq> findAllTestNotMark(int testId, int userId) {
		return resultEssayqDao.findAllTestNotMark(testId, userId);
	}

	public List<Resultessayq> findAllTestNotMarkByTestID(int testId) {
		return resultEssayqDao.findAllTestNotMarkByTestID(testId);
	}

	public List<Resultessayq> findAllResultEssay(int testId,int timesDoTest,int userId ) {
		return resultEssayqDao.findAllResultEssay(testId, timesDoTest, userId);
	}
	
	public Resultessayq selectOneByQuestionId_TimesDoTest(int id, int timesDoTest) {
		return resultEssayqDao.selectOneByQuestionId_TimesDoTest(id, timesDoTest);

	}

	public Resultessayq selectOneByAll(int timesDoTest, int questionId, int userId, int testId) {
		return resultEssayqDao.selectOneByAll(timesDoTest, questionId, userId, testId);

	}
	
	public void updateResultEssay(Resultessayq resultessayq) {
		resultEssayqDao.update(resultessayq);
	}

}
