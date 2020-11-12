package tp.kits3.learntogether.admin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Status;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class StatusAdminDao implements IService<Status> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Status t) {
		session.insert("mapperAdmin.statusMapper.insert", t);
	}

	@Override
	public void update(Status t) {
		session.update("mapperAdmin.statusMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mapperAdmin.statusMapper.deleteById", id);
	}

	@Override
	public List<Status> findAll() {
		List<Status> list = session.selectList("mapperAdmin.statusMapper.selectAll");
		return list;
	}

	@Override
	public Status findOne(int id) {
		Status Status = session.selectOne("mapperAdmin.statusMapper.selectbyId", id);
		return Status;
	}

}
