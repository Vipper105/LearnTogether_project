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

import tp.kits3.learntogether.admin.service.StatusAdminService;
import tp.kits3.learntogether.admin.service.StatusUserAdminService;
import tp.kits3.learntogether.admin.service.UserAdminService;
import tp.kits3.learntogether.admin.vo.Status;
import tp.kits3.learntogether.admin.vo.StatusUser;
import tp.kits3.learntogether.admin.vo.User;

@Controller
public class StatusUserAdminController {
	@Autowired
	StatusUserAdminService statusUserAdminService;
	@Autowired
	StatusAdminService statusAdminService;
	@Autowired
	UserAdminService userAdminService;
	@RequestMapping(value = "/admin/statusUser", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<StatusUser> listStatusUser = statusUserAdminService.findAll();
			List<User> listUser = userAdminService.findAll();
			List<Status> listStatus = statusAdminService.findAll();
			model.addAttribute("listUser", listUser);
			model.addAttribute("listStatus", listStatus);
			model.addAttribute("form", new StatusUser());
			model.addAttribute("listStatusUser", listStatusUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/statusUser/index";
	}

	@RequestMapping(value = "/admin/statusUser/{id}", method = RequestMethod.GET)
	@ResponseBody
	public StatusUser findbyId(Model model, @PathVariable("id") Integer id) {
		try {	
			StatusUser StatusUser = statusUserAdminService.findOne(id);
			return StatusUser;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/statusUser/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") StatusUser statusUser, RedirectAttributes rs) {
		try {
			statusUserAdminService.insert(statusUser);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/statusUser";
	}

	@RequestMapping(value = "/admin/statusUser/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") StatusUser statusUser, RedirectAttributes rs) {
		try {
			statusUserAdminService.update(statusUser);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/statusUser";
	}
	
	
	@RequestMapping(value = "/admin/statusUser/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			statusUserAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			e.printStackTrace();
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/statusUser";
	}
}
