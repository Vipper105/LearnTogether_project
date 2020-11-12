package tp.kits3.learntogether.user.service;
/**
 * @author pho
 */

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.user.dao.CourseOrderDao;
import tp.kits3.learntogether.user.dao.CoursesDao;
import tp.kits3.learntogether.user.dao.InstructorDao;
import tp.kits3.learntogether.user.dao.RatingDao;
import tp.kits3.learntogether.user.dao.UserDao;
import tp.kits3.learntogether.user.dto.UserInstructorCourses;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.CourseOrder;
import tp.kits3.learntogether.user.vo.Instructor;
import tp.kits3.learntogether.user.vo.Rating;
import tp.kits3.learntogether.user.vo.User;



@Service
public class UserInstructorCourseSerivce {
	
	@Autowired private CoursesDao courdao;
	@Autowired private InstructorDao instrdao;
	@Autowired private UserDao userdao;
	@Autowired private RatingDao ratingdao;
	@Autowired private CourseOrderDao courorderdao;
	/* @Autowired private UserInstructorCourses uic;  
	 * neu khoi tao truoc thi dung chung de chi luu tru ket qua cuoi cung*/
	
	public List<UserInstructorCourses> getCourOneCate(int idcate){
			List<Course> liscourse = courdao.findOneCourCate(idcate);
			List<UserInstructorCourses> list = new ArrayList<UserInstructorCourses>();
			for (int i = 0; i < liscourse.size(); i++) {
				
				int idintr = liscourse.get(i).getInstructorId();
				Instructor iduser = instrdao.findOne(idintr);
				User nameuser = userdao.findOne(iduser.getUserId());
				UserInstructorCourses uic = new UserInstructorCourses();
				
				List<Rating> listRating = ratingdao.findAllByCourse(liscourse.get(i).getId());
				liscourse.get(i).setRatingList(listRating);
				float sum = 0;
				int count=0;
				for(int k = 0 ; k < listRating.size(); k++) {
					sum += listRating.get(k).getRatevalue();
					count++;
				}
				
				float average= (float)Math.round(((float)sum/count)*100)/100;
				liscourse.get(i).setAverage(average);
				liscourse.get(i).setCount(count);
				
				
				uic.setCourse(liscourse.get(i));
				uic.setInstructor(iduser);
				uic.setUser(nameuser);
				
				list.add(uic);
			}
		return list;
	}
	

	public UserInstructorCourses getCourOne(int id){ 
		Course liscourse = courdao.findOne(id);
		
		// get info instructor and user of course
		int idintr = liscourse.getInstructorId();
		Instructor iduser = instrdao.findOne(idintr);
		User nameuser = userdao.findOne(iduser.getUserId());
		UserInstructorCourses uic = new UserInstructorCourses();
		
		//Rating of course
		List<Rating> listRating = ratingdao.findAllByCourse(liscourse.getId());
		liscourse.setRatingList(listRating);
		float sum = 0;
		int count = 0;
		for(int k = 0 ; k < listRating.size(); k++) {
			sum += listRating.get(k).getRatevalue();
			count++;
		}
		
		float average= (float)Math.round(((float)sum/count)*100)/100;
		liscourse.setAverage(average);
		liscourse.setCount(count);
		
		//total course purchased
		List<CourseOrder> listcourorder= courorderdao.findAll();
		int totalpurchased = 0;
		for (int i = 0; i < listcourorder.size(); i++) {
			if(listcourorder.get(i).getCourseId()==id) {
				totalpurchased += 1; 
			}
		}
		liscourse.setTotalPurchased(totalpurchased);
	
		uic.setCourse(liscourse);
		uic.setInstructor(iduser);
		uic.setUser(nameuser);

		return uic; 
	} 
	
	public List<UserInstructorCourses> getAllLimit(int page) {
		List<Course> listcourse = courdao.findCourseLimit(page);
		List<UserInstructorCourses> list = new ArrayList<UserInstructorCourses>();
		for (int i = 0; i < listcourse.size(); i++) {
			
			int idintr = listcourse.get(i).getInstructorId();
			Instructor iduser = instrdao.findOne(idintr);
			User nameuser = userdao.findOne(iduser.getUserId());
			UserInstructorCourses uic = new UserInstructorCourses();
			
			List<Rating> listRating = ratingdao.findAllByCourse(listcourse.get(i).getId());
			listcourse.get(i).setRatingList(listRating);
			float sum = 0;
			int count=0;
			for(int k = 0 ; k < listRating.size(); k++) {
				sum += listRating.get(k).getRatevalue();
				count++;
			}
			
			float average=(float)Math.round(((float)sum/count)*100)/100;
			listcourse.get(i).setAverage(average);
			listcourse.get(i).setCount(count);
			
			uic.setCourse(listcourse.get(i));
			uic.setInstructor(iduser);
			uic.setUser(nameuser);
			
			list.add(uic);
		}
		return list;
	}
	
	public int getSizeAllView() {
		int listcourse = courdao.findAllView().size();
		return listcourse;
	}
	
	public List<UserInstructorCourses> getBySearch(String txt) {
		List<Course> listcourse = courdao.findBySearch(txt);
		List<UserInstructorCourses> list = new ArrayList<UserInstructorCourses>();
		for (int i = 0; i < listcourse.size(); i++) {
			
			int idintr = listcourse.get(i).getInstructorId();
			Instructor iduser = instrdao.findOne(idintr);
			User nameuser = userdao.findOne(iduser.getUserId());
			UserInstructorCourses uic = new UserInstructorCourses();
			
			List<Rating> listRating = ratingdao.findAllByCourse(listcourse.get(i).getId());
			listcourse.get(i).setRatingList(listRating);
			float sum = 0;
			int count=0;
			for(int k = 0 ; k < listRating.size(); k++) {
				sum += listRating.get(k).getRatevalue();
				count++;
			}
			
			float average=(float)Math.round(((float)sum/count)*100)/100;
			listcourse.get(i).setAverage(average);
			listcourse.get(i).setCount(count);
			
			uic.setCourse(listcourse.get(i));
			uic.setInstructor(iduser);
			uic.setUser(nameuser);
			list.add(uic);
		}
		return list;
	
	}
	
	
	public List<UserInstructorCourses> getAll() {
		List<Course> listcourse = courdao.findAllView();
		List<UserInstructorCourses> list = new ArrayList<UserInstructorCourses>();
		for (int i = 0; i < listcourse.size(); i++) {
			
			int idintr = listcourse.get(i).getInstructorId();
			Instructor iduser = instrdao.findOne(idintr);
			User nameuser = userdao.findOne(iduser.getUserId());
			UserInstructorCourses uic = new UserInstructorCourses();
			
			List<Rating> listRating = ratingdao.findAllByCourse(listcourse.get(i).getId());
			listcourse.get(i).setRatingList(listRating);
			float sum = 0;
			int count=0;
			for(int k = 0 ; k < listRating.size(); k++) {
				sum += listRating.get(k).getRatevalue();
				count++;
			}
			
			float average=(float)Math.round(((float)sum/count)*100)/100;
			listcourse.get(i).setAverage(average);
			listcourse.get(i).setCount(count);
			
			uic.setCourse(listcourse.get(i));
			uic.setInstructor(iduser);
			uic.setUser(nameuser);
			
			list.add(uic);
		}
		return list;
	}
	
}
