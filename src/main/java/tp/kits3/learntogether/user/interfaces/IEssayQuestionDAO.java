package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.EssayQuestion;

public interface IEssayQuestionDAO<T extends EssayQuestion> extends IService<T>{

	List<EssayQuestion> selectAllQuestionByTestID(int testID);
//	List<EssayQuestion> selectAllQuestionByTestID_NoRD(int testID);
	int getId_after_addAnswerQuestion(EssayQuestion t);
	void updateContent(EssayQuestion t);
	
}

