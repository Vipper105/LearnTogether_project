package tp.kits3.learntogether.user.vo;

public class Resultessayq {
	private Integer id;

	private Double score;

	private String userAnswer;

	private Integer times_do_test;

	private String comment;

	private Integer essayQuestionId;

	private Integer userId;

	private Integer testId;

	private EssayQuestion essayQuestion;

	private User user;

	public Resultessayq() {
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public EssayQuestion getEssayQuestion() {
		return essayQuestion;
	}

	public void setEssayQuestion(EssayQuestion essayQuestion) {
		this.essayQuestion = essayQuestion;
	}

	public Integer getId() {
		return id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	public String getUseranswer() {
		return userAnswer;
	}

	public void setUseranswer(String useranswer) {
		this.userAnswer = useranswer;
	}

	public Integer getTimesDoTest() {
		return times_do_test;
	}

	public void setTimesDoTest(Integer timesDoTest) {
		this.times_do_test = timesDoTest;
	}

	public Integer getEssayquestionid() {
		return essayQuestionId;
	}

	public void setEssayquestionid(Integer essayquestionid) {
		this.essayQuestionId = essayquestionid;
	}

	public Integer getUserid() {
		return userId;
	}

	public void setUserid(Integer userid) {
		this.userId = userid;
	}

	public Integer getTestid() {
		return testId;
	}

	public void setTestid(Integer testid) {
		this.testId = testid;
	}

	// Resultessayq 모델 복사
	public void CopyData(Resultessayq param) {
		this.id = param.getId();
		this.score = param.getScore();
		this.userAnswer = param.getUseranswer();
		this.times_do_test = param.getTimesDoTest();
		this.comment = param.getComment();
		this.essayQuestionId = param.getEssayquestionid();
		this.userId = param.getUserid();
		this.testId = param.getTestid();
	}
}
