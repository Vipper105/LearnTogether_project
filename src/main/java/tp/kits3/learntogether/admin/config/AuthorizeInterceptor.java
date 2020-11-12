package tp.kits3.learntogether.admin.config;
/**
 * @author NguyenDoanNam
 * 
 * */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

@Component
public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	 @Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = (User) request.getSession().getAttribute(Contansts.USER_LOGGED);
		if (user == null) {
			System.out.println("null");
			response.sendRedirect(request.getContextPath() + "/login-page");
		} else if (user != null) {
			return true;
			}
		return false;	
	}
	

}
