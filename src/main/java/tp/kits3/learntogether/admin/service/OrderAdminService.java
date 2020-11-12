package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.OrderAdminDao;
import tp.kits3.learntogether.admin.vo.Order;

@Service
public class OrderAdminService {
	@Autowired OrderAdminDao OrderddminDao;
	
	
	public List<Order> findAll()
	{
		return OrderddminDao.findAll();
	}
	public Order findOne(Integer id)
	{
		return OrderddminDao.findOne(id);
	}
	public Integer selectSumOrder()
	{
		return OrderddminDao.selectSumOrder();
	}
	public List<Integer> selectYear()
	{
		return OrderddminDao.selectYear();
	}
	public Integer selectOrderByYear(Integer month, Integer year)
	{
		return OrderddminDao.selectOrderByYear(month, year);
	}
	public boolean insert(Order t)
	{
		OrderddminDao.add(t);
		return true;
	}
	public void update(Order t)
	{
		OrderddminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		OrderddminDao.delete(t);
		
	}
}
