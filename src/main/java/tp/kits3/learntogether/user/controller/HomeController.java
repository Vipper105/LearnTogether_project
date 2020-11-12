package tp.kits3.learntogether.user.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tp.kits3.learntogether.user.dto.UserInstructorCourses;
import tp.kits3.learntogether.user.service.CategoryService;
import tp.kits3.learntogether.user.service.OrderService;
import tp.kits3.learntogether.user.service.RatingService;
import tp.kits3.learntogether.user.service.UserInstructorCourseSerivce;
import tp.kits3.learntogether.user.vo.Category;
import tp.kits3.learntogether.utils.Contansts;


@Controller
public class HomeController {

	@Autowired
	private RatingService ratingService;
	
	@Autowired
	private CategoryService cateadservice;
	
	@Autowired
	private UserInstructorCourseSerivce courseservice;

	@Autowired
	private OrderService orderservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		/**
		 * @author pho
		 *
		 */
		List<Category> cate = cateadservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);

		List<UserInstructorCourses> courInstructor = courseservice.getCourOneCate(1);
		model.addAttribute("cour", courInstructor);
		
		List<UserInstructorCourses> courFollowRangting = courseservice.getAll();
		
		List<UserInstructorCourses> list = new ArrayList<UserInstructorCourses>();
	
		Collections.sort(courFollowRangting, new rangComparator());
		for (UserInstructorCourses uic : courFollowRangting) {
			list.add(uic);
		}
		model.addAttribute("lcfr", list);
		
		
		return Contansts.URL_INDEX;
	}
	
	class rangComparator implements Comparator<UserInstructorCourses> {
		public int compare(UserInstructorCourses s1, UserInstructorCourses s2) {
			if (s1.getCourse().getAverage() == s2.getCourse().getAverage())
				return 0;
			else if (s1.getCourse().getAverage() < s2.getCourse().getAverage())
				return 1;
			else
				return -1;
		}
	}
	/**
	 * @author VoDucHoa
	 *
	 */
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpSession session) {
		List<Category> cate = cateadservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		return "cart";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(Model model, HttpSession session) {
		List<Category> cate = cateadservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		return "contact";
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		List<Category> cate = cateadservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		return "about";
	}

	@RequestMapping(value = "/payment/checkout", method = RequestMethod.GET)
	public String payment(Model model, HttpSession session) {
		List<Category> cate = cateadservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		return "/payment/checkout";
	}

	@RequestMapping(value = "payment/paydetail", method = RequestMethod.GET)
	public String paymentDetail(Model model, HttpSession session) {

		/******************** send mail complete ************************/
		Boolean check = orderservice.notificationMail(session);
//		String check = (String) session.getAttribute("checkSended");
//		model.addAttribute("CheckMailSended", check);
		session.setAttribute("CheckMailSended", check);
		return "/payment/payment_detail";
	}

	@RequestMapping(value = "/sitemap", method = RequestMethod.GET)
	public String sitemap(Model model, HttpSession session) {
		List<Category> cate = cateadservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		return "/sitemap";
	}
}
