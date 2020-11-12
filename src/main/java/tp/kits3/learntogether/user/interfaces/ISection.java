package tp.kits3.learntogether.user.interfaces;

import java.util.List;
import tp.kits3.learntogether.user.vo.Section;

public interface ISection <T extends Section> extends IService<T>{

	List<T> getSectionByCourseID(int courseID);
}
