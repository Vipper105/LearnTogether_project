package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;

public interface IMultichoiceQuestionDAO<T extends MultichoiceQuestion> extends IService<T>{

	List<MultichoiceQuestion> selectAllQuestionByTestID(int testID);
	List<MultichoiceQuestion> selectAllQuestionByTestID_NoRD(int testID);
	void updateTitle(MultichoiceQuestion t);
}

