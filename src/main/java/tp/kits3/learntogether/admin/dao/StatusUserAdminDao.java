package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.StatusUser;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class StatusUserAdminDao implements IService<StatusUser> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(StatusUser t) {
		session.insert("mapperAdmin.statusUserMapper.insert", t);
	}

	@Override
	public void update(StatusUser t) {
		session.update("mapperAdmin.statusUserMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.statusUserMapper.deleteById", id);
	}

	@Override
	public List<StatusUser> findAll() {
		List<StatusUser> list = session.selectList("mapperAdmin.statusUserMapper.selectAll");
		return list;
	}

	@Override
	public StatusUser findOne(int id) {
		StatusUser StatusUser = session.selectOne("mapperAdmin.statusUserMapper.selectbyId", id);
		return StatusUser;
	}

}
