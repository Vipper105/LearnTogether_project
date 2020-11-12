package tp.kits3.learntogether.user.vo;

public class AnswerEssayq {

	private Integer id;

    private String answerContent;

    private Integer essayId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnswercontent() {
        return answerContent;
    }

    public void setAnswercontent(String answercontent) {
        this.answerContent = answercontent;
    }

    public Integer getEssayid() {
        return essayId;
    }

    public void setEssayid(Integer essayid) {
        this.essayId = essayid;
    }

   
    // AnswerEssayq 모�?� 복사
    public void CopyData(AnswerEssayq param)
    {
        this.id = param.getId();
        this.answerContent = param.getAnswercontent();
        this.essayId = param.getEssayid();
      
    }
}