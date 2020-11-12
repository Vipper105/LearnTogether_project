package tp.kits3.learntogether.user.controller;

/**
 * @author VoVanPho
 * 
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tp.kits3.learntogether.user.service.CategoryService;
import tp.kits3.learntogether.user.service.CourseService_Diep;
import tp.kits3.learntogether.user.service.SectionLessionCourseService;
import tp.kits3.learntogether.user.service.UserInstructorCourseSerivce;
import tp.kits3.learntogether.user.vo.Course;

@Controller
public class SectionLessionCourseController {
	
	@Autowired private SectionLessionCourseService seclescourservice;
	@Autowired private UserInstructorCourseSerivce userintscourservice;
	@Autowired private CategoryService cateservice;
	@Autowired private CourseService_Diep courseService;
	
	/*
	 * @RequestMapping(value = "/product/{id}", method = RequestMethod.GET ) public
	 * String SectionLessionCourse(@PathVariable("id") Integer id, Model model ) {
	 * List<Category> cate = cateservice.getCategoryListByApprovedCourses();
	 * model.addAttribute("cate", cate);
	 * 
	 * UserInstructorCourses cour = userintscourservice.getCourOne(id);
	 * model.addAttribute("cour", cour);
	 * 
	 * model.addAttribute("sumcour",
	 * seclescourservice.getSumCourWithInstructor(cour.getInstructor().getId()));
	 * 
	 * List<SectionLessionCourse> sec = seclescourservice.getDataSecLesCour(id);
	 * model.addAttribute("sec", sec); return "courses_follow_name"; }
	 */
	
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET ) 
	public String SectionLessionCourse(@PathVariable("id") Integer courseId, Model model ) {
		Course selectedCourse = courseService.getCourseInfosByCourseID(courseId);
		model.addAttribute("selectedCourse", selectedCourse);
		return "course-about";
	}
	
}
