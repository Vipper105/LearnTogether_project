package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.MultiChoice;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class MultiAdminDao implements IService<MultiChoice> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(MultiChoice t) {
		session.insert("mapperAdmin.multiChoiceMapper.insert", t);
	}

	@Override
	public void update(MultiChoice t) {
		session.update("mapperAdmin.multiChoiceMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.multiChoiceMapper.deleteById", id);
	}

	@Override
	public List<MultiChoice> findAll() {
		List<MultiChoice> list = session.selectList("mapperAdmin.multiChoiceMapper.selectAll");
		return list;
	}

	@Override
	public MultiChoice findOne(int id) {
		MultiChoice MultiChoice = session.selectOne("mapperAdmin.multiChoiceMapper.selectbyId", id);
		return MultiChoice;
	}
	public List<MultiChoice> findbyTestId(int id) {
		List<MultiChoice> list = session.selectList("mapperAdmin.multiChoiceMapper.selectbyTestId", id);
		return list;
	}

}
