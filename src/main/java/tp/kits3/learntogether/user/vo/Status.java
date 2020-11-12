package tp.kits3.learntogether.user.vo;

/**
 * @author PhungDinhHuy
 *
 */
public class Status {
	private Integer id;

	private String statusName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatusname() {
		return statusName;
	}

	public void setStatusname(String statusname) {
		this.statusName = statusname;
	}

	// Status ëª¨ë?¸ ë³µì‚¬
	public void CopyData(Status param) {
		this.id = param.getId();
		this.statusName = param.getStatusname();
	}
}
