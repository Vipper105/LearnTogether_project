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

import tp.kits3.learntogether.admin.service.RatingAdminService;
import tp.kits3.learntogether.admin.vo.Rating;




@Controller
public class RatingAdminController {
	@Autowired
	RatingAdminService ratingAdminService;

	@RequestMapping(value = "/admin/rating", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			List<Rating> listRating = ratingAdminService.findAll();
			model.addAttribute("form", new Rating());
			model.addAttribute("listRating", listRating);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/rating/index";
	}

	@RequestMapping(value = "/admin/rating/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Rating findbyId(Model model, @PathVariable("id") Integer id) {
		try {
			Rating rating = ratingAdminService.findOne(id);
			return rating;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/rating/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("form") Rating rating, RedirectAttributes rs) {
		try {
			ratingAdminService.insert(rating);
			rs.addFlashAttribute("message","Add success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Add Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/rating";
	}

	@RequestMapping(value = "/admin/rating/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute("form") Rating rating, RedirectAttributes rs) {
		try {
			ratingAdminService.update(rating);
			rs.addFlashAttribute("message","Update success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Update Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/rating";
	}
	
	
	@RequestMapping(value = "/admin/rating/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("id") Integer id, RedirectAttributes rs) {
		try {
			ratingAdminService.delelebyId(id);
			rs.addFlashAttribute("message","Delete success");
			rs.addFlashAttribute("alert","success");
		} catch (Exception e) {
			rs.addFlashAttribute("message","Error! Delete Faild");
			rs.addFlashAttribute("alert","secondary");
			e.printStackTrace();
		}
		return "redirect:/admin/rating";
	}
}
