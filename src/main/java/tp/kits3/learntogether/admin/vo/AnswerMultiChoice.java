package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class AnswerMultiChoice { 

	private Integer id;
	
	private MultiChoice multichoice; 

	private String answerContent;

	private boolean isCorrect;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//    public Integer getQuestion_id() {
//		return question_id;
//	}
//
//	public void setQuestion_id(Integer question_id) {
//		this.question_id = question_id;
//	}


	public String getAnswerContent() {
		return answerContent;
	}


	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public MultiChoice getMultichoice() {
		return multichoice;
	}

	public void setMultichoice(MultiChoice multichoice) {
		this.multichoice = multichoice;
	}

	public boolean isCorrect() {
		return isCorrect;
	}

	public void setCorrect(boolean isCorrect) {
		this.isCorrect = isCorrect;
	}



}
