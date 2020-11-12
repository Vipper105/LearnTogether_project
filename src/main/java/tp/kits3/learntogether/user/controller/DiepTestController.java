package tp.kits3.learntogether.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/diep")
public class DiepTestController {

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String testDiep(Model model) {
		
		return "instructor/NewFile";
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String testDiep1(Model model) {
		
		return "result";
	}
	
}
