package tp.kits3.learntogether.admin.vo;

public class User {

    private Integer id;

    private String email;

    private String username;

    private String password;

    private String fullname;

    private String address;

    private Double amount;
    
    private String birthdate;

    private Role role;

    private String urlimg;

    private boolean status;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getUrlimg() {
        return urlimg;
    }

    public void setUrlimg(String urlimg) {
        this.urlimg = urlimg;
    }

    public void CopyData(User param)
    {
        this.id = param.getId();
        this.email = param.getEmail();
        this.username = param.getUsername();
        this.password = param.getPassword();
        this.fullname = param.getFullname();
        this.address = param.getAddress();
        this.amount = param.getAmount();
        this.birthdate = param.getBirthdate();
        this.role = param.getRole();
        this.urlimg = param.getUrlimg();
    }

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}