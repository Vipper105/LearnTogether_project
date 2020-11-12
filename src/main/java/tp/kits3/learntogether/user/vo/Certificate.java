package tp.kits3.learntogether.user.vo;

public class Certificate {

    private Integer id;

    private String certificatename;

    private String provider;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCertificatename() {
        return certificatename;
    }

    public void setCertificatename(String certificatename) {
        this.certificatename = certificatename;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }
  
    public void CopyData(Certificate param)
    {
        this.id = param.getId();
        this.certificatename = param.getCertificatename();
        this.provider = param.getProvider();
    }
}
