<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.Resultessayq"%>
<%@page import="tp.kits3.learntogether.user.vo.Instructor"%>
<%@page import="tp.kits3.learntogether.user.vo.Course"%>
<%@page import="tp.kits3.learntogether.user.vo.Section"%>
<%@page import="tp.kits3.learntogether.user.vo.Test"%>
<%@page import="tp.kits3.learntogether.user.vo.EssayQuestion"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	/**
	 * @author PhungDinhHuy
	 *
	 */
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Online Courses - Anytime, Anywhere | Learntogether</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/instructor-dashboard.css">
	<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/edit_test.css">	
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<%
		Instructor instructor = (Instructor) request.getAttribute("instructor-multichoice-test");
	%>

	<!-- hearder -->
	<jsp:include page="navigation_instructor.jsp"></jsp:include>
	<!-- //hearder -->

	<section>

		<div class="section-container">
			<h1 class="edit-title"><span style="font-size: 25px;margin-right: 3px;">&#128221;</span>Edit multichoice test</h1>
			<%
				List<Course> listCourse = instructor.getListCourse();

				for (int courseIndex = 0; courseIndex < listCourse.size(); courseIndex++) {
			%>
				<div class="container-course">
					<h1 style="color: #cc1616"><span style="font-size: 16px;margin-right: 3px;"> &#9889; </span><%=listCourse.get(courseIndex).getCourseTitle()%></h1>
					<div>
						<%
							List<Section> listSection = listCourse.get(courseIndex).getListSection();
							for (int sectionIndex = 0; sectionIndex < listSection.size(); sectionIndex++) {
						%>
							<h2 class="section-title"><%=listSection.get(sectionIndex).getTitle()%></h2>
							<div>
								<% 
								List<Test> listTest=listSection.get(sectionIndex).getListTest();
								for(int testIndex=0;testIndex<listTest.size();testIndex++){
								%>
								
								<h3><a class="test-title" href="<%=contextPath %>/instructor/edit-multichoice-test/<%=listTest.get(testIndex).getId() %>/">+ <%=listTest.get(testIndex).getTitle() %></a></h3>			
								
								<%
								}
								%>
								
							</div>
	
						<%
							}
						%>
	
					</div>
	
				</div>


			<%
				}
			%>



		</div>


	<footer> </footer>
</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>


</html>
