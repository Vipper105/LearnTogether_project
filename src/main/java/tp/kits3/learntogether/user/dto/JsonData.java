package tp.kits3.learntogether.user.dto;

/**
 *  
 * @author: PhungDinhHuy
 * 
 */

public class JsonData {

	private double score;
	private int questionID;
	private int index;

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getQuestionID() {
		return questionID;
	}

	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

}
