package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class Rating {

    private Integer id;

    private Integer ratevalue;

    private Course course;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRatevalue() {
        return ratevalue;
    }

    public void setRatevalue(Integer ratevalue) {
        this.ratevalue = ratevalue;
    }

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public void CopyData(Rating param)
    {
        this.id = param.getId();
        this.ratevalue = param.getRatevalue();
        this.course = param.getCourse();
    }

}
