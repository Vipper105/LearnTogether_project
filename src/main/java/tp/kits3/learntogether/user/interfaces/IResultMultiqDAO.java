package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;

import tp.kits3.learntogether.user.vo.Resultmultiq;


public interface IResultMultiqDAO<T extends Resultmultiq> extends IService<T> {

	List<Resultmultiq> findAllUserID_TestID(int userId, int testId);
	
	List<Resultmultiq> findAllByTimesDoTest(int userId,int testId,int timesDoTest);

}
