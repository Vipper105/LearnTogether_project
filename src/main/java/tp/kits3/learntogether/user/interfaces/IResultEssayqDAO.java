package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.Resultessayq;

public interface IResultEssayqDAO<T extends Resultessayq> extends IService<T> {

	List<Resultessayq> findAllUserID_TestID(int userId, int testId);

	List<Resultessayq> findAllTestNotMark(int testId, int userId);

	Resultessayq selectOneByQuestionId_TimesDoTest(int id, int timesDoTest);

	List<Resultessayq> findAllTestNotMarkByTestID(int testId);

	Resultessayq selectOneByAll(int timesDoTest, int questionId, int userId, int testId);

	List<Resultessayq> findAllResultEssay(int testId, int timesDoTest, int userId);
	
//	List<Resultmultiq> findAllByTimesDoTest(int userId,int testId,int timesDoTest);

}
