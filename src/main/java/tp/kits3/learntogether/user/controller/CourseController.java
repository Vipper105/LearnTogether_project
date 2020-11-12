package tp.kits3.learntogether.user.controller;

/**
 * @author VoDucHoa
 *
 */

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tp.kits3.learntogether.user.dto.UserInstructorCourses;
import tp.kits3.learntogether.user.service.CategoryService;
import tp.kits3.learntogether.user.service.UserInstructorCourseSerivce;
import tp.kits3.learntogether.user.vo.Category;


@Controller
public class CourseController {
	@Autowired private UserInstructorCourseSerivce courseservice;
	@Autowired private CategoryService cateservice;


	/**
	 * @author pho
	 */
	@RequestMapping(value = "/courses", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<Category> cate = cateservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		
		int sumpages =(int)Math.ceil(1.0*courseservice.getSizeAllView()/8);
		model.addAttribute("sumpages", sumpages);
		
		int page = (1-1)*3;
		List<UserInstructorCourses> listcourse = courseservice.getAllLimit(page);
		model.addAttribute("ListCourses", listcourse);
		listcourse.get(0).getCourse().getAverage();
		return "courses";
	}
	
	@RequestMapping(value = "/courses/pages/{number}", method = RequestMethod.GET)
	public String home1(Model model, @PathVariable (value="number") int number) {
	
		List<Category> cate = cateservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate); 
		
		int sumpages =(int)Math.ceil(1.0*courseservice.getSizeAllView()/8);
		model.addAttribute("sumpages", sumpages);
		
		int page = (number-1)*3; List<UserInstructorCourses>
		listcourse = courseservice.getAllLimit(page);
		model.addAttribute("ListCourses", listcourse);
		
		return "courses"; 
	}
	
}
