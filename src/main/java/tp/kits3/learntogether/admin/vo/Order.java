package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
import java.sql.Date;

public class Order {

    private Integer id;

    private User user;

    private Date createdate;

    private Double totalamount;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    public Integer getUserId() {
//        return userId;
//    }
//
//    public void setUserId(Integer userId) {
//        this.userId = userId;
//    }
    
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Double getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(Double totalamount) {
        this.totalamount = totalamount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void CopyData(Order param)
    {
        this.id = param.getId();
        this.user = param.getUser();
        this.createdate = param.getCreatedate();
        this.totalamount = param.getTotalamount();
        this.status = param.getStatus();
    }

}
