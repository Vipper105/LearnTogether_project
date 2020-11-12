package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.AnswerMultichoiceq;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;


public interface IAnswerMultichoiceqDAO<T extends AnswerMultichoiceq> extends IService<T> {

	List<AnswerMultichoiceq> findAnserByQuestionID(int questionID);
	List<AnswerMultichoiceq> findAnswerByInQuestions(List<MultichoiceQuestion> questionList);
	void updateContent(AnswerMultichoiceq t);

}
