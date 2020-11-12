package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.ResultMultiqDao;
import tp.kits3.learntogether.user.vo.Resultmultiq;

/**
 * @author PhungDinhHuy
 *
 */
@Service
public class ResultMultiqService {

	@Autowired
	ResultMultiqDao resultMultiqDao;

	public void addResultMultiq(Resultmultiq resultmultiq) {
		resultMultiqDao.add(resultmultiq);
	}
	
	public List<Resultmultiq> findAllResultMultiq(){	
		return resultMultiqDao.findAll();
	}
	
	public List<Resultmultiq> findAllResultMultiqByUserTest(int userId,int testId){	
		return resultMultiqDao.findAllUserID_TestID(userId, testId);
	}

	public List<Resultmultiq> findAllByTimesDoTest(int userId,int testId,int timesDoTest){
		return resultMultiqDao.findAllByTimesDoTest(userId, testId, timesDoTest);
		
	}
	
}
