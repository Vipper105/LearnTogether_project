package tp.kits3.learntogether.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.AnswerEssayqDao;
import tp.kits3.learntogether.user.vo.AnswerEssayq;

@Service
public class AnswerEssayqService {

	@Autowired
	AnswerEssayqDao answerEssayqDao;

	public void addAnswerEssayq(AnswerEssayq answerEssayq) {
		answerEssayqDao.add(answerEssayq);
	}
	
	public AnswerEssayq findAnswerByQuestionID(int questionID) {
		return answerEssayqDao.findAnswerByQuestionID(questionID);
	}
	
	public void updateContentAnswer(AnswerEssayq t) {
		answerEssayqDao.updateContentAnswer(t);
	}

//	public List<AnswerEssayq> findAnswerByQuestionID(int questionID) {
//		return answerEssayqDao.findAnswerByQuestionID(questionID);
//	}
//
//	public List<AnswerEssayq> findAnswerByInQuestions(List<AnswerEssayq> listQuestion) {
//		return answerEssayqDao.findAnswerByInQuestions(listQuestion);
//
//	}
}
