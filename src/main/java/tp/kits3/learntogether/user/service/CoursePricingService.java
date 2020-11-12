package tp.kits3.learntogether.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tp.kits3.learntogether.user.dao.CoursePricingDao;
import tp.kits3.learntogether.user.vo.CoursePricing;

@Service
public class CoursePricingService {
	
	@Autowired
	private CoursePricingDao dao;
	
	public List<CoursePricing> getCoursePricingList(){
		return dao.findAll();
	}
}
