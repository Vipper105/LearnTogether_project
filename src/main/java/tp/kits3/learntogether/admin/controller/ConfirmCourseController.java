package tp.kits3.learntogether.admin.controller;


/**
 * @author Nam
 *
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
import tp.kits3.learntogether.admin.service.EssayAdminService;
import tp.kits3.learntogether.admin.service.LessonAdminService;
import tp.kits3.learntogether.admin.service.MultiAdminService;
import tp.kits3.learntogether.admin.service.SectionAdminService;
import tp.kits3.learntogether.admin.service.TestAdminService;
import tp.kits3.learntogether.admin.vo.Course;
import tp.kits3.learntogether.admin.vo.Essay;
import tp.kits3.learntogether.admin.vo.Lesson;
import tp.kits3.learntogether.admin.vo.MultiChoice;
import tp.kits3.learntogether.admin.vo.Section;
import tp.kits3.learntogether.admin.vo.Test;

@Controller
public class ConfirmCourseController {
	@Autowired
	CourseAdminService courseAdminService;
	@Autowired
	SectionAdminService sectionAdminService;
	@Autowired
	LessonAdminService lessonAdminService;
	@Autowired
	TestAdminService testAdminService;
	@Autowired
	MultiAdminService multiAdminService;
	@Autowired
	EssayAdminService essayAdminService;
	@RequestMapping(value = "/admin/confirmCourse", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Course> listCourse = courseAdminService.findApprove();
			model.addAttribute("form", new Course());
			model.addAttribute("listCourse", listCourse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/confirmCourse/index";
	}

	@RequestMapping(value = "/admin/sectionByCourseId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Section> findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			List<Section> section = sectionAdminService.findByCourseId(id);
			return section;
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping(value = "/admin/lessonBySectionId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Lesson> findbySectionId(Model model, @PathVariable("id") Integer id) {
		try {
			List<Lesson> lessons = lessonAdminService.findBySessionId(id);
			return lessons;
		} catch (Exception e) {
		}
		return null;
	}
	@RequestMapping(value = "/admin/testBySectionId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Test> findBySectionId(Model model, @PathVariable("id") Integer id) {
		try {
			List<Test> test = testAdminService.findBySectionId(id);
			return test;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value = "/admin/multiByTestId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<MultiChoice> multiByTestId(Model model, @PathVariable("id") Integer id) {
		try {
			List<MultiChoice> multiChoice = multiAdminService.findByTestId(id);
			return multiChoice;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value = "/admin/essayByTestId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Essay> essayByTestId(Model model, @PathVariable("id") Integer id) {
		try {
			List<Essay> essay = essayAdminService.findByTestId(id);
			return essay;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/confirmCourse/{id}", method = RequestMethod.GET)
	public String confirm(Model model, @ModelAttribute("form") Course course, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			courseAdminService.approveCourse(id);
			rs.addFlashAttribute("message", "Approve success");
			rs.addFlashAttribute("alert", "success");

		} catch (Exception e) {
			e.printStackTrace();
			rs.addFlashAttribute("message", "Error! Faild");
			rs.addFlashAttribute("alert", "secondary");
		}
		return "redirect:/admin/confirmCourse";
	}
	@RequestMapping(value = "/admin/noConfirmCourse/{id}", method = RequestMethod.GET)
	public String noConfirm(Model model, @ModelAttribute("form") Course course, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			courseAdminService.noApproveCourse(id);
			rs.addFlashAttribute("message", "Success");
			rs.addFlashAttribute("alert", "success");

		} catch (Exception e) {
			e.printStackTrace();
			rs.addFlashAttribute("message", "Error! Faild");
			rs.addFlashAttribute("alert", "secondary");
		}
		return "redirect:/admin/confirmCourse";
	}

	@RequestMapping(value = "/admin/confirmCourse/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Course course, RedirectAttributes rs) {
		try {
			courseAdminService.update(course);
			rs.addFlashAttribute("message", "Update success");
			rs.addFlashAttribute("alert", "success");
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Error! Update Faild");
			rs.addFlashAttribute("alert", "secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/confirmCourse";
	}
	

}
