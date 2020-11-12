package tp.kits3.learntogether.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.user.interfaces.ICoursePricing;
import tp.kits3.learntogether.user.vo.CoursePricing;

@Repository
public class CoursePricingDao implements ICoursePricing<CoursePricing>{

	@Autowired
	private SqlSession session;

	@Override
	public void add(CoursePricing t) {
		
	}

	@Override
	public void update(CoursePricing t) {
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<CoursePricing> findAll() {
		return session.selectList("mappers.coursePricingMapper.selectAll");
	}

	@Override
	public CoursePricing findOne(int id) {
		return null;
	}


}
