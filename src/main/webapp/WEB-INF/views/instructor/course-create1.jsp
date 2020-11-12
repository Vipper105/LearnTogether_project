<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/**
	* 	@author: Diep Nguyen
	*/
%>

<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Courses - Anytime, Anywhere | Learntogether</title><link rel="stylesheet" href="<%=contextPath%>/resources/css/create1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<header>
		<div class="header-container">
			<div class="logo">
				<img alt="" src="<%=contextPath%>/resources/images/logo.png">
			</div>
			<div class="step">Step 1 of 3</div>
			<a href="<%=contextPath%>/instructor/courses" class="exit">Exit</a>
		</div>
		<div class="progress">
			<div class="inprogress"></div>
			<div class="not-started"></div>
		</div>
	</header>

	<section>
		<h1>First, let's find out what type of course you're making.</h1>
		<input id="check1" name="slide-radio" type="radio" onclick="visibleContinueBtn()">
		<input id="check2" name="slide-radio" type="radio" onclick="visibleContinueBtn()">
		
		<div class="section-container">
			<label for="check1" class="course-test course">
				<i class="fa fa-file-video-o" style="font-size: 36px"></i>
				<span class="type">Course</span>
				<span class="des">Create rich learning experiences with the help of video
						lectures, quizzes, coding exercises, etc.</span>
			</label>
			<label for="check2" class="course-test test"> 
				<img alt="" src="<%=contextPath%>/resources/images/icon-exam.png">
				<span class="type">Test</span>
				<span class="des">Help students prepare for certification exams by providing
						practice questions.</span>
			</label>
		</div>
	</section>

	<footer>
		<form action="2" method="get">
			<input type="submit" value="Continue" id="continueBtn" class="btn" disabled="disabled">
		</form>
	</footer>
</body>

<script type="text/javascript">
function visibleContinueBtn(){
	var continueBtn = document.getElementById('continueBtn');
	continueBtn.disabled = false;
	continueBtn.style.backgroundColor = "#ec5252";
	continueBtn.style.color = "#fff";
	continueBtn.style.cursor = "pointer";
}
</script>
</html>