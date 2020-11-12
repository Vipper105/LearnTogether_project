package tp.kits3.learntogether.user.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IOrders;
import tp.kits3.learntogether.user.vo.Order;

@Repository
public class OrdersDao implements IOrders<Order> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Order t) {
		session.insert("mappers.orderMapper.insert", t);
	}

	@Override
	public void update(Order t) {
		session.update("mappers.orderMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.delete("mappers.orderMapper.delete", id);
	}

	@Override
	public List<Order> findAll() {
		List<Order> list =  session.selectList("mappers.orderMapper.selectAll");
		return list;
	}

	@Override
	public Order findOne(int id) {
		Order courseorder = session.selectOne("mappers.orderMapper.selectOne", id);
		return courseorder;
	}
	
	public List<Order> selectId(int id) {
		System.out.println(id);
		List<Order> list =  session.selectList("mappers.orderMapper.selectId", id);
		return list;
	}
	
}
