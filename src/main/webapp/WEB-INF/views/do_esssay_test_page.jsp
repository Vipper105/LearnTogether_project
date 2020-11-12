<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="tp.kits3.learntogether.user.vo.Test"%>
<%@page import="tp.kits3.learntogether.user.vo.MultichoiceQuestion"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math"%>

<!DOCTYPE html>
<html>

<%
/**
 * @author PhungDinhHuy
 *
 */
	/* HttpSession httpSession = request.getSession();
	User user = (User) httpSession.getAttribute(Contansts.USER_LOGGED);
	 */
	 
	 String contextPath=request.getContextPath();
	Test test=(Test)request.getAttribute("testObj");
	 
	//List<MultichoiceQuestion> listQuestionByTestID=(List<MultichoiceQuestion>) request.getAttribute("listQuestionByTestID");
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/do_test_page.css">
</head>
<body>
	
		<p class="title">Do essay test</p>
		<p class="test-name"> <span class="test-span">Test name :</span><%= test.getTitle() %></p>
		<div style="text-align: center;">
		<span class="time-name">Times :</span> <p class="timer-count" id="timer" style="color: red;font-size: 30px;"></p>
		</div>
		
	<div class="container">
		
	
		<!-- show từ DB lên => sử dụng set đối tượng và list -->
		<form action="submit-essay-test" id="" method="get">
		
		<% 
		for(int i=0;i<test.getListEssayQuestion().size();i++){
	
		%>
		<div class="question-content">
		<span style="font-weight: bold;font-size: 20px;font-family: cursive;color:#5e0655; ">Question <%=i+1 %> (<%= test.getListEssayQuestion().get(i).getScore() %> points)</span> : <span class="question-ask"><%= test.getListEssayQuestion().get(i).getTitle() %></span><br/>
		<span style="font-weight: bold;font-size: 19px;">Answer: </span>
		<textarea id="text" name="answer-content" wrap="soft" 
		style="overflow:hidden; resize:none;width: 800px;height: 90px;vertical-align: top" placeholder="Input your answer..."></textarea>
		<br/><br/>
		</div>
		
		<% 
		}
		%>
		
		<input type="hidden" value="${courseID}" name="courseID">
		<input id="submit-btn" type="submit" value="Submit">
		</form>
		
	</div>
	

</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script src="<%=contextPath%>/resources/js/time_countdown.js"></script>
</html>