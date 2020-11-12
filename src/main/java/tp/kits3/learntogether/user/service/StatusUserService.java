package tp.kits3.learntogether.user.service;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import tp.kits3.learntogether.user.dao.StatusUserDao;
import tp.kits3.learntogether.user.vo.StatusUser;

public class StatusUserService {

	@Autowired
	StatusUserDao statusUserDao;

	public List<StatusUser> selectAllByUserID(int userId) {
		return statusUserDao.selectAllByUserID(userId);

	}

}
