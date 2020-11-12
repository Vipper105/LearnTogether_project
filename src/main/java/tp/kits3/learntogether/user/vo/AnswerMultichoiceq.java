package tp.kits3.learntogether.user.vo;

public class AnswerMultichoiceq {

	private Integer id;

	private Integer multichoiceId;

	private String answerContent;

	private Boolean isCorrect;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMultichoiceid() {
		return multichoiceId;
	}

	public void setMultichoiceid(Integer multichoiceid) {
		this.multichoiceId = multichoiceid;
	}

	public String getAnswercontent() {
		return answerContent;
	}

	public void setAnswercontent(String answercontent) {
		this.answerContent = answercontent;
	}

	public Boolean getIscorrect() {
		return isCorrect;
	}

	public void setIscorrect(Boolean iscorrect) {
		this.isCorrect = iscorrect;
	}

	// AnswerMultichoiceq 모�?� 복사
	public void CopyData(AnswerMultichoiceq param) {
		this.id = param.getId();
		this.multichoiceId = param.getMultichoiceid();
		this.answerContent = param.getAnswercontent();
		this.isCorrect = param.getIscorrect();
	}
}
