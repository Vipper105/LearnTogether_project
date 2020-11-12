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
import tp.kits3.learntogether.admin.service.UserAdminService;
import tp.kits3.learntogether.admin.vo.Role;
import tp.kits3.learntogether.admin.vo.User;

@Controller
public class UserAdminController {
	@Autowired
	UserAdminService userAdminService;
	@Autowired
	RoleAdminService roleAdminService;

	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<User> listUser = userAdminService.findAll();
			List<Role> listRole = roleAdminService.findAll();
			User user = new User();
			model.addAttribute("form", user);
			model.addAttribute("listUser", listUser);
			model.addAttribute("listRole", listRole);
		} catch (Exception e) {
		}
		return "admin/user/index";
	}

	@RequestMapping(value = "/admin/user/{id}", method = RequestMethod.GET)
	@ResponseBody
	public User findbyId(Model model, @PathVariable("id") Integer id) {
		try {	
			User user = userAdminService.findOne(id);	
			model.addAttribute("form", user);
			return user;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/user/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") User user, RedirectAttributes rs) {
		try {
			if(user.getBirthdate().equals(""))
			{
				user.setBirthdate(null);
			}
			userAdminService.insert(user);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/user";
	}

	@RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") User user, RedirectAttributes rs) {
		try {
			if(user.getBirthdate().equals(""))
			{
				user.setBirthdate(null);
				
			}
			userAdminService.update(user);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/user";
	}
	@RequestMapping(value = "/admin/user/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			userAdminService.delete(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/user";
	}
}
