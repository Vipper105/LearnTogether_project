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
	int i = 0;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/overview.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

	<header>
		<div class="header-container">
			<div class="logo">
				<a href="<%=contextPath%>">
					<img alt="" src="<%=contextPath%>/resources/images/logo.png">
				</a>
				
			</div>
			<div class="step">${selectedCourse.courseTitle}</div>
			<div class="step">
				<a href="<%=contextPath%>/test/${selectedCourse.id}/do-test-page/show-history-all-test" class="his-result-btn">
					<span class="his-result-span">History Test Result</span>
				</a>
				<a href="<%=contextPath%>" class="btnBack">Back</a>
			</div>
			
		</div>
	</header>
	
	<section>
		<div class="left-section">
			<div class="video-container">
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<c:forEach items="${selectedCourse.sectionLessonMap}" var="section" varStatus="sectionIndex">
						  		<c:forEach items="${section.getValue()}" var="lesson" varStatus="lessonIndex">
							  			<c:choose>
							  				<c:when test="${sectionIndex.count eq 1 && lessonIndex.count eq 1}">
											    <li id="index${sectionIndex.count}${lessonIndex.count}" data-target="#carouselExampleIndicators" data-slide-to="<%=i%>" class="active"></li>
							  				</c:when>
							  				<c:otherwise>
							  					<li id="index${sectionIndex.count}${lessonIndex.count}" data-target="#carouselExampleIndicators" data-slide-to="<%=i%>"></li>
							  				</c:otherwise>
							  			</c:choose>
							  			<%++i;%>
						  		</c:forEach>
						</c:forEach>
					</ol>
					
				  <div class="carousel-inner">
					  <c:forEach items="${selectedCourse.sectionLessonMap}" var="section" varStatus="sectionIndex">
					  		<c:forEach items="${section.getValue()}" var="lesson" varStatus="lessonIndex">
					  			<c:choose>
					  				<c:when test="${sectionIndex.count eq 1 && lessonIndex.count eq 1}">
					  						<div class="carousel-item active">
					  							<c:choose>
					  								<c:when test="${lesson.urlVid eq null}">
					  									<p>Attention: This part of the course has nothing to show right now.</p>
					  								</c:when>
					  								<c:otherwise>
					  									<video id="video${sectionIndex.count}${lessonIndex.count}" controls autoplay>
									  						<source src="<%=contextPath%>/resources/videos/upload/${lesson.urlVid}" type="video/mp4">
														</video>
														
														
														
					  								</c:otherwise>
					  							</c:choose>
					   	 					</div>
					  				</c:when>
					  				<c:otherwise>
					  						<div class="carousel-item">
					  							<c:choose>
					  								<c:when test="${lesson.urlVid eq null}">
					  									<p>Attention: This part of the course has nothing to show right now.</p>
					  								</c:when>
					  								<c:otherwise>
					  									<video id="video${sectionIndex.count}${lessonIndex.count}" controls>
									  						<source src="<%=contextPath%>/resources/videos/upload/${lesson.urlVid}" type="video/mp4">
														</video>
														
					  								</c:otherwise>
					  							</c:choose>
					   	 					</div>
					  				</c:otherwise>
					  			</c:choose>
					  		</c:forEach>
					  </c:forEach>
				  </div>
				  
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
			
			<div class="sub-menu">
				<ul>
					<li><a href="#">Overview</a></li>
					<li><a href="#">Notes</a></li>
					<li><a href="#">Announcements</a></li>
				</ul>
			</div>
			
			<div class="course-info-container">
				<div>
					<h3>About this course</h3>
				</div>
				
				<div>
					<span>By the numbers</span>
					<div class="info">
						<p>Course level: ${selectedCourse.courseLevel.levelName}</p>
						<p>Students: ${selectedCourse.numStudent}</p>
						<p>Languages: ${selectedCourse.language}</p>
						<p>Lectures: <%=i%></p>
					</div>					
				</div>
				
				<div>
					<span>Description</span>
					<div class="info">${selectedCourse.description}</div>
				</div>
				
				<div>
					<span class="instructor">Instructor</span>
					<div class="info">
						<div class="user-image-area">
							<div>
								<img alt="" src="<%=contextPath%>/resources/images/${selectedCourse.user.getUrlimg()}">
							</div>
							
							<div>
								<span>${selectedCourse.user.getFullname()}</span> <br>
								<span>${selectedCourse.user.getHeadLine()}</span>
							</div>
						</div>
						<div>${selectedCourse.user.biography}</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="right-section">			
			<div id="accordion">
			
				<div class="card">
				  	 <div class="card-header" id="headingOne">
					      <h5 class="mb">
					        <button class="btn btn-link" data-toggle="collapse" aria-expanded="true">
					          Course content
					        </button>
					      </h5>
				   	 </div>
				 </div>
				 
				 <c:forEach items="${selectedCourse.sectionLessonMap}" var="section" varStatus="sectionIndex">
			 		<div class="card">
			   			 <div class="card-header" id="headingOne">
						      <h5 class="mb-0">
						        <button class="btn btn-link" data-toggle="collapse" data-target="#${sectionIndex.count}" aria-expanded="true" aria-controls="${sectionIndex.count}">
						         ${section.getKey().getTitle()}
						        </button>
						      </h5>
			    		</div>
			
					    <div id="${sectionIndex.count}" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
						      <c:forEach items="${section.getValue()}" var="lesson" varStatus="lessonIndex">
						      		<a href="#" onclick="runVideo(${sectionIndex.count}${lessonIndex.count})">
						      			<div class="card-body">
							      			<div class="left">
							      				<!-- <input type="checkbox"> -->
							      			</div>
							      			
							      			<div class="right">
							      				${lessonIndex.count}. ${lesson.getTitle()} <br/>
							        			<i class="fa fa-play-circle"></i>
							        			<span class="videoDuration">${lesson.videoDuration} mins</span>
							      			</div>
						      			</div>
						      		</a>
						      </c:forEach>
						      
						          <c:forEach items="${selectedCourse.sectionTestMap}" var="section1">
								    	<c:choose>
								    		<c:when test="${section1.getKey().getId() eq section.getKey().getId()}">
								    				<c:forEach items="${section1.getValue()}" var="test" varStatus="testIndex">
								    					<a href="#" onclick="">
											      			<div class="card-body">
												      			<div class="left">
												      				<!-- <input type="checkbox"> -->
												      			</div>
												      			
												      			<div class="right">
												      				<!-- // Huy -->
												      				<a href="<%=contextPath%>/test/do-test-page/${test.getId()}/${test.getTime()}/"><span style="color: #5e0606;font-size: 12px;font-weight: bold;" >Test NO.${testIndex.count}:  </span> ${test.getTitle()}</a> <br/>
												        			<!-- <i class="fa fa-play-circle"></i> -->
												        			<%-- <span class="videoDuration">${lesson.videoDuration} mins</span> --%>
												      			</div>
											      			</div>
									      				</a>
								    				</c:forEach>
								    		</c:when>
								    	</c:choose>
					   			 </c:forEach>
					    </div>
					
				  	</div>
				 </c:forEach>
			</div>
		</div>
	</section>
</body>
<style>
.his-result-btn{
	padding: 6px 12px;
	padding-bottom:10px;
	background: #c22727;
	border-radius: 8px;
	letter-spacing: 1px;
	
}

.his-result-btn:hover{
	background: #db5353;	
	}
	
.his-result-span{
font-size: 16px;
	font-family: cursive;
	color: #fff;
}	
		
</style>

<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>

<script type="text/javascript">
	function runVideo(index){
		 var slide = document.getElementById('index' + index);
		 var video = document.getElementById('video' + index);
		 
		 slide.click();
		 video.autoplay = true;
		 video.load();
	}
	
	
</script>
</html>