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

import tp.kits3.learntogether.admin.service.InvoiceAdminService;
import tp.kits3.learntogether.admin.vo.Invoice;

@Controller
public class InvoiceAdminController {
	@Autowired
	InvoiceAdminService InvoiceAdminService;

	@RequestMapping(value = "/admin/invoice", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Invoice> listInvoice = InvoiceAdminService.findAll();
			model.addAttribute("form", new Invoice());
			model.addAttribute("listInvoice", listInvoice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/invoice/index";
	}

	@RequestMapping(value = "/admin/invoice/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Invoice findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Invoice invoice = InvoiceAdminService.findOne(id);
			return invoice;
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping(value = "/admin/invoice/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Invoice invoice, RedirectAttributes rs) {
		try {
			InvoiceAdminService.insert(invoice);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/invoice";
	}

	@RequestMapping(value = "/admin/invoice/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Invoice Invoice, RedirectAttributes rs) {
		try {
			InvoiceAdminService.update(Invoice);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/invoice";
	}
}
