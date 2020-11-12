package tp.kits3.learntogether.user.service;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
/*
 * @author VoDucHoa
 */
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.CourseOrderDao;
import tp.kits3.learntogether.user.dao.OrdersDao;
import tp.kits3.learntogether.user.vo.Order;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;
import tp.kits3.learntogether.utils.MailConfig;

@Service
public class OrderService {
	@Autowired 
	private OrdersDao orderdao;
	
	@Autowired
	private CourseOrderDao courseOrderDao;
	
	public List<Order> findAll() {
		List<Order> listAll = orderdao.findAll();
		 return listAll;
	}
	
	public List<Order> findId(int id) {
		List<Order> listid = orderdao.selectId(id);
		return listid;
	}
	
	public void addItemPayment(Order t) {
		orderdao.add(t);
	}
	
	public Order findOne(int id) {
		Order order = orderdao.findOne(id);
		return order;
	}
	
	public Boolean notificationMail(HttpSession session) {
		// Get properties object
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.host", MailConfig.HOST_NAME);
      props.put("mail.smtp.socketFactory.port", MailConfig.SSL_PORT);
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      props.put("mail.smtp.port", MailConfig.SSL_PORT);

      // get Session
      Session session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD);
          }
      }); 
      
      try {
          MimeMessage message = new MimeMessage(session1);
          message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
          message.setSubject("Notification Payment Courses");
          message.setText("You has payed success of Course!");
          // send message
         Transport.send(message); 
         System.out.println("Message sent successfully");  
         session.setAttribute("checkSended", user.getEmail());
         return true;
         
         
      } catch (Exception e) { 
    	  session.setAttribute("checkSended", "notEmail");
    	  System.out.println("Message sent unsuccessfully");
    	  return false;
      }
	}
	
	
	public Double priceAmount(int iduser) {
		System.out.println("----" + iduser);
		Double priceAdminPart = 0.0;
		List<Order> listorder = orderdao.selectId(iduser);
		for (Order totalorder : listorder) {
			priceAdminPart += totalorder.getTotalamount();
		}
		priceAdminPart = priceAdminPart*(0.2);
		return priceAdminPart;
	}

	
}
