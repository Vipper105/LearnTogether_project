package tp.kits3.learntogether.user.controller;

/*
 * @author Vo Duc Hoa
 */

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tp.kits3.learntogether.user.dao.MyCoursesDao;
import tp.kits3.learntogether.user.dto.MyCourses;
import tp.kits3.learntogether.user.service.CourseOrderService;
import tp.kits3.learntogether.user.service.MyCoursesService;
import tp.kits3.learntogether.user.service.OrderService;
import tp.kits3.learntogether.user.service.UserService;
import tp.kits3.learntogether.user.vo.CourseOrder;
import tp.kits3.learntogether.user.vo.Order;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderservice;

	@Autowired
	private MyCoursesDao mycoursesdao;

	@Autowired
	private UserService userservice;

	@Autowired
	private CourseOrderService courseOrderService;

	@Autowired
	private MyCoursesService mycoursesservice;

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String selectID(Model model) {
		List<Order> listAll = orderservice.findAll();
		for (Order listAllFor : listAll) {
			if (listAll.contains(listAllFor)) {
				List<Order> list = orderservice.findId(listAllFor.getUserId());
				for (Order order : list) {
					System.out.println("----contro: " + order.getId());
				}
			}
		}
		return "index";
	}

	@SuppressWarnings({ "unused", "unchecked" })
	@RequestMapping(value = "/payment/payment_detail", method = RequestMethod.GET)
	public String payAction(Model model, HttpSession session, RedirectAttributes rs, HttpServletRequest request) {
		Double totalprice = (Double) session.getAttribute("TotalPrice");
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		String mail = (String) session.getAttribute("Mail");
		Boolean check = (Boolean) session.getAttribute("CheckMailSended");

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		Order order = new Order();

		order.setUserId(user.getId());
		order.setCreatedate(date);
		order.setTotalamount(totalprice);
		order.setStatus(1);
		if (check.equals(true)) {
			orderservice.addItemPayment(order);
		}

		List<MyCourses> mycourses = mycoursesdao.findAllCourses(user.getId());
		System.out.println("----: " + mycourses);

		List<Order> order1 = orderservice.findId(user.getId());
		HashMap<Integer, CourseOrder> cart = (HashMap<Integer, CourseOrder>) session.getAttribute("ItemsOrder");

		for (Integer key : cart.keySet()) {
			CourseOrder courseorder = new CourseOrder();
			ArrayList<Integer> listtemp = new ArrayList<Integer>();
			for (MyCourses mycourseslist : mycourses) {

				if (mycourseslist.getId() == key) {
					listtemp.add(mycourseslist.getId());
				} else {

				}
			}

			System.out.println("my courses items: " + listtemp);

			if (listtemp.isEmpty()) {
				System.out.println("theem 1");
				System.err.println("---");
				courseorder.setCourseId(key);
				for (Order listorder : order1) {
					courseorder.setOrderId(listorder.getId());
				}
				courseorder.setQuantity(1);
				if (check.equals(true)) {
					courseOrderService.addIntoCourseOrder(courseorder);
				}
			} else {
				for (Integer listInt : listtemp) {
					if (listInt != key) {
						System.out.println("don't add my courses" + key);
					}
				}
			}
		}

		/*************** amount price of admin *********************/
		Double totalAmountAdmin = orderservice.priceAmount(user.getId());
		if (totalAmountAdmin == 0.0) {
			System.out.println("Amount Admin None");
		} else {
			user.setAmountAdmin(totalAmountAdmin);
			userservice.updateAmountAdmin(user);
		}

		/**************** price of user ******************************/
		Double mountUser = 0.0;
		if (user.getAmount() < totalprice) {
			System.out.println("not enought money! please recharge!!");
			System.out.println("Current money~:" + user.getAmount());
			return "redirect:/courses";// by JDK
		} else {
			mountUser = user.getAmount() - totalprice;
		}
		model.addAttribute("mountRefund", mountUser);
		user.setAmount(mountUser);
		userservice.UpdateAmount(user);

		String checkString = check.toString();
		request.setAttribute("checkString", checkString);
		model.addAttribute("mountRefund", mountUser);
		return "redirect:/mycourses"; // by JDK
	}

}
