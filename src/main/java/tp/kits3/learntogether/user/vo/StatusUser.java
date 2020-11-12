package tp.kits3.learntogether.user.vo;

import java.util.List;

/**
 * @author PhungDinhHuy
 *
 */
public class StatusUser {
	private Integer id;

	private Integer userId;

	private Integer status_id;

	private List<User> listUser;

	private List<Status> listStatus;
	
	Status status;

	public StatusUser() {
	}

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}

	public List<Status> getListStatus() {
		return listStatus;
	}

	public void setListStatus(List<Status> listStatus) {
		this.listStatus = listStatus;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userId;
	}

	public void setUserid(Integer userid) {
		this.userId = userid;
	}

	public Integer getStatusId() {
		return status_id;
	}

	public void setStatusId(Integer statusId) {
		this.status_id = statusId;
	}

	// StatusUser ëª¨ë?¸ ë³µì‚¬
	public void CopyData(StatusUser param) {
		this.id = param.getId();
		this.userId = param.getUserid();
		this.status_id = param.getStatusId();
	}
}
