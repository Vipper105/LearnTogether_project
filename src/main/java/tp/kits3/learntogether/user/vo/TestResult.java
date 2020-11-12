package tp.kits3.learntogether.user.vo;

import java.sql.Timestamp;

public class TestResult {
	private Integer id;

	private Integer userId;

	private Integer instructorId;

	private Double score;

	private Integer testId;

	private Timestamp dateTest;

	private Integer timesDoTest;

	Test test; 
	
	public TestResult() {}
	
	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userId;
	}

	public void setUserid(Integer userid) {
		this.userId = userid;
	}

	public Integer getInstructorid() {
		return instructorId;
	}

	public void setInstructorid(Integer instructorid) {
		this.instructorId = instructorid;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Integer getTestid() {
		return testId;
	}

	public void setTestid(Integer testid) {
		this.testId = testid;
	}

	public Timestamp getDatetest() {
		return dateTest;
	}

	public void setDatetest(Timestamp datetest) {
		this.dateTest = datetest;
	}

	public Integer getTimesdotest() {
		return timesDoTest;
	}

	public void setTimesdotest(Integer timesdotest) {
		this.timesDoTest = timesdotest;
	}

	// TestResult 모�?� 복사
	public void CopyData(TestResult param) {
		this.id = param.getId();
		this.userId = param.getUserid();
		this.instructorId = param.getInstructorid();
		this.score = param.getScore();
		this.testId = param.getTestid();
		this.dateTest = param.getDatetest();
		this.timesDoTest = param.getTimesdotest();
	}
}
