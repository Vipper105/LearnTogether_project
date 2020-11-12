package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.TestAdminDao;
import tp.kits3.learntogether.admin.vo.Test;


@Service
public class TestAdminService {
	@Autowired 
	TestAdminDao testAdminDao;
	
	public List<Test> findAll()
	{
		return testAdminDao.findAll();
	}
	public Test findOne(Integer id)
	{
		return testAdminDao.findOne(id);
	}
	public boolean insert(Test t)
	{
		testAdminDao.add(t);
		return true;
	}
	public void update(Test t)
	{
		testAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		testAdminDao.delete(t);
		
	}
	public List<Test> findBySectionId(Integer id) {
		return testAdminDao.findBySectionId(id);
	}
}
