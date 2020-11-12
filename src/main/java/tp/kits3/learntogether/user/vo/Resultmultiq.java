package tp.kits3.learntogether.user.vo;

public class Resultmultiq {
	private Integer id;

	private Double score;

	private Boolean userAnswer;

	private Integer times_do_test;

	private Integer multichoiceQuestionId;

	private Integer userId;

	private Integer testId;

	public Integer getTimes_do_test() {
		return times_do_test;
	}

	public void setTimes_do_test(Integer times_do_test) {
		this.times_do_test = times_do_test;
	}

	public Integer getTestId() {
		return testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Boolean getUseranswer() {
		return userAnswer;
	}

	public void setUseranswer(Boolean useranswer) {
		this.userAnswer = useranswer;
	}

	public Integer getMultichoicequestionid() {
		return multichoiceQuestionId;
	}

	public void setMultichoicequestionid(Integer multichoicequestionid) {
		this.multichoiceQuestionId = multichoicequestionid;
	}

	public Integer getUserid() {
		return userId;
	}

	public void setUserid(Integer userid) {
		this.userId = userid;
	}

	// Resultmultiq 모�?� 복사
	public void CopyData(Resultmultiq param) {
		this.id = param.getId();
		this.score = param.getScore();
		this.userAnswer = param.getUseranswer();
		this.multichoiceQuestionId = param.getMultichoicequestionid();
		this.userId = param.getUserid();
	}
}
