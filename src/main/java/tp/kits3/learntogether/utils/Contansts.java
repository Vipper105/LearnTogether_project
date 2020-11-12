package tp.kits3.learntogether.utils;

/**
 * @author PhungDinhHuy
 *
 */
public class Contansts {

	// url
	public static final String URL_LOGIN = "login_01";
	public static final String URL_INDEX = "index";
	public static final String URL_REGISTER = "register1";
	public static final String URL_ADMIN = "redirect:/admin/user";
	public static final String URL_CHANGE_PASSWORD = "change_password1";
	public static final String URL_FORGOT_PASSWORD = "forgot_password";
	public static final String URL_AUTHEN_ERROR = "fobbiden_page";
	public static final String URL_RESULT_MULTICHOICE_TEST_PAGE = "result_test_multichoice";
	public static final String URL_RESULT_ESSAY_TEST_PAGE = "result_test_essay";
	public static final String URL_CREATE_TEST_PAGE = "create_test_page";
	public static final String URL_CREATE_ESSAY_PAGE = "create_essay_question_page";
	public static final String URL_CREATE_MULTICHOICE_PAGE = "create_multichoice_question_page";
	public static final String URL_DO_MULTICHOICE_TEST_PAGE = "do_multichoice_test_page";
	public static final String URL_DO_ESSAY_TEST_PAGE = "do_esssay_test_page";
	public static final String URL_SHOW_TEST_NOT_MARKED = "show_test_not_marked";
	public static final String ATTR_MARK_WRONG_SCORE = "mark-score-error-message";

	// session
	public static final String RESULT_LOGIN = "resultLogin";
	public static final String TEST_CREATED = "test_created";

	// Cookies Message
	public static final String USER_LOGGED = "userLogged";
	public static final String COOKIE_NAME = "cookieName";
	public static final String COOKIE_PASSWOD = "cookiePassword";
	public static final String COOKIE_REMEMBER = "cookieRemember";

	// Message
	public static final String ATTR_REGISTER = "RegisterResult";
	public static final String INVALID_GMAIL = "Gmail is not existed";
	public static final String REGISTER_SUCCESS = "Register successfylly!";
	public static final String REGISTER_FAILED = "Register Fail! User is existed";

	public static final String ATTR_CHANGE_PASSWORD_MSG = "1";
	public static final String WRONG_OLD_PASSWORD = "Old Password is not correct ";
	public static final String NOSAME_PASSWORD = "New password and renew password must be the same";

	public static final String LIST_TEST_BY_SECTIONID = "New password and renew password must be the same";
	
	public static final String MSG_MARK_SCORE_ERROR="Score should be smaller than/equal to the point of questions";
	
	// Model
	public static final String ATTR_ALL_TESTTYPE = "TestType";
	public static final String ATTR_ALL_SECTION = "SectionAll";
}
