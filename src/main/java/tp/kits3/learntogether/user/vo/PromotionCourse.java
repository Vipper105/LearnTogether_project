package tp.kits3.learntogether.user.vo;

import java.sql.Date;

public class PromotionCourse {

    private Integer id;

    private Integer promotionId;

    private Integer courseId;

    private Date updatedate;

    private Double pricediscount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(Integer promotionId) {
        this.promotionId = promotionId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }

    public Double getPricediscount() {
        return pricediscount;
    }

    public void setPricediscount(Double pricediscount) {
        this.pricediscount = pricediscount;
    }

    public void CopyData(PromotionCourse param)
    {
        this.id = param.getId();
        this.promotionId = param.getPromotionId();
        this.courseId = param.getCourseId();
        this.updatedate = param.getUpdatedate();
        this.pricediscount = param.getPricediscount();
    }
}
