package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.RatingAdminDao;
import tp.kits3.learntogether.admin.vo.Rating;


@Service
public class RatingAdminService {
	@Autowired 
	RatingAdminDao ratingAdminDao;
	
	public List<Rating> findAll()
	{
		return ratingAdminDao.findAll();
	}
	public Rating findOne(Integer id)
	{
		return ratingAdminDao.findOne(id);
	}
	public boolean insert(Rating t)
	{
		ratingAdminDao.add(t);
		return true;
	}
	public void update(Rating t)
	{
		ratingAdminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		ratingAdminDao.delete(t);
		
	}
}
