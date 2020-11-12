<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	String contextPath=request.getContextPath();
%>
<body>
	<div class="popup" id="popup">
		<div class="popup-header">
			<h4>Why can't I submit for review?</h4>
			<span class="close" id="close" onclick="closePopup()">&times;</span>
		</div>

		<div class="popup-content">
			<p>You're almost ready to submit your course. Here are a few more
				items you need.</p>

			<ul class="parentUL">
				<li>On the <a href="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/curriculum">Curriculum</a> page, you should</li>
				<ul class="childrenUL">
					<li>Have at least 30 minutes of video content</li>
					<li>Have at least 5 lectures</li>
					<li>Have content for all your lectures</li>
				</ul>

				<li>On the <a href="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/basics">Course landing page</a>, you should</li>
				<ul class="childrenUL">
					<li>Have a course description with at least 50 words</li>
					<li>Select the category of your course</li>
					<li>Select the level of your course</li>
					<li>Upload a course image</li>
				</ul>

				<li>On the <a href="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/pricing">Pricing page</a>, you should</li>
				<ul class="childrenUL">
					<li>Select a price for your course</li>
				</ul>
				
				<li>On the <a href="<%=contextPath%>/updateUser">Instructor page</a>, you should</li>
				<ul class="childrenUL">
					<li>Have an instructor biography with at least 50 words</li>
					<li>Have an instructor headLine</li>
					<li>Have an instructor's image</li>
				</ul>
			</ul>

			<p>Once you complete these steps, you will be able to
				successfully submit your course for review.</p>
			<p>
				Still having problems? <a href="#">Check out this Support page</a>
			</p>
		</div>
	</div>
</body>

<style>
	body {
		position: relative;
	}
	
	.popup {
		background-color: #fff;
		position: absolute;
		top: 15%;
		left: 30%;
		border-radius: 6px;
	    box-shadow: 0 0 1px 1px rgba(20,23,28,.1), 0 3px 1px 0 rgba(20,23,28,.1);
	    display: none;
	}
	
	.popup a {
		color: #007791 !important;
	    background-color: transparent;
	    font-weight: 400;
	    text-decoration: none;
	}
	
	.popup-header {
		padding: 10px 0 20px 0;
	    border-bottom: 2px solid #ddd;
	    position: relative;
	}
	
	.popup-header>span {
		position: absolute;
	    right: 7px;
	    top: 3px;
	    font-size: 30px;
	}
	
	.popup-header>span:hover {
		cursor: pointer;
	}
	
	.popup .popup-content {
		padding: 10px 40px 30px 40px;
	}
	
	.popup-header h4 {
		padding-left: 40px;
		color: #29303b;
	}
	
	.popup-content>p {
		padding-bottom: 10px;
	}
	
	.childrenUL {
		padding-left: 40px;
	}
	
	.parentUL .childrenUL:last-child {
		padding-bottom: 10px;
	}
</style>

<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script type="text/javascript">
function closePopup(){
	var popup = document.getElementById("popup");
	popup.style.display = "none";
}
</script>
</html>