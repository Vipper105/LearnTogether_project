package tp.kits3.learntogether.user.vo;

/*
 * @author VoDucHoa
 */

import java.sql.Date;

public class Order {

    private Integer id;

    private Integer userId;

    private Date createdate;

    private Double totalamount;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
        this.userId = param.getUserId();
        this.createdate = param.getCreatedate();
        this.totalamount = param.getTotalamount();
        this.status = param.getStatus();
    }
}
