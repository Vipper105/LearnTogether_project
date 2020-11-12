package tp.kits3.learntogether.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tp.kits3.learntogether.user.interfaces.ICategory;
import tp.kits3.learntogether.user.vo.Category;

@Repository
public class CategoryDao implements ICategory<Category> {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Category t) {
		session.insert("mappers.categoryMapper.insert", t);
	}

	@Override
	public void update(Category t) {
		session.update("mappers.categoryMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.delete("mappers.categoryMapper.delete", id);
	}

	@Override
	public List<Category> findAll() {
		List<Category> list = session.selectList("mappers.categoryMapper.selectAll");
		return list;
	}

	@Override
	public Category findOne(int id) {
		Category category = session.selectOne("mappers.categoryMapper.selectOne", id);
		return category;
	}

}
