package tp.kits3.learntogether.admin.vo;

public class StatusUser {

    private Integer id;

    private User user;

    private Status status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public void CopyData(StatusUser param)
    {
        this.id = param.getId();
        this.user = param.getUser();
        this.status = param.getStatus();
    }
}