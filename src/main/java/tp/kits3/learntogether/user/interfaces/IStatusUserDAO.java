package tp.kits3.learntogether.user.interfaces;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.StatusUser;

public interface IStatusUserDAO<T extends StatusUser> extends IService<T>{

	List<StatusUser> selectAllByUserID(int userID);
	
}

