package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
import java.sql.Date;

public class PromotionCourse {

    private Integer id;

    private Promotion promotion;

    private Course course;

    private Date updatedate;

    private Double pricediscount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    public Integer getPromotionId() {
//        return promotionId;
//    }
//
//    public void setPromotionId(Integer promotionId) {
//        this.promotionId = promotionId;
//    }

    
//    public Integer getCourseId() {
//        return courseId;
//    }
//
//    public void setCourseId(Integer courseId) {
//        this.courseId = courseId;
//    }

    public Promotion getPromotion() {
		return promotion;
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
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
        this.promotion = param.getPromotion();
        this.course = param.getCourse();
        this.updatedate = param.getUpdatedate();
        this.pricediscount = param.getPricediscount();
    }

	
}
