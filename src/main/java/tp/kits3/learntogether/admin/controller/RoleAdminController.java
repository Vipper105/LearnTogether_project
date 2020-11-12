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

import tp.kits3.learntogether.admin.service.RoleAdminService;
import tp.kits3.learntogether.admin.vo.Role;

@Controller
public class RoleAdminController {
	@Autowired
	RoleAdminService roleAdminService;

	@RequestMapping(value = "/admin/role", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Role> listRole = roleAdminService.findAll();
			model.addAttribute("form", new Role());
			model.addAttribute("listRole", listRole);
		} catch (Exception e) {
		}
		return "admin/role/index";
	}

	@RequestMapping(value = "/admin/role/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Role findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Role role = roleAdminService.findOne(id);
			return role;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/role/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Role role, RedirectAttributes rs) {
		try {
		roleAdminService.insert(role);
		rs.addFlashAttribute("message","Add success");
		rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
			
		}
		return "redirect:/admin/role";
	}

	@RequestMapping(value = "/admin/role/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Role role, RedirectAttributes rs) {
		try {
			roleAdminService.update(role);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/role";
	}
	
	
	@RequestMapping(value = "/admin/role/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			roleAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/role";
	}
}
