<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String contextPath = request.getContextPath();
	int i = 0; 
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/course-overview.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<header>
	
	</header>
	
	
	<section>
		<div class="section-header">
			<h2>Complete Linux Bash Shell Scripting with Real Life Examples</h2>
			<p>(1,180 ratings) 10,016 students</p>
			<div>
				<img alt="" src="">
				<span>Created by</span>
			</div>
			<div>
				<span>Last updated 5/2020</span>
				<span>English</span>
			</div>
			<div>
				<button>
					Wishlist
					<!-- <span>Wishlist</span>
					<svg id="icon-wishlisted" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32c-5.15-4.67-8.55-7.75-8.55-11.53 0-3.080 2.42-5.5 5.5-5.5 1.74 0 3.41 0.81 4.5 2.090 1.090-1.28 2.76-2.090 4.5-2.090 3.080 0 5.5 2.42 5.5 5.5 0 3.78-3.4 6.86-8.55 11.54l-1.45 1.31z"></path></svg> -->
				</button>
				<button>Share</button>
				<button>Gift this course</button>
			</div>
		</div>
		
		<div class="section-content">
			<div class="course-description">
				<h4>Description</h4>
				<p>Ghi vai dong cho du</p>
			</div>
			
			<div class="course-content">
				<h4>Course content</h4>
					<div>
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
							        <button class="btn btn-link" data-toggle="collapse" data-target="#${sectionIndex.count}" aria-expanded="true" aria-controls="collapseOne">
							        	<div class="section-left">
							        		${section.getKey().getTitle()}
							        	</div>
							        	
							        	<div class="section-right">
							        		${section.getValue().size()}
							        		<c:choose>
						      					<c:when test="${section.getValue().size() eq 1}">
						      						<span> lecture</span>
						      					</c:when>
						      					<c:otherwise>
						      						<span> lectures</span>
						      					</c:otherwise>
								      		</c:choose>
							        	</div>
							        </button>
							      </h5>
				    		</div>
				
						    <div id="${sectionIndex.count}" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
							      <c:forEach items="${section.getValue()}" var="lesson" varStatus="lessonIndex">
							      		<a href="#" onclick="runVideo(${sectionIndex.count}${lessonIndex.count})">
							      			<div class="card-body">
								      			<div class="lesson-left">
								      				<i class="fa fa-play-circle"></i>
								      				<span>${lesson.title} lecture</span>
								      			</div>
								      			
								      			<div class="lesson-right">
								        			
								        			<span class="videoDuration">${lesson.videoDuration} mins</span>
								      			</div>
							      			</div>
							      		</a>
							      </c:forEach>
						    </div>
					  	</div>
					 </c:forEach>
				</div>
			</div>
		</div>
		

	</section>
	
	
	
	
	<footer>
	
	</footer>
</body>
</html>