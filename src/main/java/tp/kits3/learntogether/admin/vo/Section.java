package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class Section {

    private Integer id;

    private String title;

    private String description;

    private Course course;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//    public Integer getCourseId() {
//        return courseId;
//    }
//
//    public void setCourseId(Integer courseId) {
//        this.courseId = courseId;
//    }

  

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public void CopyData(Section param)
    {
        this.id = param.getId();
        this.title = param.getTitle();
        this.description = param.getDescription();
        this.course = param.getCourse();
    }

}
