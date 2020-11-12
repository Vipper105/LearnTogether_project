package tp.kits3.learntogether.user.vo;

public class Category {

    private Integer id;

    private String categoryName;
    
    private String urlimg;
    
    public String getUrlimg() {
		return urlimg;
	}

	public void setUrlimg(String urlimg) {
		this.urlimg = urlimg;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryname(String categoryName) {
        this.categoryName = categoryName;
    }

    public void CopyData(Category param)
    {
        this.id = param.getId();
        this.categoryName = param.getCategoryName();
    }
}
