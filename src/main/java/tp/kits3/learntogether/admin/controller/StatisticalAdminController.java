package tp.kits3.learntogether.admin.controller;

/**
 * @author NguyenDoanNam
 */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import tp.kits3.learntogether.admin.service.CourseAdminService;
import tp.kits3.learntogether.admin.service.OrderAdminService;
import tp.kits3.learntogether.admin.service.UserAdminService;

@Controller
public class StatisticalAdminController {
	
	@Autowired
	OrderAdminService orderAdminService;
	
	@Autowired
	UserAdminService userAdminService;
	
	@Autowired
	CourseAdminService courseAdminService;

	@RequestMapping(value = "/admin/statistical", method = RequestMethod.GET)
	public String listUser(Model model) {
		try {
			Integer sumOrder = orderAdminService.selectSumOrder();
			List<Integer> listYear = orderAdminService.selectYear();
			Integer selectTotalClient = userAdminService.selectTotalClient();
			Integer selectNewUser = userAdminService.selectNewUser();
			List<String> categoryNameList = new ArrayList<String>();
			List<Object> quantityList = new ArrayList<Object>();
			List<HashMap<String, Object>> list = courseAdminService.selectCategory();
			for (HashMap<String, Object> map : list) {
				  String categoryName = "'"+(String) map.get("categoryName")+"'"; 
				  Object quantity = map.get("quantity"); 
				  categoryNameList.add(categoryName);
				  quantityList.add(quantity);	 
			}
            model.addAttribute("categoryNameList", categoryNameList);
            model.addAttribute("quantityList", quantityList);
			model.addAttribute("sumOrder", sumOrder);
			model.addAttribute("listYear", listYear);
			model.addAttribute("selectTotalClient", selectTotalClient);
			model.addAttribute("selectNewUser", selectNewUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/statistical/index";
	}

	@RequestMapping(value = "/admin/selectOrderYear/{year}", method = RequestMethod.GET)
	@ResponseBody
	public List<Integer> findbyId(Model model, @PathVariable("year") Integer year) {
		try {
			List<Integer> listOrder = new ArrayList<Integer>();
			for (int month = 1; month <= 12; month++) {
				Integer order = orderAdminService.selectOrderByYear(month, year);
				listOrder.add(order);
			}
			return listOrder;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
