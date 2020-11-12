<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="tp.kits3.learntogether.user.vo.Course"%>
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
<title>Online Courses - Anytime, Anywhere | Learntogether</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/instructor-dashboard.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>

<!-- hearder -->
<jsp:include page="../navigation_instructor.jsp"></jsp:include>
<!-- //hearder -->
	<c:choose>
		<c:when test="${deleteCourse ne null and deleteCourse eq 'successful'}">
 			<div class="alert alert-success alert-dismissible fade in">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Success!</strong> Your course has been deleted
			 </div>
		</c:when>
	</c:choose>
	
	
	<!--  <div class="alert alert-success alert-dismissible fade in">
	    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	   	<strong>Success!</strong> Your course has been deleted
	</div> -->
	
	
	<div class="instructor-header">
		<a href="<%=contextPath%>">Student</a>
		<img alt="" src="<%=contextPath%>/resources/images/${logginedUser.getUrlimg()}" />
	</div>
	<section>
		
		<div class="section-container">
			<h1>Courses</h1>
			<form action="../course/create/1" method="get">
				<div class="new-course-container">
					<div class="search-container">
						<input type="search" placeholder="Search your courses">
						<i class="fa fa-search"></i>
					</div>
				<input type="submit" value="New course">
				</div>
				
			</form>
			
			<div class="draft-courses-container">
				<c:choose>
					<c:when test="${draftList.size() eq 0}">
						<div class="no-data">There is no data</div>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${draftList}" var="course">
							<%++i;%>
							<div class="item item<%=i%>">
								<div class="draft-container">
									<img class="draft-image" alt="" src="<%=contextPath%>/resources/images/upload/${course.urlImg}">
									<div class="draft-content">
										<div class="area1">
											<h3>${course.getCourseTitle()}</h3>
											<span class="status">draft</span>
											<span class="public">public</span>
										</div>
										<div class="area2">Finish your course</div>
									</div>
								</div>
							
								<div class="hover">
									<a href="<%=contextPath%>/instructor/course/${course.getId()}/manage/basics">Edit / manage course</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		
	</section>
	
	<footer>
	</footer>
</body>

<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script type="text/javascript">    
	window.onload = function(){
		  var draftCoursesContainer = document.querySelectorAll('.draft-courses-container > div');
		    for(var i=0; i < draftCoursesContainer.length; ++i){
		        var draftContainer = draftCoursesContainer.item(i);
		        draftContainer.style.position = "relative"; 
		    }
	}
	
    function visibleContinueBtn(element){
        element.disabled = false;
        element.style.backgroundColor = "red";
    }
    
</script>
</html>