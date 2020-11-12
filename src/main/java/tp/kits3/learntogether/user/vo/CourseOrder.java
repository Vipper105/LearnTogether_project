package tp.kits3.learntogether.user.vo;

import java.io.Serializable;

public class CourseOrder implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Course course;
    
    private Integer courseId;

    private Integer orderId;

    private Integer quantity;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public CourseOrder(Integer id, Course course, Integer courseId, Integer orderId, Integer quantity) {
		super();
		this.id = id;
		this.course = course;
		this.courseId = courseId;
		this.orderId = orderId;
		this.quantity = quantity;
	}

	public CourseOrder() {
		super();
	}

}
