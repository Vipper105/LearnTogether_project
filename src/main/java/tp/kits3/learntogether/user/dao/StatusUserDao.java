package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IStatusUserDAO;
import tp.kits3.learntogether.user.vo.StatusUser;


@Repository
public class StatusUserDao implements IStatusUserDAO<StatusUser> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(StatusUser t) {

	}

	@Override
	public void update(StatusUser t) {

	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<StatusUser> findAll() {
		return null;
	}

	@Override
	public StatusUser findOne(int id) {
		return null;
	}

	@Override
	public List<StatusUser> selectAllByUserID(int userID) {
		List<StatusUser> listStatus = session.selectList("mappers.status_userMapper.selectAllByUserID", userID);
		return listStatus;
	}

}
