package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class ResultMultichoice {

    private Integer id;

    private Integer score;

    private MultiChoice multichoice;

	private Instructor instructor;

    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
    

//    public Integer getMultichoiceId() {
//        return multichoiceId;
//    }
//
//    public void setMultichoiceId(Integer multichoiceId) {
//        this.multichoiceId = multichoiceId;
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

    public MultiChoice getMultichoice() {
		return multichoice;
	}

	public void setMultichoice(MultiChoice multichoice) {
		this.multichoice = multichoice;
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

	public void CopyData(ResultMultichoice param)
    {
        this.id = param.getId();
        this.score = param.getScore();
        this.multichoice = param.getMultichoice();
        this.instructor = param.getInstructor();
        this.user = param.getUser();
    }
}