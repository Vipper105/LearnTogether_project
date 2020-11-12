package tp.kits3.learntogether.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.learntogether.utils.Contansts;

/**
 * @author PhungDinhHuy
 *
 */

@Controller
public class Authen_Controller {

	@RequestMapping(value = "/authen-error-page", method = RequestMethod.GET)
	public String noCreateCourse(Model model) {
		return Contansts.URL_AUTHEN_ERROR;
	}

}
