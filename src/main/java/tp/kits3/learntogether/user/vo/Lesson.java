package tp.kits3.learntogether.user.vo;

public class Lesson {

    private Integer id;

    private String title;
    
    private String description;

    private String urlVid;

    private Integer sectionId;

    private String urlImg;

    private Integer videoDuration;
    
    public Lesson() {
    }
    
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

    public String getUrlVid() {
        return urlVid;
    }

    public void setUrlVid(String urlVid) {
        this.urlVid = urlVid;
    }

    public Integer getSectionId() {
        return sectionId;
    }

    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlimg(String urlImg) {
        this.urlImg = urlImg;
    }

    public void CopyData(Lesson param)
    {
        this.id = param.getId();
        this.title = param.getTitle();
        this.urlVid = param.getUrlVid();
        this.sectionId = param.getSectionId();
        this.urlImg = param.getUrlImg();
    }

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getVideoDuration() {
		return videoDuration;
	}

	public void setVideoDuration(Integer videoDuration) {
		this.videoDuration = videoDuration;
	}
}
