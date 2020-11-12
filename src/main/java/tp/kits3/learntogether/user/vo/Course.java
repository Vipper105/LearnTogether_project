package tp.kits3.learntogether.user.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class Course implements Serializable, Comparable<Course> {

	private static final long serialVersionUID = 1L;

	private Integer id;

	private String courseTitle;

	private String description;

	private Double priceCourse;
	
	private Boolean isFree;
	
	private String language;

	private Integer courseLevelId;

	private Integer numStudent;

	private Timestamp createDate;

	private Timestamp lastedUpdate;

	private Integer instructorId;

	private Integer categoryId;

	private String urlImg;

	private Boolean status;

	private Boolean submit;
	
	private Boolean isLessonNoVideo;
	
	private Integer totalVideoDuration;
	
	private List<Section> listSection;
	
	private List<Lesson> lessonList;

	private Map<Section, List<Lesson>> sectionLessonMap;

	private Map<Section, List<Test>> sectionTestMap;

	private List<Rating> ratingList;
	
	private Float average;
	
	private Integer count;
	
	private User user;
	
	private CourseLevel courseLevel;
	
	private int totalPurchased;
	
	public Course() {
    	Date now = new Date();
		this.createDate = new Timestamp(now.getTime());
		this.lastedUpdate = new Timestamp(now.getTime());
		this.language = "English (US)";
		this.urlImg = "course-placeholder.png";
		this.description = "";
		this.setNumStudent(0);
		this.setFree(false);
		this.setPriceCourse(0.0);
		this.setStatus(false);
		this.setSubmit(false);
		this.setLessonNoVideo(false);
    }

	public Course(String courseTitle, String description, Double priceCourse, String language, Integer courseLevelId,
			Integer numStudent, Integer instructorId, Integer categoryId, String urlImg, Boolean status) {
		this();
		this.courseTitle = courseTitle;
		this.description = description;
		this.priceCourse = priceCourse;
		this.language = language;
		this.courseLevelId = courseLevelId;
		this.numStudent = numStudent;
		this.instructorId = instructorId;
		this.categoryId = categoryId;
		this.urlImg = urlImg;
		this.status = status;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Float getAverage() {
		return average;
	}

	public void setAverage(Float average) {
		this.average = average;
	}

	public List<Rating> getRatingList() {
		return ratingList;
	}

	public void setRatingList(List<Rating> ratingList) {
		this.ratingList = ratingList;
	}
	
	public List<Section> getListSection() {
		return listSection;
	}

	public void setListSection(List<Section> listSection) {
		this.listSection = listSection;
	}
	
	public void addSectionIntoList(Section section) {
		this.listSection.add(section);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPriceCourse() {
		return priceCourse;
	}

	public void setPriceCourse(Double priceCourse) {
		this.priceCourse = priceCourse;
	}

	public Boolean isFree() {
		return isFree;
	}

	public void setFree(Boolean isFree) {
		this.isFree = isFree;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Integer getCourseLevelId() {
		return courseLevelId;
	}

	public void setCourseLevelId(Integer courseLevelId) {
		this.courseLevelId = courseLevelId;
	}

	public Integer getNumStudent() {
		return numStudent;
	}

	public void setNumStudent(Integer numStudent) {
		this.numStudent = numStudent;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate() {
		Date now = new Date();
		this.createDate = new Timestamp(now.getTime());
	}

	public Timestamp getLastedUpdate() {
		return lastedUpdate;
	}

	public void setLastedUpdate() {
		Date now = new Date();
		this.lastedUpdate = new Timestamp(now.getTime());
	}

	public Integer getInstructorId() {
		return instructorId;
	}

	public void setInstructorId(Integer instructorId) {
		this.instructorId = instructorId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getUrlImg() {
		return urlImg;
	}

	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public Boolean getSubmit() {
		return submit;
	}

	public void setSubmit(Boolean submit) {
		this.submit = submit;
	}

	@Override
	public int compareTo(Course course) {
		return (int) this.id - course.id;
	}

	public List<Lesson> getLessonList() {
		return lessonList;
	}

	public void setLessonList(List<Lesson> lessonList) {
		this.lessonList = lessonList;
	}
	
	public void addLessonIntoList(Lesson lesson) {
		this.lessonList.add(lesson);
	}

	public Boolean isLessonNoVideo() {
		return isLessonNoVideo;
	}

	public void setLessonNoVideo(Boolean isLessonNoVideo) {
		this.isLessonNoVideo = isLessonNoVideo;
	}

	public Integer getTotalVideoDuration() {
		return totalVideoDuration;
	}

	public void setTotalVideoDuration(Integer totalVideoDuration) {
		this.totalVideoDuration = totalVideoDuration;
	}

	public Map<Section, List<Lesson>> getSectionLessonMap() {
		return sectionLessonMap;
	}

	public void setSectionLessonMap(Map<Section, List<Lesson>> sectionLessonMap) {
		this.sectionLessonMap = sectionLessonMap;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public int getTotalPurchased() {
		return totalPurchased;
	}

	public void setTotalPurchased(int totalPurchased) {
		this.totalPurchased = totalPurchased;
	}

	public CourseLevel getCourseLevel() {
		return courseLevel;
	}

	public void setCourseLevel(CourseLevel courseLevel) {
		this.courseLevel = courseLevel;
	}

	public Map<Section, List<Test>> getSectionTestMap() {
		return sectionTestMap;
	}

	public void setSectionTestMap(Map<Section, List<Test>> sectionTestMap) {
		this.sectionTestMap = sectionTestMap;
	}


}
