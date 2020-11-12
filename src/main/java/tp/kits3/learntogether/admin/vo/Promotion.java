package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
import java.sql.Date;

public class Promotion {

    private Integer id;

    private String promotionname;

    private Date enddate;

    private Integer discount;

    private Date startdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPromotionname() {
        return promotionname;
    }

    public void setPromotionname(String promotionname) {
        this.promotionname = promotionname;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public void CopyData(Promotion param)
    {
        this.id = param.getId();
        this.promotionname = param.getPromotionname();
        this.enddate = param.getEnddate();
        this.discount = param.getDiscount();
        this.startdate = param.getStartdate();
    }
}