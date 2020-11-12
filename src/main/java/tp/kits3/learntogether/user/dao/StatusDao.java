package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IStatusDAO;
import tp.kits3.learntogether.user.vo.Status;


@Repository
public class StatusDao implements IStatusDAO<Status> {

	@Autowired
	private SqlSession session;
	
	@Override
	public Status findOne(int statusId) {
		Status status = session.selectOne("mappers.statusMapper.selectOne", statusId);
		return status;
	}
	
	@Override
	public void add(Status t) {

	}

	@Override
	public void update(Status t) {
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<Status> findAll() {
		return null;
	}

}
