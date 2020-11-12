package tp.kits3.learntogether.user.vo;

import java.util.List;

public class Instructor {

	private Integer id;

	private Integer userId;

	private Integer experienceYear;

	private Integer numStudent;

	private Integer rateValue;

	private String skillLevel;

	private List<Course> listCourse;

	public Instructor() {
	}

	public List<Course> getListCourse() {
		return listCourse;
	}

	public void setListCourse(List<Course> listCourse) {
		this.listCourse = listCourse;
	}

	public Instructor(Integer userId) {
		this.userId = userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getExperienceyear() {
		return experienceYear;
	}

	public void setExperienceyear(Integer experienceyear) {
		this.experienceYear = experienceyear;
	}

	public Integer getNumstudent() {
		return numStudent;
	}

	public void setNumstudent(Integer numStudent) {
		this.numStudent = numStudent;
	}

	public Integer getRatevalue() {
		return rateValue;
	}

	public void setRatevalue(Integer rateValue) {
		this.rateValue = rateValue;
	}

	public String getSkilllevel() {
		return skillLevel;
	}

	public void setSkilllevel(String skillLevel) {
		this.skillLevel = skillLevel;
	}

	public Instructor(Integer userId, Integer experienceYear, Integer numStudent, Integer rateValue, String skillLevel,
			String aboutMe) {
		super();
		this.userId = userId;
		this.experienceYear = experienceYear;
		this.numStudent = numStudent;
		this.rateValue = rateValue;
		this.skillLevel = skillLevel;
	}

}