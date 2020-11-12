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

import tp.kits3.learntogether.admin.service.TestAdminService;
import tp.kits3.learntogether.admin.vo.Test;

@Controller
public class TestAdminController {
	@Autowired
	TestAdminService testAdminService;

	@RequestMapping(value = "/admin/test", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Test> listTest = testAdminService.findAll();
			model.addAttribute("form", new Test());
			model.addAttribute("listTest", listTest);
		} catch (Exception e) {
		}
		return "admin/test/index";
	}

	@RequestMapping(value = "/admin/test/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Test findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Test Test = testAdminService.findOne(id);
			return Test;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/test/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Test test, RedirectAttributes rs) {
		try {
		testAdminService.insert(test);
		rs.addFlashAttribute("message","Add success");
		rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/test";
	}

	@RequestMapping(value = "/admin/test/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Test test, RedirectAttributes rs) {
		try {
			testAdminService.update(test);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/test";
	}
	
	
	@RequestMapping(value = "/admin/test/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			testAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/test";
	}
}
