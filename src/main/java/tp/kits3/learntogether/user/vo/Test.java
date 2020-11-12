package tp.kits3.learntogether.user.vo;

import java.sql.Date;
import java.util.List;

public class Test {

	private Integer id;

	private String title;

	private Integer numQuestion;

	private Double score;

	private Integer sectionId;

	private Date updateDate;

	private Integer typeId;

	private Integer time;

	private List<MultichoiceQuestion> listQuestionMultichoice;

	private List<EssayQuestion> listEssayQuestion;

	private List<Resultessayq> listResultessayq;

	private List<Resultmultiq> listResultmultiqs;

	private TestType testType;

	public Test() {
	}

	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public List<Resultmultiq> getListResultmultiqs() {
		return listResultmultiqs;
	}

	public void setListResultmultiqs(List<Resultmultiq> listResultmultiqs) {
		this.listResultmultiqs = listResultmultiqs;
	}

	public TestType getTestType() {
		return testType;
	}

	public void setTestType(TestType testType) {
		this.testType = testType;
	}

	public List<Resultessayq> getListResultessayq() {
		return listResultessayq;
	}

	public void setListResultessayq(List<Resultessayq> listResultessayq) {
		this.listResultessayq = listResultessayq;
	}

	public List<EssayQuestion> getListEssayQuestion() {
		return listEssayQuestion;
	}

	public void setListEssayQuestion(List<EssayQuestion> listEssayQuestion) {
		this.listEssayQuestion = listEssayQuestion;
	}

	public List<MultichoiceQuestion> getListQuestionMultichoice() {
		return listQuestionMultichoice;
	}

	public void setListQuestionMultichoice(List<MultichoiceQuestion> listQuestionMultichoice) {
		this.listQuestionMultichoice = listQuestionMultichoice;
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

	public Integer getNumquestion() {
		return numQuestion;
	}

	public void setNumquestion(Integer numquestion) {
		this.numQuestion = numquestion;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Integer getSectionid() {
		return sectionId;
	}

	public void setSectionid(Integer sectionid) {
		this.sectionId = sectionid;
	}

	public Date getUpdatedate() {
		return updateDate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updateDate = updatedate;
	}

	public Integer getTypeid() {
		return typeId;
	}

	public void setTypeid(Integer typeid) {
		this.typeId = typeid;
	}

	// Test 모�?� 복사
	public void CopyData(Test param) {
		this.id = param.getId();
		this.title = param.getTitle();
		this.numQuestion = param.getNumquestion();
		this.score = param.getScore();
		this.sectionId = param.getSectionid();
		this.updateDate = param.getUpdatedate();
		this.typeId = param.getTypeid();
	}
}
