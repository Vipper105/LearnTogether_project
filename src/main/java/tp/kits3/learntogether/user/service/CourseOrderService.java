package tp.kits3.learntogether.user.service;

/**
 * @author VoDucHoa
 */

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.CourseOrderDao;
import tp.kits3.learntogether.user.dao.CoursesDao;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.CourseOrder;

@Service
public class CourseOrderService {
	@Autowired
	private CoursesDao coursedao;

	@Autowired
	private CourseOrderDao courseOrderDao;
	
	public HashMap<Integer, CourseOrder> addCart1(int id, HashMap<Integer, CourseOrder> cart) {
		CourseOrder courseorder = new CourseOrder();
		Course course = coursedao.findOne(id);
		if (course != null) {
			courseorder.setCourse(course);
			courseorder.setQuantity(1);;
		}
		cart.put(id, courseorder);
		return cart;
	}

	public HashMap<Integer, CourseOrder> deleteCart(int id, HashMap<Integer, CourseOrder> cart) {
		if (cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}

	public int countCart(HashMap<Integer, CourseOrder> cart) {
		int count = 0;
		for (Map.Entry<Integer, CourseOrder> itemcart : cart.entrySet()) {
			count += itemcart.getValue().getQuantity();
		}
		return count;
	}

	
	public Double countPrice(HashMap<Integer, CourseOrder> cart){ 
		 Double countPrice = 0.0; 
		  for (Map.Entry<Integer, CourseOrder> itemcart : cart.entrySet()) {
			  countPrice += itemcart.getValue().getCourse().getPriceCourse(); 
		}
		  return countPrice; 
	}
	
	/*
	 * public List<CourseOrder> findId(int id) { List<CourseOrder> listidCourse =
	 * return null; }
	 */
	  
	public void addIntoCourseOrder(CourseOrder courseorder) {
		courseOrderDao.add(courseorder);
	}
}
