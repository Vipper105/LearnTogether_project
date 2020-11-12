package tp.kits3.learntogether.user.vo;

public class Rating {

    private Integer id;

    private float rateValue;

    private Integer courseId;
    
    private Integer userId;
    
    

    public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public float getRatevalue() {
        return rateValue;
    }

    public void setRatevalue(float rateValue) {
        this.rateValue = rateValue;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

  

	public Rating(Integer id, Integer rateValue, Integer courseId, Integer userId) {
		super();
		this.id = id;
		this.rateValue = rateValue;
		this.courseId = courseId;
		this.userId = userId;
	}

	public Rating() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}
