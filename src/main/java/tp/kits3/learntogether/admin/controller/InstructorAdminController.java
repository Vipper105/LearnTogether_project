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

import tp.kits3.learntogether.admin.service.InstructorAdminService;
import tp.kits3.learntogether.admin.vo.Instructor;

@Controller
public class InstructorAdminController {
	@Autowired
	InstructorAdminService instructorAdminService;

	@RequestMapping(value = "/admin/instructor", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Instructor> listInstructor = instructorAdminService.findAll();
			model.addAttribute("form", new Instructor());
			model.addAttribute("listInstructor", listInstructor);
		} catch (Exception e) {
		}
		return "admin/instructor/index";
	}

	@RequestMapping(value = "/admin/instructor/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Instructor findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Instructor instructor = instructorAdminService.findOne(id);
			return instructor;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/instructor/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Instructor instructor, RedirectAttributes rs) {
		try {
			instructorAdminService.insert(instructor);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/instructor";
	}

	@RequestMapping(value = "/admin/instructor/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Instructor instructor, RedirectAttributes rs) {
		try {
			instructorAdminService.update(instructor);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/instructor";
	}

	@RequestMapping(value = "/admin/instructor/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			instructorAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/instructor";
	}
}
