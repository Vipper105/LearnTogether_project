package tp.kits3.learntogether.user.vo;

import java.util.List;

public class MultichoiceQuestion {
	private Integer id;

	private String title;

	private Integer testid;

	private List<AnswerMultichoiceq> listAnswer;

	public MultichoiceQuestion() {
	}

	public List<AnswerMultichoiceq> getListAnswer() {
		return listAnswer;
	}

	public void setListAnswer(List<AnswerMultichoiceq> listAnswer) {
		this.listAnswer = listAnswer;
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
		return testid;
	}

	public void setTestid(Integer testid) {
		this.testid = testid;
	}

	// MultichoiceQuestion ëª¨ë?¸ ë³µì‚¬
	public void CopyData(MultichoiceQuestion param) {
		this.id = param.getId();
		this.title = param.getTitle();
		this.testid = param.getTestid();
	}
}
