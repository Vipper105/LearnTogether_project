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

import tp.kits3.learntogether.admin.service.OrderAdminService;
import tp.kits3.learntogether.admin.vo.Order;

@Controller
public class OrderAdminController {
	@Autowired
	OrderAdminService OrderAdminService;

	@RequestMapping(value = "/admin/order", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Order> listOrder = OrderAdminService.findAll();
			model.addAttribute("form", new Order());
			model.addAttribute("listOrder", listOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/order/index";
	}

	@RequestMapping(value = "/admin/order/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Order findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Order order = OrderAdminService.findOne(id);
			return order;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/order/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Order order, RedirectAttributes rs) {
		try {
			OrderAdminService.insert(order);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/order";
	}

	@RequestMapping(value = "/admin/order/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Order order, RedirectAttributes rs) {
		try {
			OrderAdminService.update(order);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/order";
	}
}
