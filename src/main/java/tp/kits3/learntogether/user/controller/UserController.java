package tp.kits3.learntogether.user.controller;

/**
 * @author Cong
 *
 */

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import tp.kits3.learntogether.user.dto.MyCourses;
import tp.kits3.learntogether.user.dto.UserInstructorCourses;
import tp.kits3.learntogether.user.service.CategoryService;
import tp.kits3.learntogether.user.service.CoursesService;
import tp.kits3.learntogether.user.service.MyCoursesService;
import tp.kits3.learntogether.user.service.RatingService;
import tp.kits3.learntogether.user.service.UserInstructorCourseSerivce;
import tp.kits3.learntogether.user.service.UserService;
import tp.kits3.learntogether.user.vo.Category;
import tp.kits3.learntogether.user.vo.Rating;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

@Controller
public class UserController {

	@Autowired
	UserService userservice;

	@Autowired
	private CoursesService courseService;

	@Autowired
	private UserInstructorCourseSerivce CourUserIntrService;

	@Autowired
	private MyCoursesService myCoursesService;

	@Autowired
	private RatingService ratingService;

	@Autowired
	private CategoryService cateadservice;

	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public String edit(Model model, @ModelAttribute("updateUser") User singleUser, HttpSession session) {

		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		singleUser = userservice.selectOne(user.getId());
		model.addAttribute("SingleUser", singleUser);
		return "editprofileuser";
	}

	@RequestMapping(value = "updateUserProfile", method = RequestMethod.GET)
	public String editt(Model model, HttpSession session, @RequestParam("fullName") String fullName,
			@RequestParam("address") String address, @RequestParam("headLine") String headLine,
			@RequestParam("biography") String biography, @RequestParam("userNameFb") String userNameFb

	) {

		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		User singleUser = userservice.selectOne(user.getId());

		singleUser.setAddress(address);
		singleUser.setFullname(fullName);
		singleUser.setHeadLine(headLine);
		singleUser.setBiography(biography);
		singleUser.setUserNameFb(userNameFb);

		userservice.Update(singleUser);
		System.out.println(singleUser.getAddress());

		return "redirect:/updateUser";
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(Model model, HttpSession session, @RequestParam("text") String text) {
		// System.out.println(text);
		text = "%" + text + "%";
		System.out.println(text);
		List<UserInstructorCourses> listcourse = CourUserIntrService.getBySearch(text);
		model.addAttribute("ListCourses", listcourse);
		return "courses";
	}

	@RequestMapping(value = "update/photoUser", method = RequestMethod.GET)
	public String editPhoto(Model model, @ModelAttribute("updateUser") User singleUser, HttpSession session) {

		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		singleUser = userservice.selectOne(user.getId());
		model.addAttribute("SingleUser", singleUser);
		return "editphotouser";
	}

	@RequestMapping(value = "/update/savefile", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam CommonsMultipartFile file, HttpSession session,
			@ModelAttribute("updateUser") User singleUser) {
		String path = session.getServletContext().getRealPath("resources/images");
		// String path=session.getServletContext().getRealPath("ss");
		// System.out.println(path);

		/*
		 * path = path.replace("\\eclipse-workspace", ""); path =
		 * path.replace("\\wtpwebapps", ""); path = path.replace("\\learntogether", "");
		 * path =
		 * path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\", "");
		 */
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		singleUser = userservice.selectOne(user.getId());
		// String path =
		// "C:\\Users\\phaml\\git\\kits-03-learntogether\\src\\main\\webapp\\resources\\images";
		String relativeWebPath = "/WEB-INF/uploads";
		String absoluteFilePath = session.getServletContext().getRealPath(relativeWebPath);
		System.out.println(absoluteFilePath);
		File uploadRootDir = new File(path);
		//
		// make root folder upload if doesn't exists.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		// Change image name to avoid having the same name
		String originFileName = file.getOriginalFilename();
		String suffix = originFileName.substring(originFileName.lastIndexOf("."));
		String filename = UUID.randomUUID().toString() + suffix;

		System.out.println(path + " " + filename);
		try {
			byte bytes[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + "/" + filename));
			bout.write(bytes);
			bout.flush();
			bout.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		singleUser.setUrlimg(filename);
		userservice.Update(singleUser);
		singleUser = userservice.selectOne(user.getId());
		session.setAttribute(Contansts.USER_LOGGED, singleUser);
		return new ModelAndView("redirect:/update/photoUser", "filename", path + "/" + filename);
	}

	@RequestMapping(value = "/mycourses", method = RequestMethod.GET)
	public String myCourses(Model model, HttpSession session) {
		List<Category> cate = cateadservice.getCategoryListByApprovedCourses();
		model.addAttribute("cate", cate);
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		User singleUser = userservice.selectOne(user.getId());
		// System.out.println(user.getId());
		List<MyCourses> listcourse = myCoursesService.getAll(user.getId());
		List<Rating> listRating = ratingService.getAll(user.getId());
		int sum = 0;
		for (int i = 0; i < listcourse.size(); i++) {
			Rating rating = ratingService.findOneByUser((listcourse.get(i).getId()), user.getId());
			listcourse.get(i).setRating(rating);
		}
		model.addAttribute("ListCourses", listcourse);
		return "mycourses";
	}

	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public String sendRating(HttpSession session, @RequestParam("hdrating") float hdrating,
			@RequestParam("idCourse") int idCourse) {

		System.out.println("rating" + hdrating);
		System.out.println("aa" + idCourse);
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		User singleUser = userservice.selectOne(user.getId());
		System.out.println(user.getId());
		Rating rating = new Rating();
		rating.setCourseId(idCourse);
		rating.setRatevalue(hdrating);
		rating.setUserId(user.getId());
		ratingService.addRating(rating);

		return "redirect:/mycourses";
	}

	@RequestMapping(value = "/deleteRating", method = RequestMethod.GET)
	public String deleteRating(HttpSession session, @RequestParam("idCourse") int idCourse) {

		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		User singleUser = userservice.selectOne(user.getId());
		Rating rating = ratingService.findOneByUser(idCourse, user.getId());

		ratingService.deleteRating(idCourse, user.getId());

		return "redirect:/mycourses";
	}

}