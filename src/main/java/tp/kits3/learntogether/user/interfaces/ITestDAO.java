package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.Test;

public interface ITestDAO<T extends Test> extends IService<T> {

	List<Test> listTestBySectionID(int sectionID);
	
	List<Test> listMultiTestBySectionID(int sectionID,int typeID);
	
	List<Test> listEssayTestBySectionID(int sectionID,int typeID);
	
	void updateScore(Test t);
}


