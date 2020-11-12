package tp.kits3.learntogether.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.admin.vo.Order;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class OrderAdminDao implements IService<Order> {

	@Autowired
	private SqlSession session;

	@Override
	public void add(Order t) {
		session.insert("mapperAdmin.ordersMapper.insert", t);
	}

	@Override
	public void update(Order t) {
		session.update("mapperAdmin.ordersMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.ordersMapper.deleteById", id);
	}

	@Override
	public List<Order> findAll() {
		List<Order> list = session.selectList("mapperAdmin.ordersMapper.selectAll");
		return list;
	}

	@Override
	public Order findOne(int id) {
		Order Order = session.selectOne("mapperAdmin.ordersMapper.selectbyId", id);
		return Order;
	}
	
	public Integer selectSumOrder() {
		Integer list = session.selectOne("mapperAdmin.ordersMapper.selectSumOrder");
		return list;
	}
	
	public List<Integer> selectYear() {
		List<Integer> list = session.selectList("mapperAdmin.ordersMapper.selectYear");
		return list;
	}

	public Integer selectOrderByYear(Integer month, Integer year) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("month", month);
		map.put("year", year);
		Integer order = session.selectOne("mapperAdmin.ordersMapper.selectOrderByYear", map);
		return order;
	}

}
