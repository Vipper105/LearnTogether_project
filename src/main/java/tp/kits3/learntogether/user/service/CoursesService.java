package tp.kits3.learntogether.user.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.CoursesDao;
import tp.kits3.learntogether.user.vo.Course;

/**
 * @author VoDucHoa
 */
@Service
public class CoursesService {
	@Autowired
	private CoursesDao coursesdao;
	

	public List<Course> getAll() {
		List<Course> listcourse = coursesdao.findAll();
		return listcourse;
	}

	public Course getCourOne(int id) {
		Course liscourse = coursesdao.findOne(id);
		return liscourse;
	}



	/**
	 * @author PhungDinhHuy
	 */
	public List<Course> findCoursesByInstructorID(int id) {
		return coursesdao.selectCoursesByInstructorID(id);
	}
	
	public Course findCourseByID(int id) {
		return coursesdao.findOne(id);
		
	}
	

}
