package tp.kits3.learntogether.user.vo;

import java.util.List;

public class Section implements Comparable<Section>{

	private Integer id;

	private String title;

	private String description;

	private Integer courseId;

	private List<Test> listTest;
	
	public Section() {
		this.title = "Introduction";
	}

	public List<Test> getListTest() {
		return listTest;
	}

	public void setListTest(List<Test> listTest) {
		this.listTest = listTest;
	}

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

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public void CopyData(Section param) {
		this.id = param.getId();
		this.title = param.getTitle();
		this.description = param.getDescription();
		this.courseId = param.getCourseId();
	}
	
	@Override
	public int compareTo(Section section) {
		return (int) this.id - section.id;
	}
}
