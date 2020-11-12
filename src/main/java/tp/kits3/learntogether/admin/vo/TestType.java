package tp.kits3.learntogether.admin.vo;

public class TestType {
	    private Integer id;

	    private String type;

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

	    public void CopyData(TestType param)
	    {
	        this.id = param.getId();
	        this.type = param.getType();
	    }
	}
