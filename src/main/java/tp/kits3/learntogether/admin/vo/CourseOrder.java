package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class CourseOrder {

    private Integer id;

    private Course course;

    private Order order;

    private Integer quantity;
    
    public Integer getid() {
		return id;
	}

	public void setid(Integer id) {
		this.id = id;
	}
	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public void CopyData(CourseOrder param)
    {
        this.id = param.getid();
        this.course = param.getCourse();
        this.order = param.getOrder();
    }

	

	
}
