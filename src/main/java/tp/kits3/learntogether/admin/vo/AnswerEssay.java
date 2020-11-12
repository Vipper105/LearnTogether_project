package tp.kits3.learntogether.admin.vo;

/**
 * @author NguyenDoanNam
 *
 */
public class AnswerEssay {

    private Integer id;

    private String answer;

    private Essay essay;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

 
//    public Integer getUser_id() {
//		return user_id;
//	}
//
//	public void setUser_id(Integer user_id) {
//		this.user_id = user_id;
//	}
//
//	public Integer getEssay_id() {
//		return essay_id;
//	}
//
//	public void setEssay_id(Integer essay_id) {
//		this.essay_id = essay_id;
//	}

   

	public Essay getEssay() {
		return essay;
	}

	public void setEssay(Essay essay) {
		this.essay = essay;
	}

	public void CopyData(AnswerEssay param)
    {
        this.id = param.getId();
        this.answer = param.getAnswer();
        this.essay = param.getEssay();
    }

	
	
}