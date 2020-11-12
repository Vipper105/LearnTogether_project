package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.TestResult;


public interface ITestResultDAO<T extends TestResult> extends IService<T> {

	 List<TestResult> findAllByUserTest(int userId,int testId);
	 
	 List<TestResult> findAllByUser(int userId);
}


