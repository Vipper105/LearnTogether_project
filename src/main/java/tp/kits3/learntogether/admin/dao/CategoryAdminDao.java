package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Category;
import tp.kits3.learntogether.user.interfaces.IService;


@Repository
public class CategoryAdminDao implements IService<Category> {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Category t) {	
		session.insert("mapperAdmin.categoryMapper.insert", t);
	}

	@Override
	public void update(Category t) {
		session.update("mapperAdmin.categoryMapper.update", t);		
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.categoryMapper.deleteById", id);	
	}

	@Override
	public List<Category> findAll() {
		List<Category> list = session.selectList("mapperAdmin.categoryMapper.selectAll");
		return list;
	}

	@Override
	public Category findOne(int id) {
		Category category = session.selectOne("mapperAdmin.categoryMapper.selectbyId", id);
		return category;
	}
}
