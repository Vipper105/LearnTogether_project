package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class ResultEssay {

    private Integer id;

    private String score;

    private Essay essay;

    private Instructor instructor;

    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

//    public Integer getEssayId() {
//        return essayId;
//    }
//
//    public void setEssayId(Integer essayId) {
//        this.essayId = essayId;
//    }
//
//    public Integer getInstructorId() {
//        return instructorId;
//    }
//
//    public void setInstructorId(Integer instructorId) {
//        this.instructorId = instructorId;
//    }
//
//    public Integer getUserId() {
//        return userId;
//    }
//
//    public void setUserId(Integer userId) {
//        this.userId = userId;
//    }

	public Essay getEssay() {
		return essay;
	}

	public void setEssay(Essay essay) {
		this.essay = essay;
	}

	public Instructor getInstructor() {
		return instructor;
	}

	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void CopyData(ResultEssay param)
    {
        this.id = param.getId();
        this.score = param.getScore();
        this.essay = param.getEssay();
        this.instructor = param.getInstructor();
        this.user = param.getUser();
    }


}
