package tp.kits3.learntogether.user.controller;

/**
 * @author PhungDinhHuy
 *
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tp.kits3.learntogether.user.service.RoleService;
import tp.kits3.learntogether.user.service.UserService;
import tp.kits3.learntogether.user.vo.Role;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

@Controller
public class AccountController {

	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;

	// to go
	@RequestMapping(value = "/login-page", method = RequestMethod.GET)
	public String loginPage(Model model) {
		return Contansts.URL_LOGIN;
	}

	// to go
	@RequestMapping(value = "/register-page", method = RequestMethod.GET)
	public String registerPage(Model model, HttpServletRequest resquest) {
		return Contansts.URL_REGISTER;
	}

	// to go
//	@RequestMapping(value = "/admin-page", method = RequestMethod.GET)
//	public String adminPage(Model model, HttpServletRequest resquest) {
//		return Contansts.URL_ADMIN;
//	} 

	// to go
	@RequestMapping(value = "/change-pwd-page", method = RequestMethod.GET)
	public String changePwdPage(Model model) {

		return Contansts.URL_CHANGE_PASSWORD;
	}

	@RequestMapping(value = "/forgot-pwd-page", method = RequestMethod.GET)
	public String forgotPwdPage(Model model) {

		return Contansts.URL_FORGOT_PASSWORD;
	}

	/**
	 * @author NguyenDoanNam
	 *
	 */
	@RequestMapping(value = "/send-pass", method = RequestMethod.GET)
	public String sendPassword(Model model, @ModelAttribute("email") String email, RedirectAttributes rs) {
		if (email.isEmpty()) {
		} else {
			try {
				userService.sendPass(email);
				rs.addFlashAttribute("message", "Please check your email");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/forgot-pwd-page";
	}

	/**
	 * @author NguyenDoanNam
	 *
	 */
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String displayResetPasswordPage(Model model, @RequestParam("token") String token) {

		User user = userService.findUserByResetToken(token);
		model.addAttribute("token", token);
		if (user == null) {
			return "404";
		}
		return "/resetPassword";
	}

	/**
	 * @author NguyenDoanNam
	 *
	 */
	@RequestMapping(value = "/setPass/{token}", method = RequestMethod.GET)
	public String resetPasswordPage(@PathVariable("token") String token, @RequestParam("password") String password) {

		User user = userService.findUserByResetToken(token);
		String passwordBcrypt = BCrypt.hashpw(password, BCrypt.gensalt(12));
		user.setPassword(passwordBcrypt);
		user.setToken(null);
		userService.Update(user);
		return "redirect:/login-page";
	}

	// register
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, @RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("username") String username, @RequestParam("password") String password

	) {
		// set session
		// request.getSession(false);
		Role role = roleService.getRoleByRoleName("User");
		Integer rold_id = role.getId();

		// validate register form

		// BCrypt password
		String passwordBcrypt = BCrypt.hashpw(password, BCrypt.gensalt(12));

		User user = new User();
		user.setFullname(fullname);
		user.setEmail(email);
		user.setPassword(passwordBcrypt);
		user.setRoleId(rold_id);
		user.setUsername(username);

		// add user
		// check isExisted User
		User userDB1 = userService.findOneUserByUsername(username);
		User userDB2 = userService.findOneUserByEmail(email);
		model.addAttribute(Contansts.ATTR_REGISTER, null);

		if (userDB1 == null && userDB2 == null) {
			userService.register(user);
			model.addAttribute(Contansts.ATTR_REGISTER, Contansts.REGISTER_SUCCESS);
			return Contansts.URL_LOGIN;
		} else {
			model.addAttribute(Contansts.ATTR_REGISTER, Contansts.REGISTER_FAILED);
			return Contansts.URL_REGISTER;
		}
	}

	// login
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// set session
		request.getSession(false);
		String userName = request.getParameter("uname");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		if (userService.checkLogin(userName, password, remember, model, response, session, request)
				.equals(Contansts.URL_INDEX)) {
			return "redirect:/";
		}
		return userService.checkLogin(userName, password, remember, model, response, session, request);
	}

	@RequestMapping(value = "/sendStateCheckbox", method = RequestMethod.POST)
	public String sendStateCheckbox(@RequestBody String stateCheckbox, Model model) {

		model.addAttribute("stateCheckbox", stateCheckbox);
		return Contansts.URL_LOGIN;
	}

	// logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute(Contansts.USER_LOGGED);
		/*
		 * session.removeAttribute("ItemsOrder");
		 * session.removeAttribute("TotalQuantity");
		 * session.removeAttribute("TotalPrice");
		 */
		return "redirect:/";
	}

	// Ajax check email existed
	@RequestMapping(value = "/email-existed", method = RequestMethod.POST)
	@ResponseBody
	// Annotation @ResponseBody Ä‘Æ°á»£c thÃªm vÃ o trÆ°á»›c
	// cÃ¡c method cá»§a cÃ¡c controller Ä‘á»ƒ
	// chá»‰ dáº«n ráº±ng
	// method nÃ y sáº½ tráº£ vá»� text thay vÃ¬ tráº£ vá»�
	// view.
	public String CheckEmailExisted(Model model, @RequestBody String email) {
		String msg = "";
		if (userService.findOneUserByEmail(email) != null) {
			// Email Ä‘Ã£ tá»“n táº¡i
			msg = "Email is existed";
		} else {
			// Email chÆ°a tá»“n táº¡i tráº£ vá»� rá»—ng
			msg = "";
		}

		return msg;
	}

	// Ajax check username existed
	@RequestMapping(value = "/username-existed", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserExisted(Model model, @RequestBody String uname) {
		String msg = "";
		if (userService.findOneUserByUsername(uname) != null) {
			msg = "Username is existed";
		} else {
			msg = "";
		}
		return msg;
	}

	// change password
	@RequestMapping(value = "/change-pwd", method = RequestMethod.POST)
	public String changePassword(Model model, HttpSession httpSession, HttpServletRequest request) {
		// get user
		User user = (User) httpSession.getAttribute(Contansts.USER_LOGGED);

		// change pwd update
		String old_password = request.getParameter("old-password");
		String new_password = request.getParameter("new-password");
		String re_new_password = request.getParameter("re-new-password");

		if (BCrypt.checkpw(old_password, user.getPassword())) {
			if (!new_password.equals(re_new_password)) {
				// display error not same
				model.addAttribute("CHANGE_PASSWORD_MSG", Contansts.NOSAME_PASSWORD);
			} else {
				// update new password
				String passwordBcrypt = BCrypt.hashpw(new_password, BCrypt.gensalt(12));
				user.setPassword(passwordBcrypt);
				userService.updateUserPwd(user);
			}

		} else {
			// old password is not correct
			model.addAttribute("CHANGE_PASSWORD_MSG", Contansts.WRONG_OLD_PASSWORD);
		}
		return Contansts.URL_CHANGE_PASSWORD;
	}

}
