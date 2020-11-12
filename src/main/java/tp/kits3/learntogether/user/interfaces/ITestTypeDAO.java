package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import tp.kits3.learntogether.user.vo.TestType;


public interface ITestTypeDAO<T extends TestType> extends IService<T> {

	TestType findOneByType(String type);
	
}


