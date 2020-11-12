package tp.kits3.learntogether.user.interceptor;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import tp.kits3.learntogether.user.vo.Status;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

public class MarkEssayTestInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// check when user want to do see section, user have to login
		User user = (User) request.getSession().getAttribute(Contansts.USER_LOGGED);

		List<Status> listStatus = (ArrayList<Status>) request.getSession().getAttribute("listStatusOfUser");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login-page");

		} else if (user != null) {
			// if user not have right No_see_section redirect to error page
			for (int i = 0; i < listStatus.size(); i++) {
				if (listStatus.get(i).getStatusname().equalsIgnoreCase("No_mark_essay_test")) {
					// redirect login page
					response.sendRedirect(request.getContextPath() + "/authen-error-page");
					return false;
				}
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
