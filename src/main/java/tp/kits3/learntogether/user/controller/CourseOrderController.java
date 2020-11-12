package tp.kits3.learntogether.user.controller;

/**
 * @author VoDucHoa
 */

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tp.kits3.learntogether.user.service.CourseOrderService;
import tp.kits3.learntogether.user.service.UserService;
import tp.kits3.learntogether.user.vo.CourseOrder;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

@Controller
public class CourseOrderController {
	@Autowired
	private CourseOrderService courseOrderService;
	
	@Autowired
	private UserService userservice;
	
	/*
	 * @Autowired private CoursesDao coursedao;
	 */
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cartitem", method = RequestMethod.GET)
	public String addCart(@RequestParam ("idcourse") int id, Model model, HttpSession session){
		HashMap<Integer, CourseOrder> cart = (HashMap<Integer, CourseOrder>)session.getAttribute("ItemsOrder");
		if (cart == null) {
			cart = new HashMap<Integer, CourseOrder>();
		}
		cart = courseOrderService.addCart1(id, cart);	 		
		try {
			User user = (User)session.getAttribute(Contansts.USER_LOGGED);
			} 
		catch (Exception e) 
		{
			e.printStackTrace(); 
		}
		model.addAttribute("ItemsOrder", cart);
		session.setAttribute("ItemsOrder", cart);
		session.setAttribute("TotalQuantity", courseOrderService.countCart(cart));
		session.setAttribute("TotalPrice", courseOrderService.countPrice(cart));
		return "redirect:/courses";	
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/removeCart", method=RequestMethod.GET)
	public String removeCart (@RequestParam ("idcourseRemove") int id, Model model, HttpSession session){
		HashMap<Integer, CourseOrder> cart = (HashMap<Integer, CourseOrder>)session.getAttribute("ItemsOrder");	
		if (cart == null) {
			cart = new HashMap<Integer, CourseOrder>();
		}
		cart = courseOrderService.deleteCart(id, cart);			
		
		session.setAttribute("ItemsOrder", cart);
		session.setAttribute("TotalQuantity", courseOrderService.countCart(cart));
		session.setAttribute("TotalPrice", courseOrderService.countPrice(cart));
		return "redirect:/cart";	
	}

 }
