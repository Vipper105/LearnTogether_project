package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.TestTypeDao;
import tp.kits3.learntogether.user.vo.TestType;

/**
 * @author PhungDinhHuy
 *
 */

@Service
public class TestTypeService {

	@Autowired
	TestTypeDao testTypeDao;

	public List<TestType> findAllTestType() {
		return testTypeDao.findAll();
	}
	
	public TestType findOneByType(String testType) {
		return testTypeDao.findOneByType(testType);
	}
	
	public TestType findOneByTestTypeId(int id) {
		return testTypeDao.findOne(id);
	}

}
