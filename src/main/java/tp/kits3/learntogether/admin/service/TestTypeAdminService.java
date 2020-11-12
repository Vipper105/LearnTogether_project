package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.TestTypeAdminDao;
import tp.kits3.learntogether.admin.vo.TestType;


@Service
public class TestTypeAdminService {
	@Autowired 
	TestTypeAdminDao testTypeAdminDao;
	
	public List<TestType> findAll()
	{
		return testTypeAdminDao.findAll();
	}
	public TestType findOne(Integer id)
	{
		return testTypeAdminDao.findOne(id);
	}
	public boolean insert(TestType t)
	{
		testTypeAdminDao.add(t);
		return true;
	}
	public void update(TestType t)
	{
		testTypeAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		testTypeAdminDao.delete(t);
		
	}
}
