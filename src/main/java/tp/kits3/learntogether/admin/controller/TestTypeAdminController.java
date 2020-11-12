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

import tp.kits3.learntogether.admin.service.TestTypeAdminService;
import tp.kits3.learntogether.admin.vo.TestType;

@Controller
public class TestTypeAdminController {
	@Autowired
	TestTypeAdminService testTypeAdminService;

	@RequestMapping(value = "/admin/testType", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<TestType> listTestType = testTypeAdminService.findAll();
			model.addAttribute("form", new TestType());
			model.addAttribute("listTestType", listTestType);
		} catch (Exception e) {
		}
		return "admin/testType/index";
	}

	@RequestMapping(value = "/admin/testType/{id}", method = RequestMethod.GET)
	@ResponseBody
	public TestType findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			TestType TestType = testTypeAdminService.findOne(id);
			return TestType;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/testType/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") TestType testType, RedirectAttributes rs) {
		try {
		testTypeAdminService.insert(testType);
		rs.addFlashAttribute("message","Add success");
		rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/testType";
	}

	@RequestMapping(value = "/admin/testType/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") TestType testType, RedirectAttributes rs) {
		try {
			testTypeAdminService.update(testType);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/testType";
	}
	
	
	@RequestMapping(value = "/admin/testType/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			testTypeAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/testType";
	}
}
