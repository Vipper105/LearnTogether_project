package tp.kits3.learntogether.user.controller;

/**
* 	@author: Diep Nguyen
*/

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tp.kits3.learntogether.user.dto.JsonData;
import tp.kits3.learntogether.user.service.AnswerEssayqService;
import tp.kits3.learntogether.user.service.AnswerMultichoiceqService;
import tp.kits3.learntogether.user.service.CategoryService;
import tp.kits3.learntogether.user.service.CourseLevelService;
import tp.kits3.learntogether.user.service.CoursePricingService;
import tp.kits3.learntogether.user.service.CourseService_Diep;
import tp.kits3.learntogether.user.service.CoursesService;
import tp.kits3.learntogether.user.service.EssayQuestionService;
import tp.kits3.learntogether.user.service.InstructorService;
import tp.kits3.learntogether.user.service.LessonService;
import tp.kits3.learntogether.user.service.MultichoiceQuestionService;
import tp.kits3.learntogether.user.service.ResultEssayqService;
import tp.kits3.learntogether.user.service.ResultMultiqService;
import tp.kits3.learntogether.user.service.SectionService;
import tp.kits3.learntogether.user.service.TestResultService;
import tp.kits3.learntogether.user.service.TestService;
import tp.kits3.learntogether.user.service.TestTypeService;
import tp.kits3.learntogether.user.service.UserService;
import tp.kits3.learntogether.user.vo.AnswerEssayq;
import tp.kits3.learntogether.user.vo.AnswerMultichoiceq;
import tp.kits3.learntogether.user.vo.Category;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.CourseLevel;
import tp.kits3.learntogether.user.vo.CoursePricing;
import tp.kits3.learntogether.user.vo.EssayQuestion;
import tp.kits3.learntogether.user.vo.Instructor;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;
import tp.kits3.learntogether.user.vo.Resultessayq;
import tp.kits3.learntogether.user.vo.Section;
import tp.kits3.learntogether.user.vo.Test;
import tp.kits3.learntogether.user.vo.TestResult;
import tp.kits3.learntogether.user.vo.TestType;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

@Controller
@RequestMapping("/instructor")
public class InstructorController {

	@Autowired
	private InstructorService instructorService;

	@Autowired
	private CourseService_Diep courseService;

	@Autowired
	private CoursePricingService pricingService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CourseLevelService courseLevelService;

	@Autowired
	private SectionService sectionService;

	@Autowired
	private LessonService lessonService;

	@Autowired
	private CoursesService coursesService;

	@Autowired
	private TestService testService;

	@Autowired
	private ResultEssayqService resultEssayqService;

	@Autowired
	private EssayQuestionService essayQuestionService;

	@Autowired
	private UserService userService;

	@Autowired
	private AnswerEssayqService answerEssayqService;

	@Autowired
	private TestResultService testResultService;

	@Autowired
	private TestTypeService testTypeService;

	@Autowired
	private MultichoiceQuestionService multichoiceqService;

	@Autowired
	private AnswerMultichoiceqService answerMultichoiceqService;

	@Autowired
	private ResultMultiqService resultMultiqService;

	private User logginedUser;
	private List<Category> categoryList;
	private List<CourseLevel> courseLevelList;

	@PostConstruct
	private void ini() {
		courseLevelList = courseLevelService.getCourseLevelList();
		categoryList = categoryService.getCategoryList();
	}

	@RequestMapping(value = "/courses", method = RequestMethod.GET)
	public String getInstructorDashboard(Model model, HttpSession session, @RequestParam(required = false) String deleteCourse) {
		// remove newcourse from session on instructor-dashboard page
		session.removeAttribute("newCourse");
		logginedUser = (User) session.getAttribute(Contansts.USER_LOGGED);
		Instructor instructor = instructorService.getInstructorByUserID(logginedUser.getId());
		if (instructor == null) {
			instructor = new Instructor(logginedUser.getId());
			instructorService.addInstructor(instructor);
		}
		List<Course> draftList = courseService.getDraftCoursesByInstructorID(instructor.getId());
		session.setAttribute("instructor", instructor);
		model.addAttribute("draftList", draftList);
		model.addAttribute("logginedUser", logginedUser);
		model.addAttribute("deleteCourse", deleteCourse);
		return "instructor/instructor-dashboard";
	}

	@RequestMapping(value = "/course/{courseId}/manage/basics", method = RequestMethod.GET)
	public String getSelectedCourse(Model model, @PathVariable(name = "courseId") int courseId, HttpSession session,
			HttpServletRequest request) throws IOException {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		Course selectedCourse = null;
		if (session.getAttribute("newCourse") == null) {
			selectedCourse = courseService.getCourseByID(courseId);
		} else {
			selectedCourse = (Course) session.getAttribute("newCourse");
		}

		String saveImageFolder = "D:\\Images\\";
		String loadImageFolder = "resources/images/upload/";
		File imageFolder = new File(saveImageFolder);
		File source = new File(saveImageFolder + selectedCourse.getUrlImg());
		File target = new File(session.getServletContext().getRealPath(loadImageFolder));
		if (!imageFolder.exists()) {
			imageFolder.mkdir();
			FileUtils.copyFileToDirectory(
					new File(session.getServletContext().getRealPath(loadImageFolder) + "course-placeholder.png"),
					imageFolder);
		}

		FileUtils.copyFileToDirectory(source, target);

		int totalDurationByCourseID = lessonService.calculateTotalVideoDurationByCourseID(courseId);
		selectedCourse.setTotalVideoDuration(totalDurationByCourseID);
		selectedCourse.setUser(userService.findOneUserByUsername(user.getUsername()));
		
		session.setAttribute("selectedCourse", selectedCourse);
		model.addAttribute("CategoryList", categoryList);
		model.addAttribute("CourseLevelList", courseLevelList);

		return "instructor/course-manage";
	}

	@RequestMapping(value = "/course/{courseId}/manage/basics", method = RequestMethod.POST)
	public String updateCourse(@RequestParam(required = false) MultipartFile uploadImage,
								@RequestParam(required = false) String action,
								@PathVariable(name = "courseId") int courseId,
								Course newCourse, Model model,
								HttpSession session, HttpServletRequest request) {
		Course selectedCourse = (Course) session.getAttribute("selectedCourse");
		if(action.equals("Submit for Review")) {
			//Course course = courseService.getCourseByID(courseId);
			selectedCourse.setSubmit(true);
			courseService.updateSelectedCourse(selectedCourse);
		}else if (action.equals("Save")) {
			
			selectedCourse.setCourseTitle(newCourse.getCourseTitle());
			selectedCourse.setDescription(newCourse.getDescription());
			selectedCourse.setCourseLevelId(newCourse.getCourseLevelId());
			selectedCourse.setCategoryId(newCourse.getCategoryId());
			if (!uploadImage.getOriginalFilename().isEmpty()) {
				selectedCourse.setUrlImg(uploadImage.getOriginalFilename());
			}

			// save image
			String targetPath = "D:\\Images";
			File imageFile = new File(targetPath, uploadImage.getOriginalFilename());
			try {
				uploadImage.transferTo(imageFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			String imageAddress = request.getContextPath() + File.separator + "resources" + File.separator + "images"
					+ File.separator + "upload" + File.separator + uploadImage.getOriginalFilename();
			model.addAttribute("imageAddress", imageAddress);

			courseService.updateSelectedCourse(selectedCourse);

			model.addAttribute("CategoryList", categoryList);
			model.addAttribute("CourseLevelList", courseLevelList);
		}
		session.setAttribute("selectedCourse", selectedCourse);
		String courseManageView = "redirect:/instructor/course/" + courseId + "/manage/basics";
		return courseManageView;
	}

	@RequestMapping(value = "/course/{courseId}/manage/curriculum", method = RequestMethod.GET)
	public String getSectionListByCourseID(Model model, @PathVariable(name = "courseId") int courseId,
			HttpSession session) throws IOException {
		Map<Section, List<Lesson>> sectionLessonMap = sectionService.getAllSectionLessonByCourseID(courseId);

		String saveVideoFolder = "D:\\Videos\\";
		// String a = session.getServletContext().getInitParameter("").toString();
		String loadVideoFolder = "resources/videos/upload/";

		for (Map.Entry<Section, List<Lesson>> me : sectionLessonMap.entrySet()) {
			List<Lesson> lessonList = (List<Lesson>) me.getValue();
			for (Lesson lesson : lessonList) {
				if (lesson.getUrlVid() != null) {
					File source = new File(saveVideoFolder + lesson.getUrlVid());
					File target = new File(session.getServletContext().getRealPath(loadVideoFolder));
					FileUtils.copyFileToDirectory(source, target);
				}
			}
		}
		
		/*
		 * Course selectedCourse = (Course) session.getAttribute("selectedCourse");
		 * 
		 * session.setAttribute("selectedCourse", selectedCourse);
		 */
		 
		 model.addAttribute("sectionLessonMap", sectionLessonMap); 
		return "instructor/curriculum";
	}

	@RequestMapping(value = "/course/{courseId}/manage/curriculum", method = RequestMethod.POST)
	public String addnEdit_SectionLecture(Model model, @PathVariable(name = "courseId") int courseId,
			@RequestParam(required = false) String[] title, @RequestParam(required = false) String[] editSectionTitle,
			@RequestParam(required = false) int[] sectionID, @RequestParam(required = false) int[] lessonID,
			@RequestParam(required = false) Integer sectionIndex, @RequestParam(required = false) Integer lessionIndex,
			@RequestParam(required = false) String action, @RequestParam(required = false) MultipartFile uploadVideo,
			@RequestParam(required = false) String sectionDescription,
			@RequestParam(required = false) String[] lessonDescription,
			@RequestParam(required = false) String[] editSectionDescription,
			@RequestParam(required = false) String[] editLessonTitle,
			@RequestParam(required = false) Integer selectedLessonID,
			@RequestParam(required = false) Double[] videoDuration,
			RedirectAttributes redirectAttributes, HttpSession session) {

		
		String url = "redirect:/instructor/course/" + courseId + "/manage/curriculum";

		if (action.equals("Add section")) {
			Section newSection = new Section();
			newSection.setTitle(title[title.length - 1]);
			newSection.setDescription(sectionDescription);
			newSection.setCourseId(courseId);
			sectionService.addSection(newSection);

		} else if (action.equals("Add lecture")) {
			Lesson newLesson = new Lesson();

			newLesson.setTitle(title[sectionIndex - 1]);
			newLesson.setSectionId(sectionID[sectionIndex - 1]);
			lessonService.addLesson(newLesson);
		} else if (action.equals("Save")) {
			// get lesson by lesson ID
			Lesson lesson = lessonService.getLessonByID(lessonID[lessionIndex]);
			if (lessonDescription.length == 0) {
				lesson.setDescription(null);
			} else {
				lesson.setDescription(lessonDescription[lessionIndex]);
			}

			// save video
			if (!uploadVideo.getOriginalFilename().isEmpty()) {
				String saveVideoFolder = "D:\\Videos";
				File videoFolder = new File(saveVideoFolder);
				if (!videoFolder.exists()) {
					videoFolder.mkdir();
				}
				File videoFile = new File(saveVideoFolder, uploadVideo.getOriginalFilename());

				try {
					uploadVideo.transferTo(videoFile);
					lesson.setUrlVid(uploadVideo.getOriginalFilename());
					int duration = (int) ((Math.ceil(videoDuration[lessionIndex])) / 60);
					lesson.setVideoDuration(duration);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			lessonService.update(lesson);
		} else if (action.equals("Save section")) {
			Section section = sectionService.findOneSection(sectionID[sectionIndex - 1]);
			section.setTitle(editSectionTitle[sectionIndex - 1]);

			if (editSectionDescription != null) {
				section.setDescription(editSectionDescription[sectionIndex - 1]);
			}
			sectionService.updateSection(section);
		} else if (action.equals("Save lecture")) {
			Lesson lesson = lessonService.getLessonByID(selectedLessonID);
			lesson.setTitle(editLessonTitle[lessionIndex]);
			lessonService.update(lesson);
		} else if (action.equals("OK")) {
			if(selectedLessonID != null) {
				lessonService.deleteLessonByID((selectedLessonID));
			}else if (editLessonTitle == null) {
				sectionService.deleteSectionByID(sectionID[sectionIndex-1]);
			}
		} else if(action.equals("Submit for Review")) {
			//Course course = courseService.getCourseByID(courseId);
			
			Course selectedCourse = (Course) session.getAttribute("selectedCourse");
			selectedCourse.setSubmit(true);
			courseService.updateSelectedCourse(selectedCourse);
		} else if (action.equals("Cancel")) {
			return url;
		}
		return url;
	}

	@RequestMapping(value = "/course/{courseId}/manage/pricing", method = RequestMethod.GET)
	public String getPricing(Model model, @PathVariable(name = "courseId") int courseId, HttpSession session) {
		List<CoursePricing> coursePricing = pricingService.getCoursePricingList();
		model.addAttribute("coursePricing", coursePricing);
		return "instructor/pricing";
	}

	@RequestMapping(value = "/course/{courseId}/manage/pricing", method = RequestMethod.POST)
	public String postPricing(Model model, @PathVariable(name = "courseId") int courseId,
			@RequestParam(required = false) Double pricing, HttpSession session) {
		Course course = (Course) session.getAttribute("selectedCourse");

		if (pricing == 0.0) {
			course.setFree(true);
		} else {
			course.setPriceCourse(pricing);
		}
		courseService.updateSelectedCourse(course);
		String getPricingURL = "redirect:/instructor/course/" + courseId + "/manage/pricing";
		return getPricingURL;
	}
	


	/**
	 * =================================================================================================
	 * 
	 * @author: PhungDinhHuy
	 * 
	 */

	// show essays not be marked yet
	@RequestMapping(value = "/show-essay-not-marked", method = RequestMethod.GET)
	public String showEssayNotYetMarked(Model model, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);

		Instructor instructor = instructorService.getInstructorByUserID(user.getId());
		List<Course> listCourse = coursesService.findCoursesByInstructorID(instructor.getId());
		for (int i = 0; i < listCourse.size(); i++) {
			List<Section> listSection = sectionService.getSectionByCourseID(listCourse.get(i).getId());
			listCourse.get(i).setListSection(listSection);

			for (int j = 0; j < listSection.size(); j++) {
				// tìm tất cả các test
				List<Test> listTest = testService.findAllTestBySectionID(listSection.get(j).getId());
				listSection.get(j).setListTest(listTest);

				for (int k = 0; k < listTest.size(); k++) {
					// Test test=testService.findOneTest(listTest.get(k).getId());
					Test test = listTest.get(k);
					TestType testType = testTypeService.findOneByTestTypeId(test.getTypeid());

					test.setTestType(testType);

					List<Resultessayq> listResultEssay = null;
					if (test.getTestType().getType().equalsIgnoreCase("Essay")) {

						listResultEssay = resultEssayqService.findAllTestNotMarkByTestID(test.getId());

						// add list result to test
						if (listResultEssay.size() > 0) {
							test.setListResultessayq(listResultEssay);
						} else {
							test.setListResultessayq(null);
						}
					}
				}
			}
		}

		instructor.setListCourse(listCourse);

		model.addAttribute("instructor", instructor);

		return "instructor_dashboard_show_essay";
	}

	@RequestMapping(value = "/show-essay-not-marked/{testId}", method = RequestMethod.GET)
	public String showTestNotYetMarked(Model model, HttpSession session, @PathVariable("testId") int testId) {

		List<Resultessayq> listResultEssay = resultEssayqService.findAllTestNotMarkByTestID(testId);

		List<Resultessayq> listRS = null;
		Test test = null;

		List<Test> listTest = new ArrayList<>();
		while (listResultEssay.size() > 0) {

			int i = 0;
			int j = 1;
			test = testService.findOneTest(testId);
			listRS = new ArrayList<>();
			listRS.add(listResultEssay.get(i));
			while (j < listResultEssay.size()
					&& listResultEssay.get(i).getTimesDoTest() == listResultEssay.get(j).getTimesDoTest()) {

				listResultEssay.remove(j);

			}
			listResultEssay.remove(i);
			test.setListResultessayq(listRS);
			listTest.add(test);
		}

		for (int i = 0; i < listTest.size(); i++) {

			int listResultessayq_size = listTest.get(i).getListResultessayq().size();
			for (int j = 0; j < listResultessayq_size; j++) {
				User user = userService.selectOne(listTest.get(i).getListResultessayq().get(j).getUserid());
				listTest.get(i).getListResultessayq().get(j).setUser(user);
			}

		}

		model.addAttribute("listTestNotMarkedYet", listTest);

		return Contansts.URL_SHOW_TEST_NOT_MARKED;
	}

	@RequestMapping(value = "/show-test-not-score-to-mark/{testId}/{timesdotest}/{userId}/{sectionId}", method = RequestMethod.GET)
	public String showContentTestNotYetMarked(Model model, HttpSession session, @PathVariable("testId") int testId,
			@PathVariable("timesdotest") int timesdotest, @PathVariable("userId") int userId) {

		Test test = testService.findOneTest(testId);

		List<EssayQuestion> listEssayQ = essayQuestionService.findAllQuestionByTestID(test.getId());

		// int timesDoTest,int questionId,int userId,int testId
		for (int i = 0; i < listEssayQ.size(); i++) {
			AnswerEssayq anEssayq = answerEssayqService.findAnswerByQuestionID(listEssayQ.get(i).getId());
			Resultessayq resultessayq = resultEssayqService.selectOneByAll(timesdotest, listEssayQ.get(i).getId(),
					userId, testId);
			listEssayQ.get(i).setAnswerEssayq(anEssayq);
			listEssayQ.get(i).setResultessayq(resultessayq);
		}

		test.setListEssayQuestion(listEssayQ);

		model.addAttribute("test", test);

		return "show_test_not_score_to_mark";
	}

	// validate score
	@RequestMapping(value = "/show-test-not-score-to-mark/{testId}/{timesdotest}/{userId}/{sectionId}/validate-score-instructor-mark", method = RequestMethod.POST)
	@ResponseBody
	public String validateScoreInstructorMark(@PathVariable("testId") int testId, @RequestBody JsonData jsonData) {

		String msg = "";
		// System.out.println("scoreeeeee: "+jsonData.getScore()+"questionnnnnnnn:
		// "+jsonData.getQuestionID());

		List<EssayQuestion> essayqList = essayQuestionService.findAllQuestionByTestID(testId);
		// System.out.println("resssssssssssulttttt:
		// "+essayqList.get(jsonData.getIndex()).getScore());
		if (jsonData.getScore() > essayqList.get(jsonData.getIndex()).getScore()) {

			msg = "Entered score < Score of question";
		} else {
			msg = "";
		}

		return msg;
	}

	// mark essay
	@RequestMapping(value = "/show-test-not-score-to-mark/{testId}/{timesdotest}/{userId}/{sectionId}/update-score-after-marked", method = RequestMethod.GET)
	public String updateScore(Model model, HttpSession session, HttpServletRequest request,
			@PathVariable("testId") int testId, @PathVariable("timesdotest") int timesdotest,
			@PathVariable("userId") int userId, @PathVariable("sectionId") int sectionId,
			RedirectAttributes redirectAttributes) {

		// get result essay
		List<Resultessayq> listResultessayq = resultEssayqService.findAllResultEssay(testId, timesdotest, userId);

		String score = "";
		String comment = "";
		double sumScore = 0;

		List<EssayQuestion> essayqList = essayQuestionService.findAllQuestionByTestID(testId);

		for (int i = 0; i < listResultessayq.size(); i++) {
			Resultessayq resultessayq = listResultessayq.get(i);
			score = request.getParameter("score" + (i + 1) + "");
			// check score
			model.addAttribute("MARK_WRONG_SCORE", "");
			if (Double.parseDouble(score) > essayqList.get(i).getScore()) {
				// return "fobbiden_page";

				redirectAttributes.addFlashAttribute("MARK_WRONG_SCORE", Contansts.MSG_MARK_SCORE_ERROR);

				return "redirect:/instructor/show-test-not-score-to-mark/{testId}/{timesdotest}/{userId}/{sectionId}/";
			}

			comment = request.getParameter("comment" + (i + 1) + "");
			sumScore += Double.parseDouble(score);
			resultessayq.setScore(Double.parseDouble(score));
			resultessayq.setComment(comment);

			resultEssayqService.updateResultEssay(resultessayq);
		}

		Section sectn = sectionService.findOneSection(sectionId);
		Course course = coursesService.getCourOne(sectn.getCourseId());

		TestResult testResult = new TestResult();
		testResult.setUserid(userId);
		testResult.setInstructorid(course.getInstructorId());
		testResult.setTestid(testId);
		testResult.setScore(sumScore);

		Date date = new Date(System.currentTimeMillis());
		Timestamp dateTest = new Timestamp(date.getTime());
		testResult.setDatetest(dateTest);
		testResult.setTimesdotest(timesdotest);

		testResultService.addTestResult(testResult);

		return "redirect:/instructor/show-essay-not-marked/{testId}/";
	}

	// ====================== EDIT TEST ===========================
	@RequestMapping(value = "/edit-multichoice-test-page", method = RequestMethod.GET)
	public String editMultichoiceTestPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);

		Instructor instructor = instructorService.getInstructorByUserID(user.getId());
		List<Course> listCourse = coursesService.findCoursesByInstructorID(instructor.getId());
		for (int i = 0; i < listCourse.size(); i++) {
			List<Section> listSection = sectionService.getSectionByCourseID(listCourse.get(i).getId());
			listCourse.get(i).setListSection(listSection);

			for (int j = 0; j < listSection.size(); j++) {
				// tìm tất cả các test chưa chấm
				List<Test> listTest = testService.findAllTestBySectionID(listSection.get(j).getId());
				List<Test> listRS = new ArrayList<>();
				for (int k = 0; k < listTest.size(); k++) {
					TestType testType = testTypeService.findOneByTestTypeId(listTest.get(k).getTypeid());
					listTest.get(k).setTestType(testType);
					if (listTest.get(k).getTestType().getType().equalsIgnoreCase("Multichoice")) {
						// add multichoice test into list
						listRS.add(listTest.get(k));
					}
				}

				listSection.get(j).setListTest(listRS);
			}
		}

		instructor.setListCourse(listCourse);

		model.addAttribute("instructor-multichoice-test", instructor);

		return "show_edit_multichoice_test";
	}

	@RequestMapping(value = "/edit-essay-test-page", method = RequestMethod.GET)
	public String editEssayTestPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);

		Instructor instructor = instructorService.getInstructorByUserID(user.getId());
		List<Course> listCourse = coursesService.findCoursesByInstructorID(instructor.getId());
		for (int i = 0; i < listCourse.size(); i++) {
			List<Section> listSection = sectionService.getSectionByCourseID(listCourse.get(i).getId());
			listCourse.get(i).setListSection(listSection);

			for (int j = 0; j < listSection.size(); j++) {
				// tìm tất cả các test chưa chấm
				List<Test> listTest = testService.findAllTestBySectionID(listSection.get(j).getId());
				List<Test> listRS = new ArrayList<>();
				for (int k = 0; k < listTest.size(); k++) {
					TestType testType = testTypeService.findOneByTestTypeId(listTest.get(k).getTypeid());
					listTest.get(k).setTestType(testType);
					if (listTest.get(k).getTestType().getType().equalsIgnoreCase("Essay")) {
						// add multichoice test into list
						listRS.add(listTest.get(k));
					}
				}

				listSection.get(j).setListTest(listRS);
			}
		}

		instructor.setListCourse(listCourse);

		model.addAttribute("instructor-essay-test", instructor);

		return "show_edit_essay_test";
	}

	// ====================== // EDIT TEST ===========================

	// get test from db
	@RequestMapping(value = "/edit-essay-test/{testID}", method = RequestMethod.GET)
	public String editEssayTest(Model model, HttpSession session, @PathVariable("testID") int testId) {
		Test test = testService.findOneTest(testId);
		List<EssayQuestion> listEssayq = essayQuestionService.findAllQuestionByTestID(testId);
		test.setListEssayQuestion(listEssayq);

		for (int i = 0; i < listEssayq.size(); i++) {
			int questionId = listEssayq.get(i).getId();
			AnswerEssayq answerEssayq = answerEssayqService.findAnswerByQuestionID(questionId);
			listEssayq.get(i).setAnswerEssayq(answerEssayq);
		}

		// send to view
		model.addAttribute("test", test);
		// add test to session
		session.setAttribute("Test_Edited", test);

		return "edit_essay_test";
	}

	@RequestMapping(value = "/edit-essay-test/{testID}/update-essay-test", method = RequestMethod.POST)
	public String updateEssayTest(Model model, HttpSession session, HttpServletRequest request,
			@PathVariable("testID") int testId) {

		String questionContent = "";
		String answerContent = "";
		String score = "";

		// get session
		session = request.getSession();
		Test test = (Test) session.getAttribute("Test_Edited");
		List<EssayQuestion> mulqList = test.getListEssayQuestion();

		double scoreOfTest = 0;

		for (int i = 0; i < mulqList.size(); i++) {
			EssayQuestion essayQuestion = mulqList.get(i);
			AnswerEssayq anEssayq = mulqList.get(i).getAnswerEssayq();
			questionContent = request.getParameter("question" + (i + 1) + "");
			answerContent = request.getParameter("answer-question" + (i + 1) + "");
			score = request.getParameter("score" + (i + 1) + "");
			scoreOfTest += Double.parseDouble(score);
			essayQuestion.setScore(Double.parseDouble(score));
			essayQuestion.setTitle(questionContent);
			// update essay question
			essayQuestionService.updateContentScoreQuestion(essayQuestion);

			anEssayq.setAnswercontent(answerContent);
			// update answer question
			answerEssayqService.updateContentAnswer(anEssayq);
		}

		// update score of testttt
		test.setScore(scoreOfTest);
		testService.updateScoreTest(test);

		return "redirect:/instructor/edit-essay-test/{testID}/";
	}

	// get test from db
	@RequestMapping(value = "/edit-multichoice-test/{testID}", method = RequestMethod.GET)
	public String editMultichoiceTest(Model model, HttpSession session, @PathVariable("testID") int testId) {
		Test test = testService.findOneTest(testId);
		List<MultichoiceQuestion> listMulQ = multichoiceqService.findAllQuestionByTestID(testId);
		test.setListQuestionMultichoice(listMulQ);

		for (int i = 0; i < listMulQ.size(); i++) {
			int questionId = listMulQ.get(i).getId();
			List<AnswerMultichoiceq> listAnswer = answerMultichoiceqService.findAnserByQuestionID(questionId);
			listMulQ.get(i).setListAnswer(listAnswer);
		}

		// send to view
		model.addAttribute("test", test);
		// add test to session
		session.setAttribute("Test_Edited", test);

		return "edit_multichoice_test";
	}

	@RequestMapping(value = "/edit-multichoice-test/{testID}/update-multichoice-test", method = RequestMethod.POST)
	public String updateMultichoiceTest(Model model, HttpSession session, HttpServletRequest request,
			@PathVariable("testID") int testId) {
		// get session
		session = request.getSession();
		Test test = (Test) session.getAttribute("Test_Edited");

		String questionContent = "";
		String answerContent = "";
		String isCorrect = "";

		int k = 0;
		List<MultichoiceQuestion> listQuestions = test.getListQuestionMultichoice();
		for (int i = 0; i < listQuestions.size(); i++) {
			questionContent = request.getParameter("question-content" + (i + 1) + "");
			MultichoiceQuestion mulQuestion = listQuestions.get(i);
			mulQuestion.setTitle(questionContent);

			multichoiceqService.updateMultichoiceqTitle(mulQuestion);
			List<AnswerMultichoiceq> listAnswer = listQuestions.get(i).getListAnswer();
			for (int j = 1; j <= listAnswer.size(); j++) {
				k++;
				AnswerMultichoiceq answerMultichoiceq = listAnswer.get(j - 1);

				answerContent = request.getParameter("answer-content" + k + "");
				answerMultichoiceq.setAnswercontent(answerContent);
				isCorrect = request.getParameter("isCorrect" + k + "");

				boolean isOK = false;
				if (isCorrect.equalsIgnoreCase("true")) {
					isOK = true;
				} else {
					isOK = false;
				}

				answerMultichoiceq.setIscorrect(isOK);

				answerMultichoiceqService.updateAnswerMultichoiceqContent(answerMultichoiceq);
			}
		}

		testService.updateTest(test);

		return "redirect:/instructor/edit-multichoice-test/{testID}/";
	}
}

/**
 * 
 * @author: PhungDinhHuy
 * 
 *          ===========================================================================================================
 */
