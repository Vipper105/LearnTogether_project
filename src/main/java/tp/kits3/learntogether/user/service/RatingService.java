package tp.kits3.learntogether.user.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.RatingDao;
import tp.kits3.learntogether.user.vo.Rating;

@Service
public class RatingService {
	
	@Autowired
	private RatingDao ratingDao;
	
	public void addRating(Rating rating) {
		ratingDao.addRating(rating);
	}
	public List<Rating> getAll(int id){
		List<Rating> listRating = ratingDao.findAllRating(id);
		return listRating;
	}
	public Rating findOne(int id) {
		return ratingDao.findOne(id);
	}
	
	public List<Rating> getAllByCourse(int id){
		List<Rating> listRating = ratingDao.findAllByCourse(id);
		return listRating;
	}
	
	public Rating findOneByUser(int courseID, int userID) {
		return ratingDao.findOneByUser(courseID, userID);
	}

	public void deleteRating(int courseID, int userID) {
		ratingDao.deleteRating(courseID, userID);
	}
}
