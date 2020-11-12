package tp.kits3.learntogether.user.vo;

public class EssayQuestion {
	private Integer id;

	private String title;

	private Integer testId;

	private Double score;

	private EssayQuestion essayQuestion;

	private AnswerEssayq answerEssayq;

	private Resultessayq resultessayq;

	public EssayQuestion() {
	}

	public AnswerEssayq getAnswerEssayq() {
		return answerEssayq;
	}

	public void setAnswerEssayq(AnswerEssayq answerEssayq) {
		this.answerEssayq = answerEssayq;
	}

	public EssayQuestion getEssayQuestion() {
		return essayQuestion;
	}

	public void setEssayQuestion(EssayQuestion essayQuestion) {
		this.essayQuestion = essayQuestion;
	}

	public Resultessayq getResultessayq() {
		return resultessayq;
	}

	public void setResultessayq(Resultessayq resultessayq) {
		this.resultessayq = resultessayq;
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

	public Integer getTestid() {
		return testId;
	}

	public void setTestid(Integer testid) {
		this.testId = testid;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	// EssayQuestion 모�?� 복사
	public void CopyData(EssayQuestion param) {
		this.id = param.getId();
		this.title = param.getTitle();
		this.testId = param.getTestid();
		this.score = param.getScore();
	}
}
