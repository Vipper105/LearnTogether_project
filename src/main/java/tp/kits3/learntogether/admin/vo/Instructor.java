package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class Instructor {

    private Integer id;

    private User user;

    private Integer experienceyear;

    private Integer numstudent;

    private Integer ratevalue;

    private String skilllevel;

    private String urlimg;

    private String aboutMe;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
 
//    public Integer getUserId() {
//        return userId;
//    }
//
//    public void setUserId(Integer userId) {
//        this.userId = userId;
//    }

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getExperienceyear() {
        return experienceyear;
    }

    public void setExperienceyear(Integer experienceyear) {
        this.experienceyear = experienceyear;
    }

    public Integer getNumstudent() {
        return numstudent;
    }

    public void setNumstudent(Integer numstudent) {
        this.numstudent = numstudent;
    }

    public Integer getRatevalue() {
        return ratevalue;
    }

    public void setRatevalue(Integer ratevalue) {
        this.ratevalue = ratevalue;
    }

    public String getSkilllevel() {
        return skilllevel;
    }

    public void setSkilllevel(String skilllevel) {
        this.skilllevel = skilllevel;
    }

    public String getUrlimg() {
        return urlimg;
    }

    public void setUrlimg(String urlimg) {
        this.urlimg = urlimg;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public void CopyData(Instructor param)
    {
        this.id = param.getId();
        this.user = param.getUser();
        this.experienceyear = param.getExperienceyear();
        this.numstudent = param.getNumstudent();
        this.ratevalue = param.getRatevalue();
        this.skilllevel = param.getSkilllevel();
        this.urlimg = param.getUrlimg();
        this.aboutMe = param.getAboutMe();
    }

	
}