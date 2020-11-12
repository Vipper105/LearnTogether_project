package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
import java.sql.Timestamp;

public class Invoice {

	private Integer id;

	private Timestamp createdate;

	private Order order;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}

//    public Integer getOrderId() {
//        return orderId;
//    }
//
//    public void setOrderId(Integer orderId) {
//        this.orderId = orderId;
//    }

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public void CopyData(Invoice param) {
		this.id = param.getId();
		this.createdate = param.getCreatedate();
		this.order = param.getOrder();
	}

	
}
