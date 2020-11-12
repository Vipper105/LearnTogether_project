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
	Course selectedCourse = (Course)request.getSession().getAttribute("selectedCourse");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/course-manage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<form action="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/basics" method="post" enctype="multipart/form-data">
		<header>
			<div class="header-container">
				<div class="header-left">
					<ul>
						<li>
							<a href="<%=contextPath%>/instructor/courses"><i class='fas fa-angle-left' style='font-size:36px;color:#ec5252'></i></a>
							<a href="<%=contextPath%>/instructor/courses"><span style="color: #fff;font-weight: bold;">Back to courses</span></a>
						</li>
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
					<a href="<%=contextPath%>/course/draft/${selectedCourse.id}/learn" class="btn" id="btnPreview"><span style="color: #fff">Preview</span></a>
					<input type="submit" value="Save" name="action" class="btn" id="btnSave">
					<a href="<%=contextPath%>/course/${selectedCourse.id}/manage/settings"><i class="fa fa-gear setting" style="font-size:24px;color:white"></i></a>
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
						<li><a href="<%=contextPath%>/test/${selectedCourse.id}/create-test-page/">Create test</a></li>
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
				<%-- <input type="submit" value="Submit for Review" id="btnSubmit" class="btn" onclick="return validate('${selectedCourse.priceCourse}', '${selectedCourse.description}', '${selectedCourse.lessonList.size()}', '${selectedCourse.categoryId}', '${selectedCourse.courseLevelId}', '${selectedCourse.urlImg}', '${selectedCourse.isLessonNoVideo()}', '${selectedCourse.totalVideoDuration}')"> --%>
				<input type="submit" value="Submit for Review" name="action" id="btnSubmit" class="btn" onclick="return validate('${selectedCourse.priceCourse}', '${selectedCourse.description}', '${selectedCourse.lessonList.size()}', '${selectedCourse.categoryId}', '${selectedCourse.courseLevelId}', '${selectedCourse.urlImg}', '${selectedCourse.isLessonNoVideo()}', '${selectedCourse.totalVideoDuration}', '${selectedCourse.user.headLine
				}', '${selectedCourse.user.biography}', '${selectedCourse.user.getUrlimg()}')">
			</div>
			
			<div class="section-right">
				<h2>Course landing page</h2>
				
				<div class="course-info">
					<label>Course title</label> <br>
					<div class="title-container">
						<input type="text" placeholder="Insert your course title." id="courseTitle" name="courseTitle" value="${selectedCourse.courseTitle}" class="form-layout" maxlength="60"  onkeyup="textCounter(this, 'counter', 60)"/>
						<div class="counter" id="counter">60</div>
					</div>
					
					
					
					<label>Course description</label> <br>
					<textarea rows="10" cols="30" id="courseDescription" name="description" placeholder="Insert your course description."><%=selectedCourse.getDescription()%></textarea>
					
					<label>Basic info</label>
					
					<select class="form-layout" name="language">
						<option value="English (US)">English (US)</option>
					</select>
					
					<select class="form-layout" name="courseLevelId">
						<option value="" disabled="disabled" selected="selected" hidden="hidden">-- Select Level --</option>
						<c:forEach items="${CourseLevelList}" var="level">
							<c:choose>
								<c:when test="${selectedCourse.courseLevelId eq level.getId()}">
									<option value="${level.getId()}" selected="selected">${level.getLevelName()}</option>
								</c:when>
								<c:otherwise>
									<option value="${level.getId()}">${level.getLevelName()}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					
					<select class="form-layout" name="categoryId">
						<option value="" disabled="disabled" selected="selected" hidden="hidden">-- Select Category --</option>
							<c:forEach items="${CategoryList}" var="cat">
								<c:choose>
									<c:when test="${selectedCourse.categoryId eq cat.getId()}">
										<option value="${cat.getId()}" selected="selected">${cat.getCategoryName()}</option>
									</c:when>
									<c:otherwise>
										<option value="${cat.getId()}">${cat.getCategoryName()}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>
					
					
					<label class="image-area">Course image</label>
					<div class="upload image">
						<div class="left">
							<img alt="" src="<%=contextPath %>/resources/images/upload/${selectedCourse.urlImg}">
						</div>
					
						<div class="right">
							<p>Upload your course image here. It must meet our course image quality standards to be accepted. Important guidelines: 750x422 pixels; .jpg, .jpeg,. gif, or .png. no text on the image.</p>
							<div class="upload-image-container">
								<input id="imageName" readonly="readonly" type="text" value="No file selected" class="form-layout no-file">
								<label for="uploadFile" class="form-layout">Upload File</label>
								<input id="uploadFile" type="file" accept=".gif, .jpg, .jpeg, .png" name="uploadImage" onchange="abc()">
							</div>		
						</div>
					</div>
					
					<label class="image-area">Promotional Video</label>
					<div class="upload video">
						<div class="left">
							<img alt="" src="<%=contextPath%>/resources/images/upload/course-placeholder.png">
						</div>
					
						<div class="right">
							<p>Students who watch a well-made promo video are 5X more likely to enroll in your course. We've seen that statistic go up to 10X for exceptionally awesome videos. Learn how to make yours awesome!</p>
							<div class="upload-video-container">
								<input readonly="readonly" type="text" value="No file selected" class="form-layout no-file">
								<label for="uploadImage" class="form-layout">Upload File</label>
								<input id="uploadImage" type="file" accept="video/*" name="uploadVideo">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<jsp:include page="../instructor/popup.jsp"></jsp:include>
		
		
		<footer>
		</footer>
	</form>
</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
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
	
	function abc(){
		var imageName = document.getElementById("imageName");
		var uploadFile = document.getElementById("uploadFile").value.split("\\");
		var length = uploadFile.length;
		
		imageName.value = uploadFile[length-1];
	}
	
</script>

</html>