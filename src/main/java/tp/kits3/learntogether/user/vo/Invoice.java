package tp.kits3.learntogether.user.vo;

import java.sql.Timestamp;

public class Invoice {

    private Integer invoiceid;

    private Timestamp createdate;

    private Integer orderId;

    public Integer getInvoiceid() {
        return invoiceid;
    }

    public void setInvoiceid(Integer invoiceid) {
        this.invoiceid = invoiceid;
    }

    public Timestamp getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Timestamp createdate) {
        this.createdate = createdate;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }


    public void CopyData(Invoice param)
    {
        this.invoiceid = param.getInvoiceid();
        this.createdate = param.getCreatedate();
        this.orderId = param.getOrderId();
    }
}
