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

import tp.kits3.learntogether.admin.service.CategoryAdminService;
import tp.kits3.learntogether.admin.vo.Category;



@Controller
public class CategoryAdminController {
	@Autowired
	CategoryAdminService categoryAdminService;

	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Category> listCategory = categoryAdminService.findAll();
			model.addAttribute("form", new Category());
			model.addAttribute("listCategory", listCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/category/index";
	}

	@RequestMapping(value = "/admin/category/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Category findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Category category = categoryAdminService.findOne(id);
			return category;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/category/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Category category, RedirectAttributes rs) {
		try {
			categoryAdminService.insert(category);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/category";
	}

	@RequestMapping(value = "/admin/category/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Category category, RedirectAttributes rs) {
		try {
			categoryAdminService.update(category);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/category";
	}
	
	
	@RequestMapping(value = "/admin/category/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			categoryAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/category";
	}
}
