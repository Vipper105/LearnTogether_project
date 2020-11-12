package tp.kits3.learntogether.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IRatingDAO;
import tp.kits3.learntogether.user.vo.Rating;

@Repository
public class RatingDao implements IRatingDAO<Rating>{

	@Autowired
	private SqlSession session;

	@Override
	public void add(Rating t) {
		
	}

	@Override
	public void update(Rating t) {
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<Rating> findAll() {
		return null;
	}

	public List<Rating> findAllRating(int id) {
		List<Rating> listRating = session.selectList("mappers.ratingMapper.selectOne");
		return listRating;
	}
	
	@Override
	public Rating findOne(int id) {
		Rating rating = session.selectOne("mappers.ratingMapper.selectOne", id);
		return rating;
		
	}
	public List<Rating> findAllByCourse(int id) {
		List<Rating> rating = session.selectList("mappers.ratingMapper.selectAllByCourse", id);
		return rating;
		
	}
	
	public Rating findOneByUser(int courseID, int userID) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("courseID", courseID);
		map.put("userID", userID);
		return session.selectOne("mappers.ratingMapper.selectOneByUser", map);
	}
	
	@Override
	public void addRating(Rating rating) {
		session.insert("mappers.ratingMapper.insert", rating);
	}

	@Override
	public void updateRating(Rating rating) {
		
	}
	
	public void deleteRating(int courseID, int userID) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("courseID", courseID);
		map.put("userID", userID);
		session.delete("mappers.ratingMapper.delete", map);
	}
	
}
