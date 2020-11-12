package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.CategoryAdminDao;
import tp.kits3.learntogether.admin.vo.Category;


@Service
public class CategoryAdminService {
	@Autowired 
	CategoryAdminDao categoryAdminDao;
	
	public List<Category> findAll()
	{
		return categoryAdminDao.findAll();
	}
	public Category findOne(Integer id)
	{
		return categoryAdminDao.findOne(id);
	}
	public boolean insert(Category t)
	{
		categoryAdminDao.add(t);
		return true;
	}
	public void update(Category t)
	{
		categoryAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		categoryAdminDao.delete(t);
		
	}

}
