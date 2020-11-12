package tp.kits3.learntogether.user.dto;

/*
 * @author Cong 
 * 
 */

import tp.kits3.learntogether.user.vo.Rating;

public class MyCourses {
	private int id;
	private String courseTitle;
	private String description;
	private String urlImg;
	private int user_id;
	private double priceCourse;
	private Rating rating;
	
	public MyCourses() {
		super();
	}
	
	public MyCourses(int id, String courseTitle, String description, String urlImg, int user_id, double priceCourse) {
		super();
		this.id = id;
		this.courseTitle = courseTitle;
		this.description = description;
		this.urlImg = urlImg;
		this.user_id = user_id;
		this.priceCourse = priceCourse;
	}
	
	public Rating getRating() {
		return rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	public double getPriceCourse() {
		return priceCourse;
	}

	public void setPriceCourse(double priceCourse) {
		this.priceCourse = priceCourse;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCourseTitle() {
		return courseTitle;
	}
	
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getUrlImg() {
		return urlImg;
	}
	
	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	
	
	
	
}
