package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.EssayQuestionDao;
import tp.kits3.learntogether.user.vo.EssayQuestion;

@Service
public class EssayQuestionService {

	/**
	 * @author PhungDinhHuy
	 *
	 */
	@Autowired
	EssayQuestionDao essayQuestionDao;

	public void addEssayQuestion(EssayQuestion essayQuestion) {
		essayQuestionDao.add(essayQuestion);
	}
	
	public int getId_after_addAnswerQuestion(EssayQuestion essayQuestion) {
		return essayQuestionDao.getId_after_addAnswerQuestion(essayQuestion);
	}

	public List<EssayQuestion> findAllQuestionByTestID(int testID) {
		return essayQuestionDao.selectAllQuestionByTestID(testID);
		
	}
	
	public EssayQuestion findOne(int id) {
		return essayQuestionDao.findOne(id);
	}
	
	public void updateContentScoreQuestion(EssayQuestion t) {	
		essayQuestionDao.updateContent(t);
	}
	
//	
//	public List<MultichoiceQuestion> findAllQuestionByTestID_NoRD(int testID) {
//		return essayQuestionDao.selectAllQuestionByTestID_NoRD(testID);
//	}
}
