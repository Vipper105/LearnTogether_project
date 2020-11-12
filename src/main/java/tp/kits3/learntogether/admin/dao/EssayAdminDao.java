package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Essay;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class EssayAdminDao implements IService<Essay> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Essay t) {
		session.insert("mapperAdmin.essayQuestionMapper.insert", t);
	}

	@Override
	public void update(Essay t) {
		session.update("mapperAdmin.essayQuestionMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.essayQuestionMapper.deleteById", id);
	}

	@Override
	public List<Essay> findAll() {
		List<Essay> list = session.selectList("mapperAdmin.essayQuestionMapper.selectAll");
		return list;
	}

	@Override
	public Essay findOne(int id) {
		Essay Essay = session.selectOne("mapperAdmin.essayQuestionMapper.selectbyId", id);
		return Essay;
	}
	public List<Essay> findbyTestId(int id) {
		List<Essay> list = session.selectList("mapperAdmin.essayQuestionMapper.selectbyTestId", id);
		return list;
	}

}
