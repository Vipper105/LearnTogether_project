<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tp.kits3.learntogether.user.vo.TestType"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="tp.kits3.learntogether.user.vo.Lesson"%>
<%@page import="java.util.HashMap"%>
<%@page import="tp.kits3.learntogether.user.service.LessonService"%>
<%@page import="tp.kits3.learntogether.user.vo.Section"%>
<%@page import="java.util.List"%>
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
	User user = (User) session.getAttribute(Contansts.USER_LOGGED);
	int i = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/curriculum.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<header>
		<div class="header-container">
			<div class="header-left">
				<ul>
					<li>
						<a href="<%=contextPath%>/instructor/courses"><i class='fas fa-angle-left' style='font-size:36px;color:#ec5252'></i></a>
						<a href="<%=contextPath%>/instructor/course/<%=selectedCourse.getId() %>/manage/basics"><span style="color: #fff;font-weight: bold;">Back to manage courses</span></a>				
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
				<a href="<%=contextPath%>/course/draft/${selectedCourse.id}/learn" class="btn" id="btnPreview" ><span style="color: white">Preview</span></a>
				<input type="submit" value="Save" class="btn" id="btnSave" name="action" style="display: none">
				<i class="fa fa-gear setting" style="font-size:24px;color:white"></i>
			</div>
		</div>
	</header>
		
	
	<jsp:include page="../instructor/successful-alert.jsp"></jsp:include>
	
	<form action="<%=contextPath%>/instructor/course/${selectedCourse.id}/manage/curriculum" method="post" name="a" enctype="multipart/form-data" >			
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
				<input type="submit" value="Submit for Review" name="action" id="btnSubmit" class="btn" onclick="return validate('${selectedCourse.priceCourse}', '${selectedCourse.description}', '${selectedCourse.lessonList.size()}', '${selectedCourse.categoryId}', '${selectedCourse.courseLevelId}', '${selectedCourse.urlImg}', '${selectedCourse.isLessonNoVideo()}', '${selectedCourse.totalVideoDuration}', '${selectedCourse.user.headLine
				}', '${selectedCourse.user.biography}', '${selectedCourse.user.getUrlimg()}')">
			</div>
			
			
				<div class="section-right">
					<div class="right-container">
						<h2>Curriculumn</h2>
						
						<input type="button" value="Section" name="action" id="newSection" onclick="loadFormCreatingSection()">
						<ul>
							<c:forEach items="${sectionLessonMap}" var="section" varStatus="sectionIndex">
								<li>
									<div>
										<div id="section-container${section.getKey().id}">
											<b>Section ${sectionIndex.count}: </b>
											<a href="<%=contextPath%>/instructor/course/${section.getKey().id}/manage/curriculum">${section.getKey().getTitle()}</a>
											<i class='fas fa-pencil-alt' onclick="loadEditSectionContainer(${section.getKey().id}, ${sectionIndex.count})"></i>
											<i class="fa fa-trash" onclick="loadConfirmPopupFromSection(${sectionIndex.count}, ${section.getValue().size()})"></i>
										</div>
										
										<div class="edit-section-container" id="edit-section-container${section.getKey().id}">
											<div>
												<b>Section ${sectionIndex.count}: </b>
											</div>
											
											<div>
												<input type="text" placeholder="Enter a title" name="editSectionTitle" id="editSectionTitle${section.getKey().id}" value="${section.getKey().title}"> <br>
												<label name="editSectionTitleError" id="editSectionTitleError${section.getKey().id}" class="error"></label> <br>
												<span>What will students be able to do at the end of this section?</span> <br>
												<input type="text" placeholder="Enter a learning objective" name="editSectionDescription" value="${section.getKey().description}"> <br>
												<div class="action-area">
													<input type="submit" value="Cancel" name="action" class="btnDefault">
													<input type="submit" value="Save section" name="action" class="btnDefault" onclick="return validOldSection(${section.getKey().id});">
												</div>
											</div>
										</div>
										
										 
										<c:forEach items="${section.getValue()}" var="lesson" varStatus="lessonIndex">
											<div class="lesson-container">
												<div class="lesson-item" id="lesson-item${lesson.id}">
													<div id="lessonC${lesson.id}">
														<span>Lecture ${lessonIndex.count}: </span>
														<a href="<%=contextPath%>/instructor/course/${lesson.id}/manage/curriculum">${lesson.getTitle()}</a>
														<i class='fas fa-pencil-alt' onclick="loadEditLessonContainer(${lesson.id}, <%=i%>)"></i>
														<i class="fa fa-trash" onclick="loadConfirmPopup(${lesson.id})"></i>
													</div>
													<div>
														<input type="button" value="+ Content" id="lesson${lesson.id}" class="btnDefault" onclick="displayResourceArea(${lesson.id}, ${sectionIndex.count}, <%=i%>);">
													</div>
												</div>
												
												<div class="editLessonContainer" id="editLessonContainer${lesson.id}">
													<div>
														<b>Lecture ${lessonIndex.count}: </b>
													</div>
											
													<div>
														<input type="text" placeholder="Enter a title" name="editLessonTitle" id="editLessonTitle${lesson.id}" value="${lesson.title}"> <br>
														<label name="editLessonTitleError" id="editLessonTitleError${lesson.id}" class="error"></label> <br>
														<div class="action-area">
															<input type="submit" value="Cancel" name="action" class="btnDefault">
															<input type="submit" value="Save lecture" name="action" class="btnDefault" onclick="return validOldLesson(${lesson.id});">
														</div>
													</div>
												</div>
												
												<div class="resources" id="resources${lesson.id}">
													<c:choose>
														<c:when test="${lesson.urlVid ne null}">
															<video width="200" height="120" controls>
														  		<source src="<%=contextPath%>/resources/videos/upload/${lesson.urlVid}" type="video/mp4">
															</video>
														</c:when>
													</c:choose>
											
													<div>
														<input type="button" value="+ Description" class="btnDefault" id="btnDescription" onclick="loadInputLessonDescription(${lesson.id})"> <br>
														<div class="lesson-description" id="lesson-description${lesson.id}">
															Lecture Description: <br>
															<textarea name="lessonDescription" placeholder="Add a description. Include what students will be able to do after completing the lecture.">${lesson.description}</textarea>
															<div class="action-area">
																<input type="submit" value="Cancel" name="action" class="btnDefault">
																<input type="submit" value="Save" name="action" class="btnDefault">
															</div>
														</div>
													</div>
													
													<div>
														<input type="button" value="+ Resources" class="btnDefault" onclick="loadUploadVideo(${lesson.id})"> <br>
														<div class="lesson-resources" id="lesson-resources${lesson.id}">
															<div class="upload-video-container">
																<label class=""></label>
																<input readonly="readonly" type="text" placeholder="No file selected" value="${lesson.urlImg}" class="form-layout no-file" id="videoName${lesson.id}">
																<label for="uploadVideo" class="form-layout lbVideo btnDefault">Upload File</label>
																<input id="uploadVideo" type="file" accept="video/*" src="" name="uploadVideo" onchange="setFileInfo(${lesson.id})">
																<input type="hidden" id="videoDuration${lesson.id}" name="videoDuration">
															</div>
															<div>Note: A resource is for any type of document that can be used to help students in the lecture. This file is going to be seen as a lecture extra. Make sure everything is legible and the file size is less than 1 GB.</div>
															<div class="action-area">
																<input type="submit" value="Cancel" name="action" class="btnDefault">
																<input type="submit" value="Save" name="action" class="btnDefault">
															</div>
														</div>
													</div>
													<input type="hidden" name="lessonID" value="${lesson.id}">
												</div>
											</div>
											<%++i;%>
										</c:forEach>
										<div class="add-lecture" id="add-lecture">
											<input type="button" value="Lecture" onclick="loadFormCreatingLecture(${section.getKey().id}, ${sectionIndex.count})" class="btnDefault">
										</div>
									</div>
									
									<div class="inputNewLecture" id="inputNewLecture${section.getKey().id}">
										<span>New lecture: </span>
										<div class="counter-container">
											<input type="text" placeholder="Enter a title" name="title" id="lessonTitle${section.getKey().id}" maxlength="60" onkeyup="textCounter(this, 'new-lecture-title-counter${section.getKey().id}', 60)">
											<div class="new-lecture-title-counter counter" id="new-lecture-title-counter${section.getKey().id}">60</div>
											<label name="lessonTitleError" id="lessonTitleError${section.getKey().id}" class="error"></label>
										</div>
										
										<input type="hidden" name="sectionID" value="${section.getKey().id}">
										<div class="action-area">
											<input type="submit" value="Cancel" name="action" class="btnDefault">
											<input type="submit" value="Add lecture" name="action" class="btnDefault" onclick="return validNewLecture();">
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
						
						<input type="hidden" id="selectedSectionID" name="selectedSectionID">
						<input type="hidden" id="selectedLessonID" name="selectedLessonID">
						<input type="hidden" id="sectionIndex" name="sectionIndex">
						<input type="hidden" id="lessionIndex" name="lessionIndex">
						
						<div class="inputNewSection" id="inputNewSection">
							<b>New section: </b>
							<div class="new-section-title-area">
								<input type="text" placeholder="Enter a title" name="title" id="sectionTitle" maxlength="60" onkeyup="textCounter(this, 'new-section-title-counter', 60)"> <br>
								<div class="new-section-title-counter counter" id="new-section-title-counter">60</div>
							</div>
							
							<label name="sectionTitleError" id="sectionTitleError" class="error"></label> <br>
							<span>What will students be able to do at the end of this section?</span> <br>
							<div class="new-section-description-area">
								<textarea placeholder="Enter a learning objective" name="sectionDescription" maxlength="255" rows="2" onkeyup="textCounter(this, 'new-section-description-counter', 255)"></textarea> <br>
								<div class="new-section-description-counter counter" id="new-section-description-counter">255</div>
							</div>
							
							<div class="action-area">
								<input type="submit" value="Cancel" name="action" class="btnDefault">
								<input type="submit" value="Add section" name="action" class="btnDefault" onclick="return validNewSection();">
							</div>
						</div>
					</div>
				</div>
		</section>
		
		<jsp:include page="../instructor/popup.jsp"></jsp:include>
		
		<div class="confirm-popup myPopup" id="confirm-popup">
			<h5>Please Confirm</h5>
			<div>
				<p id="content-popup">You are about to remove a curriculum item. Are you sure you want to continue?</p>
				<div class="action-area">
					<input type="submit" value="Cancel" name="action" class="btnDefault">
					<input type="submit" value="OK" name="action" class="btnDefault">
				</div>
			</div>
		</div>
		
		<div class="info-popup myPopup" id="info-popup">
			<h5>Please Confirm</h5>
			<div>
				<p id="content-popup">Please delete lecture first</p>
				<div class="action-area">
					<input type="button" value="OK" onclick="closeInfoPopup()" class="btnDefault">
				</div>
			</div>
		</div>
	</form>
	
	
	<footer>
	</footer>

</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script src="<%=contextPath%>/resources/js/validateCourse.js"></script>

<script type = "text/javascript">
	window
	
	var myVideos = [];
	
	function textCounter(field, counter, maxLimit) {
		var countField = document.getElementById(counter);
		if (field.value.length > maxLimit) {
			field.value = field.value.substring(0, maxLimit);
			return false;
		} else {
			countField.innerHTML = maxLimit - field.value.length;
		}
	}

	function loadFormCreatingLecture(sectionID, selectedSection){
		var inputNewLecture = document.getElementById("inputNewLecture" + sectionID);
		var addLectureBtn = document.getElementById("add-lecture");
		var selectedSectionID = document.getElementById("selectedSectionID");
		var sectionIndex = document.getElementById("sectionIndex");
		
		inputNewLecture.style.display = "block";
		selectedSectionID.value = sectionID;
		sectionIndex.value = selectedSection;
	}
	
	function loadFormCreatingSection(){
		var inputNewSection = document.getElementById("inputNewSection");
		inputNewSection.style.display = "block";
	}
	
	function displayResourceArea(lessonID, selectedSection, selectedLesson){
		var resourcesArea = document.getElementById("resources" + lessonID);
		var lessionIndex = document.getElementById("lessionIndex");
		var display = resourcesArea.style.display;
		
		lessionIndex.value = selectedLesson;
		if (display == "block"){
			resourcesArea.style.display = "none";
		}else {
			resourcesArea.style.display = "block";
		}
	}
	
	function loadInputLessonDescription(lessonID){
		var lessonDescription = document.getElementById("lesson-description" + lessonID);
		var lessonVideo = document.getElementById("lesson-resources" + lessonID);
		var btnDescription = document.getElementById("btnDescription");
		btnDescription.style.display = "none";
		lessonVideo.style.display = "none";
		
		var display = lessonDescription.style.display;
		if (display == "block"){
			lessonDescription.style.display = "none";
		}else {
			lessonDescription.style.display = "block";
		}
	}
	
	function loadUploadVideo(lessonID){
		var lessonVideo = document.getElementById("lesson-resources" + lessonID);
		var lessonDescription = document.getElementById("lesson-description" + lessonID);
		var btnDescription = document.getElementById("btnDescription");
		var selectedLessonID = document.getElementById("selectedLessonID");
		
		btnDescription.style.display = "block";
		lessonDescription.style.display = "none";
		selectedLessonID.value = lessonID;
		
		var display = lessonVideo.style.display;
		if (display == "block"){
			lessonVideo.style.display = "none";
		}else {
			lessonVideo.style.display = "block";
		}
	}
	
	function validNewSection(){
		var selectedSectionTitle = document.getElementById("sectionTitle");
		var sectionTitleError = document.getElementById("sectionTitleError");
		var titleErrorMsg = "The field may not be blank.";
		
		if(selectedSectionTitle.value.length == 0){
			sectionTitleError.innerHTML = titleErrorMsg;
			selectedSectionTitle.focus();
			selectedSectionTitle.className = "inputError";
			return false;
		}
		return true;
	}
	
	function validNewLecture(){
		var selectedSectionID = document.getElementById("selectedSectionID").value;
		var selectedLessonTitle = document.getElementById("lessonTitle" + selectedSectionID);
		var lessonTitleError = document.getElementById("lessonTitleError" + selectedSectionID);
		var titleErrorMsg = "The field may not be blank.";
		
		if(selectedLessonTitle.value.length == 0){
			lessonTitleError.innerHTML = titleErrorMsg;
			selectedLessonTitle.focus();
			selectedLessonTitle.className = "inputError";
			return false;
		}
		return true;
	}
	
 	document.getElementById('uploadVideo').onchange = function () {
		var fullAddressToVideo = this.value.split("\\");
		var length = fullAddressToVideo.length;
		var name = fullAddressToVideo[length-1];
		var selectedLessonID = document.getElementById("selectedLessonID").value;
		var videoName = document.getElementById("videoName" + selectedLessonID);
		videoName.value = name;
		
		
		 var files = this.files;
		  myVideos.push(files[0]);
		  var video = document.createElement('video');
		  video.preload = 'metadata';

		  video.onloadedmetadata = function() {
		    window.URL.revokeObjectURL(video.src);
		    var duration = video.duration;
		    myVideos[myVideos.length - 1].duration = duration;
		    updateInfos();
		  }
		  video.src = URL.createObjectURL(files[0]);
	};
	
	function loadEditSectionContainer(sectionID, selectedSection) {
		var editSectionContainer = document.getElementById("edit-section-container" + sectionID);
		var sectionContainer = document.getElementById("section-container" + sectionID);
		var sectionIndex = document.getElementById("sectionIndex");
		
		sectionIndex.value = selectedSection;
		editSectionContainer.style.display = "flex";
		sectionContainer.style.display = "none";
	}
	
	function loadEditLessonContainer(lessonID, selectedLessonIndex) {
		var editLessonContainer = document.getElementById("editLessonContainer" + lessonID);
		var LessonItemContainer = document.getElementById("lesson-item" + lessonID);
		var lessonContainer = document.getElementById("lessonC" + lessonID);
		var selectedLessonID = document.getElementById("selectedLessonID");
		var lessonIndex = document.getElementById("lessionIndex");
		
		selectedLessonID.value = lessonID;
		lessonIndex.value = selectedLessonIndex;
		editLessonContainer.style.display = "flex";
		lessonContainer.style.display = "none";
		LessonItemContainer.style.display = "none";
	}
	
	function validOldSection(sectionID){
		var editSectionTitle = document.getElementById("editSectionTitle" + sectionID);
		var editSectionTitleError = document.getElementById("editSectionTitleError" + sectionID);
		
		var titleErrorMsg = "The field may not be blank.";
		
		if(editSectionTitle.value.length == 0){
			editSectionTitleError.innerHTML = titleErrorMsg;
			editSectionTitle.focus();
			editSectionTitle.className = "inputError";
			return false;
		}
		return true;
	}
	
	function validOldLesson(lessonID){
		var editLessonTitle = document.getElementById("editLessonTitle" + lessonID);
		var editLessonTitleError = document.getElementById("editLessonTitleError" + lessonID);
		
		var titleErrorMsg = "The field may not be blank.";
		
		if(editLessonTitle.value.length == 0){
			editLessonTitleError.innerHTML = titleErrorMsg;
			editLessonTitle.focus();
			editLessonTitle.className = "inputError";
			return false;
		}
		return true;
	}

	function updateInfos() {
	  var selectedLessonID = document.getElementById('selectedLessonID').value;
	  var infos = document.getElementById('videoDuration' + selectedLessonID);
	  infos.textContent = "";
	  for (var i = 0; i < myVideos.length; i++) {
	    infos.value = myVideos[i].duration;
	  }
	}
	
	function loadConfirmPopup(lessonID){
		var confirmPopup = document.getElementById("confirm-popup");
		var selectedLessonID = document.getElementById("selectedLessonID");
		
		selectedLessonID.value = lessonID;
		confirmPopup.style.display = "block"
	}
	
	function loadConfirmPopupFromSection(sectionIndex, numOfLesson){
		var confirmPopup = document.getElementById("confirm-popup");
		var sectionIndexElement = document.getElementById("sectionIndex");
		
		if(numOfLesson > 0){
			var infoPopup = document.getElementById("info-popup");
			infoPopup.style.display = "block";
			return;
		}
		
		sectionIndexElement.value = sectionIndex;
		confirmPopup.style.display = "block"
	}
	
	function closeInfoPopup(){
		var infoPopup = document.getElementById("info-popup");
		infoPopup.style.display = "none";
	}
	
	//Huy
	var creat_test_form=document.getElementById('creat-test-form');
	
	function disableField() {
		var x = document.getElementById("select-testType").value;
		var number_answers = document.getElementById("number-answers");
		var score = document.getElementById("score");	

		if (x == 'Essay') {
			number_answers.hidden = true;
			score.hidden = true;
		} else if (x == 'Multichoice') {
			number_answers.hidden = false;
			score.hidden = false;
		}		
	}
	
	function looadFormCreatingTest(sectionID, selectedSection){
		var inputNewTest = document.getElementById("inputNewTest" + sectionID);
		var selectedSectionID = document.getElementById("selectedSectionID");
		var sectionIndex = document.getElementById("sectionIndex");
		
		inputNewTest.style.display = "block";
		selectedSectionID.value = sectionID;
		sectionIndex.value = selectedSection;
	}
</script>

</html>