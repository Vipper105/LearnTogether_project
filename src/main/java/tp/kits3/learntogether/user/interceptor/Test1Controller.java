package tp.kits3.learntogether.user.interceptor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test1")
public class Test1Controller {

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String createCourse_Step(Model model) {

		return "instructor/instructor-dashboard";
	}

}
