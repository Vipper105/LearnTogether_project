package tp.kits3.learntogether.user.interfaces;

/**
 * @author VoDucHoa
 */

import java.util.List;
import tp.kits3.learntogether.user.vo.Course;

public interface ICourses <T extends Course> extends IService<T> {

	List<T> getDraftCoursesByInstructorID (int instructorID);
	
	List<Course> selectCoursesByInstructorID(int instructorID);
}
