package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import tp.kits3.learntogether.user.vo.AnswerEssayq;


public interface IAnswerEssayqDAO<T extends AnswerEssayq> extends IService<T> {

	AnswerEssayq findAnswerByQuestionID(int questionID);
	void updateContentAnswer(AnswerEssayq t);
//	List<AnswerEssayq> findAnswerByInQuestions(List<AnswerEssayq> questionList);

}
