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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/course-settings.css">
</head>
<body>
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
			<h2>Settings</h2>

			<form action="<%=contextPath%>/course/${selectedCourse.id}/manage/settings" method="post">			
				<div class="content">
					<div class="left">
						<input type="button" value="Delete" class="btn btnDelete" onclick="openConfirmDeletePopup()">
					</div>
					
					<div class="right">
						<span>We promise students lifetime access, so courses cannot be deleted after students have enrolled.</span>
					</div>
				</div>
				
				<div class="popup confirm-delete-popup" id="confirm-delete-popup">
					<h5>Delete your course?</h5>
					<div class="popup-content">
						<p id="content-popup">Are you sure you want to delete this course? This is permanent and cannot be undone.</p>
						<div class="action-area">
							<input type="button" value="No" class="btnDefault" onclick="closePopup()">
							<input type="submit" value="Yes" class="btnDefault">
						</div>
					</div>
				</div>
			</form>	
		</div>	
	</section>

	<footer> </footer>

</body>

<script>
	function closePopup(){
		var confirmDeletePopup = document.getElementById("confirm-delete-popup");
		confirmDeletePopup.style.display = "none";
	}
	
	function openConfirmDeletePopup(){
		var confirmDeletePopup = document.getElementById("confirm-delete-popup");
		confirmDeletePopup.style.display = "block";
	}
	
</script>
</html>