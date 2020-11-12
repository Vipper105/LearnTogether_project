package tp.kits3.learntogether.user.interfaces;

import tp.kits3.learntogether.user.vo.Instructor;

public interface IInstructor <T extends Instructor> extends IService<T>{

	T selectInstructorByUserID(int userID);
}
