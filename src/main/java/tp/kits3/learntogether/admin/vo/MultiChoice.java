package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class MultiChoice {


	
    private Integer id;

    private String title;

    private Test test;
   

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

//	public Integer getTest_id() {
//		return test_id;
//	}
//
//	public void setTest_id(Integer test_id) {
//		this.test_id = test_id;
//	}



	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}
	public void CopyData(MultiChoice param)
    {
        this.id = param.getId();
        this.title = param.getTitle();
        this.setTest(param.getTest());
    }


	
	
}
