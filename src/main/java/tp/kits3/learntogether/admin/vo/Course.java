package tp.kits3.learntogether.admin.vo;
import java.sql.Timestamp;
/**
 * @author NguyenDoanNam
 *
 */
public class Course {

	private Integer id;

	private String coursetitle;

	private String description;

	private Double pricecourse;

	private String language;
	
	private CourseLevel courseLevel;

	private Integer numstudent;

	private Timestamp createdate;

	private Timestamp lasteupdate;

	private Instructor instructor;

	private Category category;

	private String urlimg;

	private Boolean status;
	
	private Boolean submit;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCoursetitle() {
		return coursetitle;
	}

	public void setCoursetitle(String coursetitle) {
		this.coursetitle = coursetitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPricecourse() {
		return pricecourse;
	}

	public void setPricecourse(Double pricecourse) {
		this.pricecourse = pricecourse;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Integer getNumstudent() {
		return numstudent;
	}

	public void setNumstudent(Integer numstudent) {
		this.numstudent = numstudent;
	}

	public Timestamp getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}

	public Timestamp getLasteupdate() {
		return lasteupdate;
	}

	public void setLasteupdate(Timestamp lasteupdate) {
		this.lasteupdate = lasteupdate;
	}


//    public Integer getInstructorId() {
//        return instructorId;
//    }
//
//    public void setInstructorId(Integer instructorId) {
//        this.instructorId = instructorId;
//    }
//  public Integer getCategoryId() {
//  return categoryId;
//}
//
//  public void setCategoryId(Integer categoryId) {
//  this.categoryId = categoryId;
//}

//  public Integer getCertificateId() {
//  return certificateId;
//}
//
//  public void setCertificateId(Integer certificateId) {
//  this.certificateId = certificateId;
//}

	public Instructor getInstructor() {
		return instructor;
	}

	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}


	public String getUrlimg() {
		return urlimg;
	}

	public void setUrlimg(String urlimg) {
		this.urlimg = urlimg;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public void CopyData(Course param) {
		this.id = param.getId();
		this.coursetitle = param.getCoursetitle();
		this.description = param.getDescription();
		this.pricecourse = param.getPricecourse();
		this.language = param.getLanguage();
		this.numstudent = param.getNumstudent();
		this.createdate = param.getCreatedate();
		this.lasteupdate = param.getLasteupdate();
		this.instructor = param.getInstructor();
		this.category = param.getCategory();
		this.urlimg = param.getUrlimg();
		this.status = param.getStatus();
	}

	public CourseLevel getCourseLevel() {
		return courseLevel;
	}

	public void setCourseLevel(CourseLevel courseLevel) {
		this.courseLevel = courseLevel;
	}

	public Boolean getSubmit() {
		return submit;
	}

	public void setSubmit(Boolean submit) {
		this.submit = submit;
	}

	
}
