package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.MultichoiceQuestionDao;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;

@Service
public class MultichoiceQuestionService {

	@Autowired
	MultichoiceQuestionDao multichoiceQuestionDao;

	public void addMultichoiceQuestion(MultichoiceQuestion muQuestion) {
		multichoiceQuestionDao.add(muQuestion);
	}

	public List<MultichoiceQuestion> findAllQuestionByTestID(int testID) {
		return multichoiceQuestionDao.selectAllQuestionByTestID(testID);
	}
	
	public List<MultichoiceQuestion> findAllQuestionByTestID_NoRD(int testID) {
		return multichoiceQuestionDao.selectAllQuestionByTestID_NoRD(testID);
	}
	
	public void updateMultichoiceqTitle(MultichoiceQuestion t) {
		multichoiceQuestionDao.updateTitle(t);
	}
}
