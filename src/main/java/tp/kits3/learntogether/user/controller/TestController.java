package tp.kits3.learntogether.user.controller;

/**
 * @author PhungDinhHuy
 *
 */

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tp.kits3.learntogether.user.service.AnswerEssayqService;
import tp.kits3.learntogether.user.service.AnswerMultichoiceqService;
import tp.kits3.learntogether.user.service.CoursesService;
import tp.kits3.learntogether.user.service.EssayQuestionService;
import tp.kits3.learntogether.user.service.InstructorService;
import tp.kits3.learntogether.user.service.MultichoiceQuestionService;
import tp.kits3.learntogether.user.service.ResultEssayqService;
import tp.kits3.learntogether.user.service.ResultMultiqService;
import tp.kits3.learntogether.user.service.SectionService;
import tp.kits3.learntogether.user.service.TestResultService;
import tp.kits3.learntogether.user.service.TestService;
import tp.kits3.learntogether.user.service.TestTypeService;
import tp.kits3.learntogether.user.vo.AnswerEssayq;
import tp.kits3.learntogether.user.vo.AnswerMultichoiceq;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.EssayQuestion;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;
import tp.kits3.learntogether.user.vo.Resultessayq;
import tp.kits3.learntogether.user.vo.Resultmultiq;
import tp.kits3.learntogether.user.vo.Section;
import tp.kits3.learntogether.user.vo.Test;
import tp.kits3.learntogether.user.vo.TestResult;
import tp.kits3.learntogether.user.vo.TestType;
import tp.kits3.learntogether.user.vo.User;
import tp.kits3.learntogether.utils.Contansts;

@Controller
@RequestMapping(value = "/test")
public class TestController {

	@Autowired
	TestService testService;

	@Autowired
	MultichoiceQuestionService multichoiceQuestionService;

	@Autowired
	AnswerMultichoiceqService answerMultichoiceqService;

	@Autowired
	ResultMultiqService resultMultiqService;

	@Autowired
	TestResultService testResultService;

	@Autowired
	SectionService sectionService;

	@Autowired
	CoursesService coursesService;

	@Autowired
	TestTypeService testTypeService;

	@Autowired
	EssayQuestionService essayQuestionService;

	@Autowired
	AnswerEssayqService answerEssayqService;

	@Autowired
	ResultEssayqService resultEssayqService;

	@Autowired
	InstructorService instructorService;

	@RequestMapping(value = "/section-page", method = RequestMethod.GET)
	public String section_page() {
		return "section_page";
	}

	@RequestMapping(value = "/{courseId}/create-test-page", method = RequestMethod.GET)
	public String create_multichoice_page(Model model,
			@PathVariable("courseId") int courseId
			) {
		System.out.println("courseeeeeeeeeeeeeeeeee ID: "+courseId);
		model.addAttribute(Contansts.ATTR_ALL_TESTTYPE, testTypeService.findAllTestType());
		model.addAttribute(Contansts.ATTR_ALL_SECTION, sectionService.getSectionByCourseID(courseId));

		return Contansts.URL_CREATE_TEST_PAGE;
	}

	@RequestMapping(value = "/{courseId}/create-test-page/create-test", method = RequestMethod.GET)
	public String create_test(
			@RequestParam("testType") String testType,
			@RequestParam("title") String title,
			@RequestParam(value = "number-question", required = false) int numberQuestion,
			@RequestParam("score") double score,
			@RequestParam("createDate") Date updateDate,
			@RequestParam("sectionID") String sectionID, 
			@RequestParam("number-answer") String numberAnswer,
			@RequestParam("time") int time,

			RedirectAttributes redirectAttributes, HttpSession httpSession) {

		TestType testTypeObj = testTypeService.findOneByType(testType);
		int testTypeID = testTypeObj.getId();
		if (testType.equals("Essay")) {
			// return to create essay page

			Test test = new Test();
			test.setTitle(title);
			test.setNumquestion(numberQuestion);
			test.setScore(0.0);
			test.setUpdatedate(updateDate);
			test.setSectionid(Integer.parseInt(sectionID));
			test.setTypeid(testTypeID);
			//
			test.setTime(time*60);

			testService.addTest(test);
			// add test to session
			httpSession.setAttribute(Contansts.TEST_CREATED, test);

			// redirectAttributes.addAttribute("numberQuestion", numberQuestion);

			redirectAttributes.addAttribute("titleOfTest", test.getTitle());
			redirectAttributes.addAttribute("numberQuestion", numberQuestion);
			redirectAttributes.addAttribute("scoreOfTest", score);

			return "redirect:create-essay-question-page";

		} else if (testType.equalsIgnoreCase("Multichoice")) {

			// return to create multichoice page
			Test test = new Test();
			test.setTitle(title);
			test.setNumquestion(numberQuestion);
			test.setScore(score);
			test.setUpdatedate(updateDate);
			test.setSectionid(Integer.parseInt(sectionID));
			test.setTypeid(testTypeID);
			// 
			test.setTime(time*60);

			testService.addTest(test);
			// add test to session
			httpSession.setAttribute(Contansts.TEST_CREATED, test);
			httpSession.setAttribute("numberAnswerOfQuestion", Integer.parseInt(numberAnswer));

			redirectAttributes.addAttribute("numberQuestion", numberQuestion);
			redirectAttributes.addAttribute("numberAnswerOfQuestion", numberAnswer);
			redirectAttributes.addAttribute("titleOfTest", test.getTitle());
			redirectAttributes.addAttribute("scoreOfTest", score);

			return "redirect:create-multichoice-question-page";
		}

		return "";
	}

	@RequestMapping(value = "/{courseId}/create-test-page/create-essay-question-page", method = RequestMethod.GET)
	public String createEssayQuestion(Model model, @RequestParam("numberQuestion") int numberQuestion,
			@RequestParam("titleOfTest") String title) {

		model.addAttribute("numberQuestion", numberQuestion);
		model.addAttribute("titleOfTest", title);

		return Contansts.URL_CREATE_ESSAY_PAGE;
	}

	@RequestMapping(value = "/{courseId}/create-test-page/create-multichoice-question-page", method = RequestMethod.GET)
	public String createMultiChoiceQuestion(Model model, @RequestParam("numberQuestion") int numberQuestion,
			@RequestParam("numberAnswerOfQuestion") int numberAnswer, @RequestParam("titleOfTest") String title,
			@RequestParam("scoreOfTest") double core) {

		// XÃ¡Â»Â­ lÃƒÂ½ tÃ¡ÂºÂ¡o question
		model.addAttribute("numberQuestion", numberQuestion);
		model.addAttribute("numberAnswerOfQuestion", numberAnswer);
		model.addAttribute("titleOfTest", title);
		model.addAttribute("scoreOfTest", core);

		return Contansts.URL_CREATE_MULTICHOICE_PAGE;
	}

	@RequestMapping(value = "/{courseId}/create-test-page/add-essay-question", method = RequestMethod.GET)
	public String addEssayQuestion(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		Test test = (Test) session.getAttribute(Contansts.TEST_CREATED);
		int numberQuestion = test.getNumquestion();

		String questionContent = "";
		String answerContent = "";
		String points = "";

		double scoreOfTest = 0;

		for (int i = 0; i < numberQuestion; i++) {
			questionContent = request.getParameter("question-content" + (i + 1) + "");
			answerContent = request.getParameter("answer-content" + (i + 1) + "");
			points = request.getParameter("points" + (i + 1) + "");

			EssayQuestion essayQuestion = new EssayQuestion();
			essayQuestion.setTitle(questionContent);
			essayQuestion.setTestid(test.getId());
			essayQuestion.setScore(Double.parseDouble(points));

			scoreOfTest += Double.parseDouble(points);

			// add question
			int essayqId = essayQuestionService.getId_after_addAnswerQuestion(essayQuestion);

			AnswerEssayq answerEssayq = new AnswerEssayq();
			answerEssayq.setAnswercontent(answerContent);
			answerEssayq.setEssayid(essayqId);
			// add answer
			answerEssayqService.addAnswerEssayq(answerEssayq);

		}

		test.setScore(scoreOfTest);
		testService.updateTest(test);

		return "redirect:/instructor/course/{courseId}/manage/basics";
	}

	@RequestMapping(value = "/{courseId}/create-test-page/add-multichoice-question", method = RequestMethod.GET)
	public String addAllQuestion(HttpServletRequest request, HttpSession session) {
		// add test to session
		session = request.getSession();
		Test test = (Test) session.getAttribute(Contansts.TEST_CREATED);
		int numberQuestion = test.getNumquestion();
		int numberAnswerOfQuestion = (int) session.getAttribute("numberAnswerOfQuestion");

		String questionContent = "";
		String answerContent = "";
		String isCorrect = "";
		//
		int k = 0;
		for (int i = 0; i < numberQuestion; i++) {
			questionContent = request.getParameter("question-content" + (i + 1) + "");

			MultichoiceQuestion mChoiceQuestion = new MultichoiceQuestion();
			mChoiceQuestion.setTitle(questionContent);
			mChoiceQuestion.setTestid(test.getId());
			// add question
			multichoiceQuestionService.addMultichoiceQuestion(mChoiceQuestion);

			for (int j = 1; j <= numberAnswerOfQuestion; j++) {
				//
				k = k + j;
				answerContent = request.getParameter("answer-content" + (k) + "");
				isCorrect = request.getParameter("isCorrect" + (k) + "");

				AnswerMultichoiceq answerMultiQ = new AnswerMultichoiceq();

				answerMultiQ.setMultichoiceid(mChoiceQuestion.getId());
				answerMultiQ.setAnswercontent(answerContent);
				boolean isOK = false;
				if (Integer.parseInt(isCorrect) == 1) {
					isOK = true;
				} else {
					isOK = false;
				}
				answerMultiQ.setIscorrect(isOK);
				// add answer
				answerMultichoiceqService.addAnswerMultichoiceq(answerMultiQ);

			}

		}

		return "redirect:/instructor/course/{courseId}/manage/basics";
	}

	// to go
	@RequestMapping(value = "/show-all-test-by-sectionID/{sectionId}", method = RequestMethod.GET)
	public String showAllTestBySectionID(@PathVariable("sectionId") int sectionId, Model model) {

		// get Test by sectionID
		List<Test> listTestBySectionID = testService.findAllTestBySectionID(sectionId);
		model.addAttribute(Contansts.LIST_TEST_BY_SECTIONID, listTestBySectionID);

		return "show_all_test";
	}

	// to go
	@RequestMapping(value = "/do-test-page/{testId}/{testTime}/", method = RequestMethod.GET)
	public String doTestPage(@PathVariable("testId") int testId, Model model, HttpSession session) {

		// get Test by testID
		Test testObj = testService.findOneTest(testId);

		// get Test type theo testTypeId
		TestType testType = testTypeService.findOneByTestTypeId(testObj.getTypeid());
		
		// find section by sectionID
		Section section=sectionService.findOneSection(testObj.getSectionid());
		
		// find course by courseID
		Course course=coursesService.findCourseByID(section.getCourseId());

		// If essay test
		if (testType.getType().equalsIgnoreCase("Essay")) {

			// get all essay questions by testId
			List<EssayQuestion> listEssayq = essayQuestionService.findAllQuestionByTestID(testObj.getId());

			testObj.setListEssayQuestion(listEssayq);

			model.addAttribute("testObj", testObj);
			session.setAttribute("testObj", testObj);
			
			model.addAttribute("courseID",course.getId());

			return Contansts.URL_DO_ESSAY_TEST_PAGE;

			// If multichoice test
		} else if (testType.getType().equalsIgnoreCase("Multichoice")) {

			// get all multichoice questions by testId
			List<MultichoiceQuestion> listQuestionByTestID = multichoiceQuestionService
					.findAllQuestionByTestID(testObj.getId());

			// add list question into a test
			testObj.setListQuestionMultichoice(listQuestionByTestID);

			for (int i = 0; i < listQuestionByTestID.size(); i++) {
				int questionID = listQuestionByTestID.get(i).getId();
				// get asnswer by questionId
				List<AnswerMultichoiceq> listAnswerByQuestionID = answerMultichoiceqService
						.findAnserByQuestionID(questionID);
				// add list answer into a question
				listQuestionByTestID.get(i).setListAnswer(listAnswerByQuestionID);

			}

			// setAttribute cho bÃƒÂ i test => Ã„â€˜Ã¡Â»Æ’ qua view
			// hiÃ¡Â»Æ’n thÃ¡Â»â€¹
			model.addAttribute("testObj", testObj);
			session.setAttribute("testObj", testObj);
			
			model.addAttribute("courseID",course.getId());

			return Contansts.URL_DO_MULTICHOICE_TEST_PAGE;
		}

		return "";
	}

	@RequestMapping(value = "/do-test-page/{testId}/{testTime}/submit-essay-test", method = RequestMethod.GET)
	public String calculateEssayTestScore(Model model, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		Test test = (Test) session.getAttribute("testObj");

		String[] answerContent = request.getParameterValues("answer-content");
		
		String courseId=request.getParameter("courseID");
		model.addAttribute("courseIDx",Integer.parseInt(courseId));
		
		List<EssayQuestion> listEssayq = test.getListEssayQuestion();

		// get current max times do test
		List<Resultessayq> listResultEssayqUserTest = resultEssayqService.findAllResultEssayByUserTest(user.getId(),
				test.getId());

		int timesDoTestMax = 0;
		for (int i = 0; i < listResultEssayqUserTest.size(); i++) {
			if (listResultEssayqUserTest.get(i).getTimesDoTest() > timesDoTestMax) {
				timesDoTestMax = listResultEssayqUserTest.get(i).getTimesDoTest();
			}
		}

		for (int i = 0; i < listEssayq.size(); i++) {

			// get EssayQuestion by essayQuestionId in resultEssayQ => get score
			Resultessayq resultessayq = new Resultessayq();

			// because score will be marked by teacher after that so that save temp value is
			// 0
			resultessayq.setScore(-1.0);
			resultessayq.setUseranswer(answerContent[i]);
			resultessayq.setTimesDoTest(timesDoTestMax + 1);
			resultessayq.setEssayquestionid(listEssayq.get(i).getId());
			resultessayq.setUserid(user.getId());
			resultessayq.setTestid(test.getId());
			resultessayq.setComment(null);

			// add each essay answer result
			resultEssayqService.addResultEssay(resultessayq);
		}

		// *** calculate score (Get points after teacher has marked the test)

		// khi mà giáo viên chấm điểm xong thì mới lưu vào bảng test
		// result
		// kiểm tra nếu trong bài essay score bằng -1 thì show trạng thái
		// chưa dc chấm
		// điểm
		
		// use to show history
		session.setAttribute("testId", test.getId());

		return Contansts.URL_RESULT_ESSAY_TEST_PAGE;
	}

	// show all essays (not be marked yet + be marked)
	@RequestMapping(value = "/show-all-essay", method = RequestMethod.GET)
	public String showAllEssay(Model model, HttpServletRequest request, HttpSession session) {
		return "";
	}

	// Do multichoice test and calculate score
	@RequestMapping(value = "/do-test-page/{testId}/{testTime}/submit-multichoice-test", method = RequestMethod.GET)
	public String calculateMultichoiceTestScore(Model model, HttpServletRequest request, HttpSession session) {

		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		Test test = (Test) session.getAttribute("testObj");

		String courseId=request.getParameter("courseID");
		model.addAttribute("courseIDx",Integer.parseInt(courseId));
		
		double scoreEachQuestion = (double) test.getScore() / test.getNumquestion();

		List<MultichoiceQuestion> listMultichoiceQ = test.getListQuestionMultichoice();

		// get current max times do test
		List<Resultmultiq> listResultmultiqUserTest = resultMultiqService.findAllResultMultiqByUserTest(user.getId(),
				test.getId());
		
		int timesDoTestMax = 0;
		for (int i = 0; i < listResultmultiqUserTest.size(); i++) {
			if (listResultmultiqUserTest.get(i).getTimes_do_test() > timesDoTestMax) {
				timesDoTestMax = listResultmultiqUserTest.get(i).getTimes_do_test();
			}
		}

		// get checkbox data from view
		String[] answer_cb = request.getParameterValues("answer-cb");

		// *If users let checkbox blank
		if (answer_cb == null) {
			// left blank
			for (int i = 0; i < listMultichoiceQ.size(); i++) {
				List<AnswerMultichoiceq> listAnswerQ = listMultichoiceQ.get(i).getListAnswer();
				// System.out.println("Listtttt answer" + listAnswerQ.size());
				for (int j = 0; j < listAnswerQ.size(); j++) {

					Resultmultiq resultmultiq = new Resultmultiq();

					resultmultiq.setScore(scoreEachQuestion / listAnswerQ.size());
					// set false whne user let checkbox blank
					resultmultiq.setUseranswer(false);
					resultmultiq.setTimes_do_test(timesDoTestMax + 1);
					resultmultiq.setMultichoicequestionid(listMultichoiceQ.get(i).getId());
					resultmultiq.setUserid(user.getId());
					resultmultiq.setTestId(test.getId());

					// add result multichoice
					resultMultiqService.addResultMultiq(resultmultiq);
				}
			}

		} else {
			// checkbox is checked

			// Ex: have 8 question and last 2 question isn't checked
			// number answer of test
			int countTotalAnswers = 0;
			for (int i = 0; i < listMultichoiceQ.size(); i++) {

				List<AnswerMultichoiceq> listAnswerQ = listMultichoiceQ.get(i).getListAnswer();
				for (int j = 0; j < listAnswerQ.size(); j++) {
					countTotalAnswers++;
				}
			}

			int lastNumNoCheck_Count = countTotalAnswers - Integer.parseInt(answer_cb[answer_cb.length - 1]) - 1;

			// save missing position checkbox value
			List<Integer> listMissPosition = new ArrayList<Integer>();
			int temp = 0;
			int index = 0;
			while (index <= answer_cb.length - 1) {
				if (Integer.parseInt(answer_cb[index]) == temp) {
					index++;
					temp++;
				} else {
					listMissPosition.add(temp);
					temp++;
				}
			}

			for (int k = 1; k <= lastNumNoCheck_Count; k++) {
				listMissPosition.add(Integer.parseInt(answer_cb[answer_cb.length - 1]) + k);
			}

			int m = 0;
			int n = 0;
			// save value of checkbox checkbox arr={true,true,false,..}
			List<Boolean> listRS = new ArrayList<Boolean>();
			int lengthArr = answer_cb.length + listMissPosition.size();
			// System.out.println(lengthArr);
			for (int j = 0; j < lengthArr; j++) {
				if (m < answer_cb.length && j == Integer.parseInt(answer_cb[m])) {
					listRS.add(true);
					m++;

				} else if (n < listMissPosition.size() && j == listMissPosition.get(n)) {
					listRS.add(false);
					n++;
				}
			}

			int nextValue = -1;
			for (int i = 0; i < listMultichoiceQ.size(); i++) {
				List<AnswerMultichoiceq> listAnswerQ = listMultichoiceQ.get(i).getListAnswer();
				// System.out.println("Listtttt answer" + listAnswerQ.size());
				for (int j = 0; j < listAnswerQ.size(); j++) {

					Resultmultiq resultmultiq = new Resultmultiq();

					boolean isChoice;
					nextValue++;
					isChoice = listRS.get(nextValue);

					resultmultiq.setScore(scoreEachQuestion / listAnswerQ.size());
					resultmultiq.setUseranswer(isChoice);
					resultmultiq.setTimes_do_test(timesDoTestMax + 1);
					resultmultiq.setMultichoicequestionid(listMultichoiceQ.get(i).getId());
					resultmultiq.setUserid(user.getId());
					resultmultiq.setTestId(test.getId());

					// add result multichoice
					resultMultiqService.addResultMultiq(resultmultiq);
				}
			}
		}

		// ** calculate score
		List<MultichoiceQuestion> listMultichoiceqByTest = multichoiceQuestionService
				.findAllQuestionByTestID_NoRD(test.getId());

		// push list to db
		List<AnswerMultichoiceq> listAnswer = answerMultichoiceqService.findAnswerByInQuestions(listMultichoiceqByTest);

		List<Resultmultiq> list_curr_Resultmultiq = resultMultiqService.findAllByTimesDoTest(user.getId(), test.getId(),
				timesDoTestMax + 1);

		double scoreTestResult = 0;
		// number answer of each question
		int numAnswer = listAnswer.size() / listMultichoiceqByTest.size() - 1; // 3
		int j = 0;
		for (int i = 0; i < listMultichoiceqByTest.size(); ++i) {

			boolean isCorrect = true;
			int k = 0;
			// question id equal
			int tmp = 0;
			while (j < list_curr_Resultmultiq.size() && list_curr_Resultmultiq.get(j)
					.getMultichoicequestionid() == listMultichoiceqByTest.get(i).getId()) {		
				
				// check answer result and answer right
				if (listAnswer.get(j).getIscorrect() != list_curr_Resultmultiq.get(j).getUseranswer()) {
					isCorrect = false;
					k = numAnswer - tmp;
					break;
				}	

				tmp++;
				j++;
			}

			if (isCorrect == false) {
				j = j + k + 1;
			} else {
				j = j + k;
			}

			if (isCorrect) {
				scoreTestResult += scoreEachQuestion;
			}
		}

		// send result score to view
		model.addAttribute("scoreTestResult", (double) Math.round(scoreTestResult * 100) / 100);

		// **save to test result DB
		TestResult testResult = new TestResult();
		testResult.setUserid(user.getId());
		// find instructorID by testID
		// + test obj => sectionID
		// + get section by sectionID => get courseID
		// + get course by courseID => InstructorID
		// or using dto

		Section section = sectionService.findOneSection(test.getSectionid());
		Course course = coursesService.getCourOne(section.getCourseId());

		testResult.setInstructorid(course.getInstructorId());
		testResult.setScore(scoreTestResult);
		testResult.setTestid(test.getId());

		long milis = System.currentTimeMillis();
		Timestamp dateTest = new Timestamp(milis);
		testResult.setDatetest(dateTest);
		testResult.setTimesdotest(timesDoTestMax + 1);

		testResultService.addTestResult(testResult);
		// use to show history
		session.setAttribute("testId", test.getId());

		// remove session
		session.removeAttribute("testObj");

		// return "redirect:calculate-score";
		return Contansts.URL_RESULT_MULTICHOICE_TEST_PAGE;
	}

	@RequestMapping(value = "do-test-page/{testId}/{testTime}/show-history-multichoice", method = RequestMethod.GET)
	@ResponseBody
	public List<TestResult> showHistoryMultichoiceTest(Model model, HttpSession session

	) {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		int testId = (int) session.getAttribute("testId");

		List<TestResult> testResultList = testResultService.findAllByUserTest(user.getId(), testId);

		for (int i = 0; i < testResultList.size(); i++) {
			Test test = testService.findOneTest(testResultList.get(i).getTestid());
			testResultList.get(i).setTest(test);
		}

		return testResultList;
	}
	
	@RequestMapping(value = "do-test-page/{testId}/{testTime}/show-history-essay", method = RequestMethod.GET)
	@ResponseBody
	public List<TestResult> showHistoryEssayTest(Model model, HttpSession session

	) {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);
		int testId = (int) session.getAttribute("testId");

		List<TestResult> testResultList = testResultService.findAllByUserTest(user.getId(), testId);

		for (int i = 0; i < testResultList.size(); i++) {
			Test test = testService.findOneTest(testResultList.get(i).getTestid());
			testResultList.get(i).setTest(test);
		}

		return testResultList;
	}
	
	@RequestMapping(value = "/{courseId}/do-test-page/show-history-all-test", method = RequestMethod.GET)
	public String showHistoryAllTest(Model model, HttpSession session,
			@PathVariable("courseId") int courseID
			) {
		User user = (User) session.getAttribute(Contansts.USER_LOGGED);

		List<TestResult> testResultList = testResultService.findAllByUser(user.getId());

		for (int i = 0; i < testResultList.size(); i++) {
			Test test = testService.findOneTest(testResultList.get(i).getTestid());
			TestType testType=testTypeService.findOneByTestTypeId(test.getTypeid());
			test.setTestType(testType);
			testResultList.get(i).setTest(test);
		}
		
		List<TestResult> listMultichoice=new ArrayList<>();
		List<TestResult> listEssay=new ArrayList<>();	
		
		for(int i=0;i<testResultList.size();i++) {
			Test test=testResultList.get(i).getTest();
			if(test.getTestType().getType().equalsIgnoreCase("Multichoice")) {
				listMultichoice.add(testResultList.get(i));
			}else if(test.getTestType().getType().equalsIgnoreCase("Essay")) {
				listEssay.add(testResultList.get(i));
			}		
		}
		
		model.addAttribute("listMultichoice",listMultichoice);
		model.addAttribute("listEssay",listEssay);
		model.addAttribute("courseId",courseID);
		
		return "result_test_essay_multichoice";
	}

}
