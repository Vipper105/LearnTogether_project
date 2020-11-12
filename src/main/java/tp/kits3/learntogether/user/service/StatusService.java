package tp.kits3.learntogether.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.StatusDao;
import tp.kits3.learntogether.user.vo.Status;

/**
 * @author PhungDinhHuy
 *
 */

@Service
public class StatusService {

	@Autowired
	StatusDao statusDao;

	public Status findOne(int id) {
		return statusDao.findOne(id);
	}

}
