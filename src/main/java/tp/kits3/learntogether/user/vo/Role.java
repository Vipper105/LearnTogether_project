package tp.kits3.learntogether.user.vo;

public class Role {

    private Integer id;

    private String rolename;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public void CopyData(Role param)
    {
        this.id = param.getId();
        this.rolename = param.getRolename();
    }
}
