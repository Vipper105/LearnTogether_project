package tp.kits3.learntogether.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.InstructorDao;
import tp.kits3.learntogether.user.vo.Instructor;

@Service
public class InstructorService {

	@Autowired
	private InstructorDao dao;

	public boolean addInstructor(Instructor newInstructor) {
		dao.add(newInstructor);
		if(newInstructor.getId().intValue() > 0) {
			return true;
		}
		return false;
	}
	
	public Instructor getInstructorByUserID(int userID) {
		return dao.selectInstructorByUserID(userID);
	}

}
