package tp.kits3.learntogether.user.controller;
/**
* 	@author: Diep Nguyen
*/

import java.util.List;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tp.kits3.learntogether.user.dto.CustomCourse;
import tp.kits3.learntogether.user.service.CategoryService;
import tp.kits3.learntogether.user.service.CourseLevelService;
import tp.kits3.learntogether.user.service.CourseService_Diep;
import tp.kits3.learntogether.user.service.LessonService;
import tp.kits3.learntogether.user.service.SectionService;
import tp.kits3.learntogether.user.vo.Category;
import tp.kits3.learntogether.user.vo.Course;
import tp.kits3.learntogether.user.vo.CourseLevel;
import tp.kits3.learntogether.user.vo.Instructor;
import tp.kits3.learntogether.user.vo.Lesson;
import tp.kits3.learntogether.user.vo.Section;

@Controller
@RequestMapping("/course")
public class CourseController_Diep {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SectionService sectionService;

	@Autowired
	private LessonService lessonService;

	@Autowired
	private CourseLevelService courseLevelService;

	@Autowired
	private CourseService_Diep courseService;

	private List<Category> categoryList;
	private List<CourseLevel> courseLevelList;

	@PostConstruct
	private void ini() {
		courseLevelList = courseLevelService.getCourseLevelList();
		categoryList = categoryService.getCategoryList();
	}

	@RequestMapping(value = "/create/1", method = RequestMethod.GET)
	public String createCourse_Step1(Model model) {

		return "instructor/course-create1";
	}

	@RequestMapping(value = "/create/2", method = RequestMethod.GET)
	public String createCourse_Step2(Model model, @RequestParam(required = false) String action) {
		return "instructor/course-create2";
	}

	@RequestMapping(value = "/create/3", method = RequestMethod.GET)
	public String createCourse_Step3(Model model, HttpSession session, @RequestParam(required = false) String action,
			@RequestParam(required = true) String courseTitle) {
		if (action.equals("Previous")) {
			return "redirect:1";
		}

		model.addAttribute("CategoryList", categoryList);
		session.setAttribute("courseTitle", courseTitle);
		return "instructor/course-create3";
	}

	@RequestMapping(value = "/create-final", method = RequestMethod.POST)
	public String createCourse_Step4(Model model, @RequestParam(required = false) String action,
			@RequestParam(required = false) Integer categoryId, HttpSession session) {
		if (action.equals("Previous")) {
			return "redirect:/course/create/2";
		}

		model.addAttribute("CategoryList", categoryList);
		model.addAttribute("CourseLevelList", courseLevelList);
		model.addAttribute("categoryId", categoryId);
		Course newCourse = new Course();
		newCourse.setCourseTitle(session.getAttribute("courseTitle").toString());

		if(categoryId != null) {
			if (categoryId == -1) {
				categoryId = null;
			}else {
				newCourse.setCategoryId(categoryId);
			}
		}
		
		Instructor instructor = (Instructor) session.getAttribute("instructor");
		newCourse.setInstructorId(instructor.getId());

		courseService.addCourse(newCourse);

		// auto add section 1 after creating new course
		Section newSection = new Section();
		newSection.setCourseId(newCourse.getId());
		sectionService.addSection(newSection);

		// auto add lecture 1 for section 1
		Lesson newLesson = new Lesson();
		newLesson.setTitle("Introduction");
		newLesson.setSectionId(newSection.getId());
		lessonService.addLesson(newLesson);

		//add user for the course
		session.setAttribute("newCourse", newCourse);

		String courseEditView = "redirect:../instructor/course/" + newCourse.getId() + "/manage/basics";
		return courseEditView;
	}
	
	@RequestMapping(value = "/draft/{courseId}/learn", method = RequestMethod.GET)
	public String previewDraftCourse(Model model, @PathVariable(name = "courseId") int courseId, HttpSession session) {
		 Course selectedCourse = courseService.getCourseInfosByCourseID(courseId); 
		
		model.addAttribute("selectedCourse", selectedCourse);
		return "instructor/overview";
	}
	
	@RequestMapping(value = "/{courseId}/learn", method = RequestMethod.GET)
	public String learnCourse(Model model, @PathVariable(name = "courseId") int courseId, HttpSession session) {
		Course selectedCourse = courseService.getCourseInfosByCourseID(courseId);
		model.addAttribute("selectedCourse", selectedCourse);
		
		return "instructor/overview";
	}
	
	@RequestMapping(value = "/courseTitle", method = RequestMethod.GET)
	public String getCourseOverview(Model model) {
		/*
		 * Course selectedCourse = courseService.getCourseInfosByCourseID(courseId);
		 * model.addAttribute("selectedCourse", selectedCourse);
		 */
		return "course-overview";
	}
	
	@RequestMapping(value = "/{courseId}/manage/settings", method = RequestMethod.GET)
	public String getCourseSettings(@PathVariable(name = "courseId") int courseId) {
		return "instructor/course-settings";
	}
	
	@RequestMapping(value = "/{courseId}/manage/settings", method = RequestMethod.POST)
	public String postCourseSettings(@PathVariable(name = "courseId") int courseId, RedirectAttributes redirectAttrs, Model model) {
		courseService.deleteCourseByID(courseId);
		redirectAttrs.addAttribute("deleteCourse", "successful");
		/* model.addAttribute("deleteCourse", "successful"); */
		return "redirect:/instructor/courses";
	}
	
	
}
