package tp.kits3.learntogether.user.service;

/**
 * @author PhungDinhHuy
 *
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import java.util.regex.Pattern;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import tp.kits3.learntogether.user.dao.RoleDao;
import tp.kits3.learntogether.user.dao.StatusDao;
import tp.kits3.learntogether.user.dao.StatusUserDao;
import tp.kits3.learntogether.user.dao.UserDao;
import tp.kits3.learntogether.user.vo.CourseOrder;
import tp.kits3.learntogether.user.vo.Status;
import tp.kits3.learntogether.user.vo.StatusUser;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;
import tp.kits3.learntogether.utils.MailConfig;


@Service
@Transactional	// by JDK
public class UserService {

	@Autowired
	UserDao userDao;

	@Autowired
	RoleDao roleDao;

	@Autowired
	StatusDao statusDao;

	@Autowired
	StatusUserDao statusUserDao;

	// checkgmail
	// abc@gmail.com OK
	// abc pháº£i náº±m trong khoáº£ng kÃ­ tá»± chá»¯ cÃ¡i
	// (kÃ­ tá»± Ä‘áº·c biá»‡t ko dc náº±m á»Ÿ Ä‘áº§u vÃ  cuá»‘i,cÃ³ thá»ƒ náº±m á»Ÿ giá»¯a)
	//
	public User findUserByResetToken(String resetToken)
	{
		return userDao.findUserByResetToken(resetToken);
		
	}
	public Boolean sendPass(String email) {
	  User user = userDao.findOneUserByEmail(email);
	  System.out.println(user);
	  if(user!= null)
	  {
		  user.setToken(UUID.randomUUID().toString());
		  userDao.update(user);
	  }
      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.host", MailConfig.HOST_NAME);
      props.put("mail.smtp.socketFactory.port", MailConfig.SSL_PORT);
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      props.put("mail.smtp.port", MailConfig.SSL_PORT);

      Session session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD);
          }
      }); 
      
      try {
          MimeMessage message = new MimeMessage(session1);
          message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
          message.setSubject("Forgot Password");
          message.setText("Reset Password");
          message.setText("To reset your password, click the link below:\n" + "http://localhost:8080/learntogether/reset?token=" + user.getToken());
         Transport.send(message); 
         System.out.println("Message sent successfully"); 
         return true;  
      } catch (Exception e) { 
    	  System.out.println("Message sent unsuccessfully");
    	  return false;
      }
	}
	
	/**
	 * java.lang.NullPointerException
	 * 	tp.kits3.learntogether.user.service.UserService.checkLogin(UserService.java:212)
	 * 
	 * @param username
	 * @param password
	 * @param remember
	 * @param model
	 * @param response
	 * @param session
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unused")
	public String checkLogin(String username, String password, String remember, Model model,
			HttpServletResponse response, HttpSession session, HttpServletRequest request) {
		String url = "";
		String resultLogin = "";
		String noExistUser = "User is NOT exist";
		String noExistPassword = "Password is wrong";
		String nullUsername = "Username not allow blank";
		String nullPassword = "Password not allow blank";
		String checkLength = "Length must be 6 - 320 characters";
//		String checkGmail = "Email is invalid";

		// check null
		if (username.equals("") && password.equals("")) {
			resultLogin = nullUsername + ", " + nullPassword;
			model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
			url = Contansts.URL_LOGIN;
		}

		else if (username.equals("")) {
			resultLogin = nullUsername;
			model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
			url = Contansts.URL_LOGIN;
		}

		else if (password.equals("")) {
			resultLogin = nullPassword;
			model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
			url = Contansts.URL_LOGIN;
		}
		// check length
		else if (username.length() < 6 || username.length() > 320) {
			resultLogin = checkLength;
			model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
			url = Contansts.URL_LOGIN;
			return url;
		}

		// Can't input special character => use JS

		// if not null anymore
		if (!username.equals("") && !password.equals("")) {

			// is email ?
			User user = null;
			String unamedb = "";
			if (isValidEmail(username)) {
				// get gmail
				user = userDao.findOneUserByEmail(username);
				if (user != null) {
					unamedb = user.getEmail();
				} else {
					url = Contansts.URL_LOGIN;
					resultLogin = noExistUser;
					model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
					// * session.setAttribute(Contansts.RESULT_LOGIN, noExistUser);
				}
			} else {
				// get username
				user = userDao.findOneUserByUsername(username);
				if (user != null) {
					unamedb = user.getUsername();
				} else {
					url = Contansts.URL_LOGIN;
					resultLogin = noExistUser;
					model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
					// * session.setAttribute(Contansts.RESULT_LOGIN, noExistUser);
				}
			}

			// login username/gmail
			if (username.equals(unamedb)) {
				// if (password.equals(user.getPassword())) {
				if (BCrypt.checkpw(password, user.getPassword())) {

					// login success
					// save session
					// HttpSession session = request.getSession();
					session.setAttribute(Contansts.USER_LOGGED, user);
					// get status of each user
					List<StatusUser> statusUser = statusUserDao.selectAllByUserID(user.getId());
					List<Status> listStatusOfUser=new ArrayList<Status>();
					for(int i=0;i<statusUser.size();i++) {
						Status status=statusDao.findOne(statusUser.get(i).getStatusId());
						listStatusOfUser.add(status);
						System.out.println("ssssssssssssssssssssssssssssssssssssssssssssssta"+status.getStatusname());
					}
			
					session.setAttribute("listStatusOfUser", listStatusOfUser);
					
//					

					
					// save cookie
					Cookie cookUname = new Cookie(Contansts.COOKIE_NAME, username);
					cookUname.setMaxAge(60 * 60 * 24 * 365);
					Cookie cookPassword = new Cookie(Contansts.COOKIE_PASSWOD, password);
					cookPassword.setMaxAge(60 * 60 * 24 * 365);
					Cookie cookRemember = new Cookie(Contansts.COOKIE_REMEMBER, remember);
					cookRemember.setMaxAge(60 * 60 * 24 * 365);

					response.addCookie(cookUname);
					response.addCookie(cookPassword);
					response.addCookie(cookRemember);
					// direct page
					String roleName = roleDao.findRoleByRoleID(user.getRoleId()).getRolename();
					
					@SuppressWarnings("unchecked")
					HashMap<Integer, CourseOrder> cart = (HashMap<Integer, CourseOrder>)session.getAttribute("ItemsOrder");					
					if( cart != null ) {	// by JDK
						System.out.println("===="+cart.keySet());
						System.out.println("-----"+ cart.values());
					}else {
						System.out.println(this.getClass().getName()+" : object ë¥¼ return ë°›ì�„ ë•ŒëŠ” ê¼­ NULL í™•ì�¸");
					}
					
					if (roleName.equalsIgnoreCase("User")) {
						System.out.println("-----====:"+request.getSession().getId().isEmpty());
						if (request.getSession().getId().isEmpty() == false) {
							url = Contansts.URL_INDEX;
						}else {
							if (cart != null && cart.keySet().isEmpty()) {	// by JDK
								System.out.println("2222222: "+cart.keySet().isEmpty());
								url = "redirect:/payment/checkout";
							}else {
								url = Contansts.URL_INDEX;
								
							}	
						}
												
					} else {
						url = Contansts.URL_ADMIN;
					}

				} else {
					// wrong password => login fail
					url = Contansts.URL_LOGIN;
					resultLogin = noExistPassword;
					model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
					session.setAttribute(Contansts.RESULT_LOGIN, resultLogin);

				}
			} else {
				url = Contansts.URL_LOGIN;
				resultLogin = noExistUser;
				model.addAttribute(Contansts.RESULT_LOGIN, resultLogin);
			}

		}

		return url;
	}

	public boolean isValidEmail(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
				+ "A-Z]{2,7}$";

		Pattern pat = Pattern.compile(emailRegex);
		if (email == null)
			return false;
		return pat.matcher(email).matches();
	}

	public void register(User user) {
		userDao.addRegister(user);

	}

	public User findOneUserByEmail(String email) {
		return userDao.findOneUserByEmail(email);
	}

	public User findOneUserByUsername(String uname) {
		return userDao.findOneUserByUsername(uname);
	}

	public void updateUserPwd(User user) {
		userDao.updatePassword(user);
	}

	public User selectOne(int id) {
		return userDao.findOne(id);
	}

	public void Update(User user) {
		userDao.update(user);
	}

	public boolean checkBirthDate(Date birthdate) {

		String sDate1 = "12/12/2020";

		try {
			Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);
			System.out.println("date1 " + date1);
			System.out.println("birthdate " + birthdate);
			if (birthdate.before(date1)) {
				return true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	
	
	/*
	 * @Authod Vo Duc Hoa
	 * 
	 */
	
	public void UpdateAmount(User user) {
		userDao.update(user);
	}
	
	public void updateAmountAdmin(User user) {
		userDao.update(user);
	}
	
}
