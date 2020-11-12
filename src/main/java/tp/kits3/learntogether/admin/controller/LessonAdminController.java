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

import tp.kits3.learntogether.admin.service.LessonAdminService;
import tp.kits3.learntogether.admin.vo.Lesson;

@Controller
public class LessonAdminController {
	@Autowired
	LessonAdminService lessonAdminService;

	@RequestMapping(value = "/admin/lesson", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Lesson> listLesson = lessonAdminService.findAll();
			model.addAttribute("form", new Lesson());
			model.addAttribute("listLesson", listLesson);
		} catch (Exception e) {
		}
		return "admin/lesson/index";
	}

	@RequestMapping(value = "/admin/lesson/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Lesson findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Lesson Lesson = lessonAdminService.findOne(id);
			return Lesson;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/lesson/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Lesson lesson, RedirectAttributes rs) {
		try {
			lessonAdminService.insert(lesson);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/lesson";
	}

	@RequestMapping(value = "/admin/lesson/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Lesson lesson, RedirectAttributes rs) {
		try {
			lessonAdminService.update(lesson);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/lesson";
	}
	
	
	@RequestMapping(value = "/admin/lesson/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			lessonAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/lesson";
	}
}
