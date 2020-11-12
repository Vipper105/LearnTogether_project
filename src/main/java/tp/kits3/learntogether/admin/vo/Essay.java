package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class Essay {

	private Integer id;

	private String title;

	private Test test;
	
	private Double score;

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

//    public Integer getTestId() {
//        return testId;
//    }
//
//    public void setTestId(Integer testId) {
//        this.testId = testId;
//    }

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public void CopyData(Essay param) {
		this.id = param.getId();
		this.title = param.getTitle();
		this.test = param.getTest();
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}


}
