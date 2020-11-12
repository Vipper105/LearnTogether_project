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

import tp.kits3.learntogether.admin.service.SectionAdminService;
import tp.kits3.learntogether.admin.vo.Section;

@Controller
public class SectionAdminController {
	@Autowired
	SectionAdminService SectionAdminService;

	@RequestMapping(value = "/admin/section", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Section> listSection = SectionAdminService.findAll();
			model.addAttribute("form", new Section());
			model.addAttribute("listSection", listSection);
		} catch (Exception e) {
		}
		return "admin/section/index";
	}

	@RequestMapping(value = "/admin/section/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Section findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Section Section = SectionAdminService.findOne(id);
			return Section;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/section/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Section section, RedirectAttributes rs) {
		try {
			SectionAdminService.insert(section);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/section";
	}

	@RequestMapping(value = "/admin/section/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Section section, RedirectAttributes rs) {
		try {
			SectionAdminService.update(section);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/section";
	}
}
