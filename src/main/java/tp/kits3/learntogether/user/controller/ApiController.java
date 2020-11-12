package tp.kits3.learntogether.user.controller;

/**
 * @author pho
 *
 */

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import tp.kits3.learntogether.user.dto.UserInstructorCourses;
import tp.kits3.learntogether.user.service.RatingService;
import tp.kits3.learntogether.user.service.UserInstructorCourseSerivce;

@Controller
@RequestMapping(value = "/api")
public class ApiController {

	
	@Autowired private UserInstructorCourseSerivce courseservice;
	@Autowired private RatingService ratingService;

	
	@RequestMapping(value = "/courcate", method = RequestMethod.GET)
	@ResponseBody 
	public List<UserInstructorCourses> courcate(@RequestParam(value="id") int id, Model model) { 
		List<UserInstructorCourses> courInstructor = courseservice.getCourOneCate(id);
	
		return courInstructor; 
	}

	
}
