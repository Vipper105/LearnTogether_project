package tp.kits3.learntogether.user.vo;

public class TestType {
	
	private Integer id;

    private String type;
    
    public TestType() {}
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    // TestType ëª¨ë?¸ ë³µì‚¬
    public void CopyData(TestType param)
    {
        this.id = param.getId();
        this.type = param.getType();
    }
}
