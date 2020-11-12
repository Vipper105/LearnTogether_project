<%@page import="tp.kits3.learntogether.user.vo.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/**
* 	@author: Diep Nguyen
*/
%>

<%
	String contextPath = request.getContextPath();
	Course selectedCourse = (Course) request.getSession().getAttribute("selectedCourse");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/pricing.css">
</head>
<body>
	<form
		action="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/pricing"
		method="post" enctype="multipart/form-data">
		<header>
			<div class="header-container">
				<div class="header-left">
					<ul>
						<li><a href="<%=contextPath%>/instructor/courses"><i
								class='fas fa-angle-left'
								style='font-size: 36px; color: #ec5252'></i></a> <a
							href="<%=contextPath%>/instructor/courses">Back to courses</a></li>
						<li>${selectedCourse.courseTitle}</li>
						<li>draft</li>
						<c:choose>
							<c:when test="${selectedCourse.totalVideoDuration} eq 0">
								<li>0 min of video content uploaded</li>
							</c:when>
							<c:otherwise>
								<li>${selectedCourse.totalVideoDuration} mins of video content uploaded</li>	
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="header-right">
					<a href="<%=contextPath%>/course/draft/${selectedCourse.id}/learn" class="btn" id="btnPreview">Preview</a> <input
						type="submit" value="Save" class="btn" id="btnSave" style="display: none"> <i
						class="fa fa-gear setting" style="font-size: 24px; color: white"></i>
				</div>
			</div>
		</header>

		<jsp:include page="../instructor/successful-alert.jsp"></jsp:include>
		
		<section>
			<div class="section-left">
				<div>
					<h5>Create your content</h5>
					<ul>
						<li><a href="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/curriculum">Curriculum</a></li>
					</ul>
				</div>


				<div class="publish-your-course">

					<h5>Publish your course</h5>
					<ul>
						<li><a href="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/basics">Course landing page</a></li>
						<li><a href="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/pricing">Pricing</a></li>
						<li><a href="#">Promotions</a></li>
						<li><a href="#">Course message</a></li>
					</ul>
				</div>
				<%-- <input type="submit" value="Submit for Review" id="btnSubmit"
					class="btn" onclick="return validate('${selectedCourse.description}', '${selectedCourse.lessonList.size()}', '${selectedCourse.categoryId}', '${selectedCourse.courseLevelId}', '${selectedCourse.urlImg}', '${selectedCourse.isLessonNoVideo()}', '${selectedCourse.totalVideoDuration}')">
				 --%>
				 <input type="submit" value="Submit for Review" name="action" id="btnSubmit" class="btn" onclick="return validate('${selectedCourse.priceCourse}', '${selectedCourse.description}', '${selectedCourse.lessonList.size()}', '${selectedCourse.categoryId}', '${selectedCourse.courseLevelId}', '${selectedCourse.urlImg}', '${selectedCourse.isLessonNoVideo()}', '${selectedCourse.totalVideoDuration}', '${selectedCourse.user.headLine
				}', '${selectedCourse.user.biography}', '${selectedCourse.user.getUrlimg()}')">
			</div>

			<div class="section-right">
				<h2>Pricing</h2>

				<div class="content">
					<p>Please select the price for your course below and click
						'Save'.</p>
					<p>If you're intending to offer your course for free, the total
						length of video content must be less than 2 hours.</p>

					<select id="pricing" name="pricing" onchange="enableButtonSave();">
						<option disabled="disabled" selected="selected" hidden="hidden">Select</option>
						<c:choose>
							<c:when test="${selectedCourse.isFree() == true}">
								<option value="0.0" selected="selected">Free</option>
							</c:when>
							<c:otherwise>
								<option value="0.0">Free</option>
							</c:otherwise>
						</c:choose>

						<c:forEach items="${coursePricing}" var="course">
							<c:choose>
								<c:when test="${course.price eq selectedCourse.priceCourse}">
									<option value="${course.price}" selected="selected">$${course.price}</option>
								</c:when>
								<c:otherwise>
									<option value="${course.price}">$${course.price}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</select> <input type="submit" value="Save" class="btnDefault"
						id="btnPricingSave" disabled>
				</div>
			</div>
		</section>

		<footer> </footer>
	</form>


	<div class="popup" id="popup">
		<div class="popup-header">
			<h4>Why can't I submit for review?</h4>
			<span class="close" id="close" onclick="closePopup()">&times;</span>
		</div>

		<div class="popup-content">
			<p>You're almost ready to submit your course. Here are a few more
				items you need.</p>

			<ul class="parentUL">
				<li>On the Curriculum page, you should</li>
				<ul class="childrenUL">
					<li>Have at least 30 minutes of video content</li>
					<li>Have at least 5 lectures</li>
					<li>Have content for all your lectures</li>
				</ul>

				<li>On the Course landing page, you should</li>
				<ul class="childrenUL">
					<li>Have a course description with at least 50 words</li>
					<li>Have an instructor description with at least 50 words</li>
					<li>Select the category of your course</li>
					<li>Select the level of your course</li>
					<li>Upload a course image</li>
				</ul>

				<li>On the Pricing page, you should</li>
				<ul class="childrenUL">
					<li>Select a price for your course</li>
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

<script src="<%=contextPath%>/resources/js/validateCourse.js"></script>

<script>
	function textCounter(field, counter, maxLimit) {
		var countField = document.getElementById(counter);
		if (field.value.length > maxLimit) {
			field.value = field.value.substring(0, maxLimit);
			return false;
		}else {
			countField.innerHTML = maxLimit - field.value.length;
			visibleContinueBtn();
		}
		
		if(field.value.length == 0) {
			disableContinueBtn();
		}
	}
	
	function enableButtonSave(){
		var btnSave = document.getElementById("btnPricingSave");
		btnSave.disabled = false;
	}
	
	function validate(courseDescription, numOfLesson, categoryID, courseLevelID, courseImage, isLessonNoVideo, totalVideoDuration){
		var popup = document.getElementById("popup");
		var pricing = document.getElementById("pricing").value;
		
		if(courseDescription.length < 50){
			popup.style.display = "block";
			return false;
		}else if(categoryID.length == 0 || courseLevelID.length == 0){
			popup.style.display = "block";
			return false;
		}else if(courseImage == 'course-placeholder.png'){
			popup.style.display = "block";
			return false;
		}else if(pricing == "Select"){
			popup.style.display = "block";
			return false;
		}else if(numOfLesson < 5){
			popup.style.display = "block";
			return false;
		}else if(isLessonNoVideo == "true"){
			popup.style.display = "block";
			return false;
		}else if(totalVideoDuration = '' || totalVideoDuration < 30){
			popup.style.display = "block";
			return false;
		}
		return true;
	}
	
	function closePopup(){
		var popup = document.getElementById("popup");
		popup.style.display = "none";
	}
	
</script>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>