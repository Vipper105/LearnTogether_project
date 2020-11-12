package tp.kits3.learntogether.user.controller;

import java.util.List;
import java.util.Locale;

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
public class UserInstructorCourseController {

	/**
	 * @author pho
	 *
	 */
	@Autowired
	private CategoryService cateservice;
	@Autowired
	private UserInstructorCourseSerivce courseservice;

	@RequestMapping(value = "/courses/{ten}", method = RequestMethod.GET)
	public String development(Locale locale, Model model, @PathVariable("ten") String ten) {
		List<Category> cate = cateservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		for (int i = 0; i < cateservice.getCategoryList().size(); i++) {
			if(ten.equalsIgnoreCase(cateservice.getCategoryList().get(i).getCategoryName())) {
				int id = cateservice.getCategoryList().get(i).getId();
				String cateName = cateservice.getCategoryList().get(i).getCategoryName();
				model.addAttribute("cateName", cateName);
				List<UserInstructorCourses> cour = courseservice.getCourOneCate(id);
				model.addAttribute("cour", cour); 
			}
		}
		return "courses_follow_category";
	}


}
