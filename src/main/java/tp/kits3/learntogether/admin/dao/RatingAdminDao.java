package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Rating;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class RatingAdminDao implements IService<Rating> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Rating t) {
		session.insert("mapperAdmin.ratingMapper.insert", t);
	}

	@Override
	public void update(Rating t) {
		session.update("mapperAdmin.ratingMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.ratingMapper.deleteById", id);
	}

	@Override
	public List<Rating> findAll() {
		List<Rating> list = session.selectList("mapperAdmin.ratingMapper.selectAll");
		return list;
	}

	@Override
	public Rating findOne(int id) {
		Rating rating = session.selectOne("mapperAdmin.ratingMapper.selectbyId", id);
		return rating;
	}

}
