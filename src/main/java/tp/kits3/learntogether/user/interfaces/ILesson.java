package tp.kits3.learntogether.user.interfaces;

import java.util.List;
import tp.kits3.learntogether.user.vo.Lesson;

public interface ILesson  <T extends Lesson> extends IService<T>{

	List<T> getLessonsBySectionID(int sectionID);
	int calculateTotalVideoDurationByCourseID(int courseID);
}
