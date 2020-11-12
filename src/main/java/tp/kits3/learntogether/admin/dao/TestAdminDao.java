package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Test;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class TestAdminDao implements IService<Test> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Test t) {
		session.insert("mapperAdmin.testMapper.insert", t);
	}

	@Override
	public void update(Test t) {
		session.update("mapperAdmin.testMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.testMapper.deleteById", id);
	}

	@Override
	public List<Test> findAll() {
		List<Test> list = session.selectList("mapperAdmin.testMapper.selectAll");
		return list;
	}

	@Override
	public Test findOne(int id) {
		Test Test = session.selectOne("mapperAdmin.testMapper.selectbyId", id);
		return Test;
	}
	
	public List<Test> findBySectionId(int id) {
		List<Test> test = session.selectList("mapperAdmin.testMapper.selectbySectionId", id);
		
		return test;
	}

}
