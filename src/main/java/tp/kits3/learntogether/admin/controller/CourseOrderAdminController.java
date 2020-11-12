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

import tp.kits3.learntogether.admin.service.CourseOrderAdminService;
import tp.kits3.learntogether.admin.vo.CourseOrder;


@Controller
public class CourseOrderAdminController {
	@Autowired
	CourseOrderAdminService CourseOrderAdminService;

	@RequestMapping(value = "/admin/courseOrder", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<CourseOrder> listCourseOrder = CourseOrderAdminService.findAll();
			model.addAttribute("form", new CourseOrder());
			model.addAttribute("listCourseOrder", listCourseOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/courseOrder/index";
	}

	@RequestMapping(value = "/admin/courseOrder/{id}", method = RequestMethod.GET)
	@ResponseBody
	public CourseOrder findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			CourseOrder CourseOrder = CourseOrderAdminService.findOne(id);
			return CourseOrder;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/courseOrder/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") CourseOrder courseOrder, RedirectAttributes rs) {
		try {
			CourseOrderAdminService.insert(courseOrder);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/courseOrder";
	}

	@RequestMapping(value = "/admin/courseOrder/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") CourseOrder CourseOrder, RedirectAttributes rs) {
		try {
			CourseOrderAdminService.update(CourseOrder);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/courseOrder";
	}
	
	
	@RequestMapping(value = "/admin/courseOrder/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			CourseOrderAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/courseOrder";
	}
}
