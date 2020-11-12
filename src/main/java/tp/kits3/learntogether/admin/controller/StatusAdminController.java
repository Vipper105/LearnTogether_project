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
import tp.kits3.learntogether.admin.vo.Status;



@Controller
public class StatusAdminController {
	@Autowired
	StatusAdminService statusAdminService;

	@RequestMapping(value = "/admin/status", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Status> listStatus = statusAdminService.findAll();
			model.addAttribute("form", new Status());
			model.addAttribute("listStatus", listStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/status/index";
	}

	@RequestMapping(value = "/admin/status/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Status findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Status Status = statusAdminService.findOne(id);
			return Status;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/status/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Status Status, RedirectAttributes rs) {
		try {
			statusAdminService.insert(Status);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/status";
	}

	@RequestMapping(value = "/admin/status/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Status status, RedirectAttributes rs) {
		try {
			statusAdminService.update(status);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/status";
	}
	
	
	@RequestMapping(value = "/admin/status/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			statusAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/status";
	}
}
