package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
import java.sql.Timestamp;

public class Certificates_user {

    private Integer id;

    private Certificate certificate;

    private User user;

    private Timestamp date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

 
    
//    public Integer getCertificateId() {
//        return certificateId;
//    }
//
//    public void setCertificateId(Integer certificateId) {
//        this.certificateId = certificateId;
//    }
 
//    public Integer getUserId() {
//        return userId;
//    }
//
//    public void setUserId(Integer userId) {
//        this.userId = userId;
//    }

	
	public Certificate getCertificate() {
		return certificate;
	}

	public void setCertificate(Certificate certificate) {
		this.certificate = certificate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    
    public void CopyData(Certificates_user param)
    {
        this.id = param.getId();
        this.certificate = param.getCertificate();
        this.user = param.getUser();
        this.date = param.getDate();
    }
}
