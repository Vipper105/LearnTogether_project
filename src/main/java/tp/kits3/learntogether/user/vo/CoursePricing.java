package tp.kits3.learntogether.user.vo;

public class CoursePricing {
	
    private Integer id;

    private Double price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void CopyData(CoursePricing param)
    {
        this.id = param.getId();
        this.price = param.getPrice();
    }

}
