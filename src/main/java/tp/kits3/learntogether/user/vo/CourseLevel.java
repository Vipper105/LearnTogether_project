package tp.kits3.learntogether.user.vo;

public class CourseLevel {

	private Integer id;

	private String levelName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelname(String levelName) {
		this.levelName = levelName;
	}

	public void CopyData(CourseLevel param) {
		this.id = param.getId();
		this.levelName = param.getLevelName();
	}
}
