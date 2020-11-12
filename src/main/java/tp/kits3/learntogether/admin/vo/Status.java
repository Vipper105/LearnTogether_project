package tp.kits3.learntogether.admin.vo;

public class Status {

    private Integer id;

    private String statusName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }


    public void CopyData(Status param)
    {
        this.id = param.getId();
        this.statusName = param.getStatusName();
    }
}
