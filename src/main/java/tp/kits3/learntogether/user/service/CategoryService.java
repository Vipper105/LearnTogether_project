package tp.kits3.learntogether.user.service;

/**
 * @author VoVanPho
 */

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.CategoryDao;
import tp.kits3.learntogether.user.vo.Category;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao dao;
	
	@Autowired
	private UserInstructorCourseSerivce courService;

	public List<Category> getCategoryList() {
		return dao.findAll();
	}

	public List<Category> getCategoryListByApprovedCourses() {
		List<Category> categoryList = dao.findAll();
		List<Category> catelist = new ArrayList<Category>();
		//check category was coursed
		for (int i = 0; i < categoryList.size(); i++) {
			if (check(categoryList.get(i).getId()) == true) {
				catelist.add(categoryList.get(i));
			}
		}
		return catelist;
	}

	public boolean check(int id) {
		if (courService.getCourOneCate(id).size() > 0) {
			return true;
		}
		return false;
	}

}
