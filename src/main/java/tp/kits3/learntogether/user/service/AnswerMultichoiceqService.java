package tp.kits3.learntogether.user.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.AnswerMultichoiceqDao;
import tp.kits3.learntogether.user.vo.AnswerMultichoiceq;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;

@Service
public class AnswerMultichoiceqService {

	@Autowired
	AnswerMultichoiceqDao answerMultichoiceqDao;

	public void addAnswerMultichoiceq(AnswerMultichoiceq anMultichoiceq) {
		answerMultichoiceqDao.add(anMultichoiceq);
	}

	public void updateAnswerMultichoiceq(AnswerMultichoiceq anMultichoiceq) {
		answerMultichoiceqDao.update(anMultichoiceq);
	}
	
	public void updateAnswerMultichoiceqContent(AnswerMultichoiceq anMultichoiceq) {
		answerMultichoiceqDao.updateContent(anMultichoiceq);
	}
	
	public List<AnswerMultichoiceq> findAnserByQuestionID(int questionID) {
		return answerMultichoiceqDao.findAnserByQuestionID(questionID);
	}

	public List<AnswerMultichoiceq> findAnswerByInQuestions(List<MultichoiceQuestion> listQuestion) {
		return answerMultichoiceqDao.findAnswerByInQuestions(listQuestion);
	}
	
}
