package tp.kits3.learntogether.admin.vo;
/**
 * @author NguyenDoanNam
 *
 */
public class Lesson {

    private Integer id;

    private String title;

    private String urlvid;

    private Section section;

    private String urlimg;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrlvid() {
        return urlvid;
    }

    public void setUrlvid(String urlvid) {
        this.urlvid = urlvid;
    }

//    public Integer getSectionId() {
//        return sectionId;
//    }
//
//    public void setSectionId(Integer sectionId) {
//        this.sectionId = sectionId;
//    }

    public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public String getUrlimg() {
        return urlimg;
    }

    public void setUrlimg(String urlimg) {
        this.urlimg = urlimg;
    }

    public void CopyData(Lesson param)
    {
        this.id = param.getId();
        this.title = param.getTitle();
        this.urlvid = param.getUrlvid();
        this.section = param.getSection();
        this.urlimg = param.getUrlimg();
    }
}
