package tp.kits3.learntogether.admin.controller;

/**
 * @author NguyenDoanNam
 */
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tp.kits3.learntogether.admin.service.CourseAdminService;
import tp.kits3.learntogether.admin.vo.Course;

@Controller
public class CourseAdminController {
	
	@Autowired
	CourseAdminService courseAdminService;

	@RequestMapping(value = "/admin/course", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Course> listCourse = courseAdminService.findAll();
			model.addAttribute("form", new Course());
			model.addAttribute("listCourse", listCourse);
		} catch (Exception e) {
		}
		return "admin/course/index";
	}

	@RequestMapping(value = "/admin/course/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Course findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Course course = courseAdminService.findOne(id);
			return course;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/course/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Course course, RedirectAttributes rs) {
		try {
			courseAdminService.insert(course);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
			
		} catch (Exception e) {
			e.printStackTrace();
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
		}
		return "redirect:/admin/course";
	}

	@RequestMapping(value = "/admin/course/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Course course, RedirectAttributes rs) {
		try {
			courseAdminService.update(course);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/course";
	}
	
}
