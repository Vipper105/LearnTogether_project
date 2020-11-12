package tp.kits3.learntogether.user.vo;

import java.sql.Date;

public class User {

	private Integer id;

	private String email;

	private String userName;

	private String password;

	private String fullName;

	private String address;

	private Double amount;

	private Date birthDate;

	private Integer roleId;

	private String urlImg;
	
	private Double amountAdmin;
	
	private String headLine;
	
	private Date createDay;
	
	private String biography;
	
	private String userNameFb;
	
	private String token;
	
	public User() {
		super();
	}
	
	public User(String fullName, String email, String password) {
		this.fullName = fullName;
		this.email = email;
		this.password = password;
	}

	public void setCreatDay(Date createDay) {
		this.createDay = createDay;
	}


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
		return userName;
	}

	public void setUsername(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullName;
	}

	public void setFullname(String fullName) {
		this.fullName = fullName;
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

	public Date getBirthdate() {
		return birthDate;
	}

	public void setBirthdate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getUrlimg() {
		return urlImg;
	}

	public void setUrlimg(String urlImg) {
		this.urlImg = urlImg;
	}

	public String getHeadLine() {
		return headLine;
	}

	public void setHeadLine(String headLine) {
		this.headLine = headLine;
	}

	public Double getAmountAdmin() {
		return amountAdmin;
	}

	public void setAmountAdmin(Double amountAdmin) {
		this.amountAdmin = amountAdmin;
	}

	public Date getCreateDay() {
		return createDay;
	}

	public void setCreateDay(Date createDay) {
		this.createDay = createDay;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getUserNameFb() {
		return userNameFb;
	}

	public void setUserNameFb(String userNameFb) {
		this.userNameFb = userNameFb;
	}
	
	public User(Integer id, String email, String userName, String password, String fullName, String address,
			Double amount, Date birthDate, Integer roleId, String urlImg, Double amountAdmin, String headLine,
			String biography, String userNameFb, Date createDay) {
		super();
		this.id = id;
		this.email = email;
		this.userName = userName;
		this.password = password;
		this.fullName = fullName;
		this.address = address;
		this.amount = amount;
		this.birthDate = birthDate;
		this.roleId = roleId;
		this.urlImg = urlImg;
		this.amountAdmin = amountAdmin;
		this.headLine = headLine;
		this.biography = biography;
		this.userNameFb = userNameFb;
		this.createDay = createDay;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
}