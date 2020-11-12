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

import tp.kits3.learntogether.admin.service.CourseLevelAdminService;
import tp.kits3.learntogether.admin.vo.CourseLevel;


@Controller
public class CourseLevelAdminController {
	@Autowired
	CourseLevelAdminService courseLevelAdminService;

	@RequestMapping(value = "/admin/courseLevel", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<CourseLevel> listCourseLevel = courseLevelAdminService.findAll();
			model.addAttribute("form", new CourseLevel());
			model.addAttribute("listCourseLevel", listCourseLevel);
		} catch (Exception e) {
		}
		return "admin/courseLevel/index";
	}

	@RequestMapping(value = "/admin/courseLevel/{id}", method = RequestMethod.GET)
	@ResponseBody
	public CourseLevel findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			CourseLevel CourseLevel = courseLevelAdminService.findOne(id);
			return CourseLevel;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/courseLevel/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") CourseLevel CourseLevel, RedirectAttributes rs) {
		try {
			courseLevelAdminService.insert(CourseLevel);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			e.printStackTrace();
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
		}
		return "redirect:/admin/courseLevel";
	}

	@RequestMapping(value = "/admin/courseLevel/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") CourseLevel CourseLevel, RedirectAttributes rs) {
		try {
			courseLevelAdminService.update(CourseLevel);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/courseLevel";
	}
	
	
	@RequestMapping(value = "/admin/courseLevel/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			courseLevelAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/courseLevel";
		
	}
}
