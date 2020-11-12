package tp.kits3.learntogether.user.vo;

import java.sql.Timestamp;

public class Certificates_user {

    private Integer id;

    private Integer certificateId;

    private Integer userId;

    private Timestamp date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCertificateId() {
        return certificateId;
    }

    public void setCertificateId(Integer certificateId) {
        this.certificateId = certificateId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
        this.certificateId = param.getCertificateId();
        this.userId = param.getUserId();
        this.date = param.getDate();
    }
}
