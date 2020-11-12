package tp.kits3.learntogether.user.service;

/**
 * @author Diep
 *
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.SectionDao;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.Section;
import tp.kits3.learntogether.user.vo.Test;


@Service
public class SectionService {

	@Autowired
	private SectionDao dao;

	@Autowired
	private LessonService lessonService;

	@Autowired
	private TestService testService;
	
	public boolean addSection(Section newSection) {
		dao.add(newSection);
		if (newSection.getId().intValue() > 0) {
			return true;
		}
		return false;
	}

	public List<Section> getSectionByCourseID(int courseID) {
		return dao.getSectionByCourseID(courseID);
	}

	public TreeMap<Section, List<Lesson>> getAllSectionLessonByCourseID(int courseID) {
		List<Section> sectionListByCourseID = getSectionByCourseID(courseID);
		Map<Section, List<Lesson>> sectionLessonsMap = new HashMap<Section, List<Lesson>>();
		for (Section currentSection : sectionListByCourseID) {
			sectionLessonsMap.put(currentSection, lessonService.getLessonsBySectionID(currentSection.getId()));
		}
		TreeMap<Section, List<Lesson>> sorted = new TreeMap<>(sectionLessonsMap);
		return sorted;
	}
	
	public TreeMap<Section, List<Test>> getAllSectionTestByCourseID(int courseID){
		List<Section> sectionListByCourseID = getSectionByCourseID(courseID);
		Map<Section, List<Test>> sectionTestMap = new HashMap<Section, List<Test>>();
		for (Section currentSection : sectionListByCourseID) {
			sectionTestMap.put(currentSection, testService.findAllTestBySectionID(currentSection.getId()));
		}
		TreeMap<Section, List<Test>> sorted = new TreeMap<>(sectionTestMap);
		return sorted;
	}

	public void updateSection(Section section) {
		dao.update(section);
	}
	
	public void deleteSectionByID(int sectionID) {
		dao.delete(sectionID);
	}
	
	/**
	 * @author PhungDinhHuy
	 *
	 */

	public Section findOneSection(int id) {
		return dao.findOne(id);
	}
	
	public List<Section> findAll(){
		return dao.findAll();
	}
	
}
