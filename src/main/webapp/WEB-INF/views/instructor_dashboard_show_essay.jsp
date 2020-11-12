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
	href="<%=contextPath%>/resources/css/instructor_dashboard_show_essay.css">

</head>
<body>
	<%
		Instructor instructor = (Instructor) request.getAttribute("instructor");
	%>

	<!-- hearder -->
	<jsp:include page="navigation_instructor.jsp"></jsp:include>
	<!-- //hearder -->

	<section>
		
		
		<div class="section-container">
			<div id="note-contain">
				<p style="text-decoration: underline;font-size: 19px;font-weight: 800;"><b>NOTE:</b></p>
				<p>&#x26D4; : Test need to be marked </p>
				<p>&#9989;  : Test is marked </p>
			</div>
		
			<h1 id="title-content"><span style="font-size: 35px;margin-right: 8px;">&#127891;</span>Show test not be marked</h1>
			<%
				List<Course> listCourse = instructor.getListCourse();

				for (int courseIndex = 0; courseIndex < listCourse.size(); courseIndex++) {
			%>
				<div class="contain-course">
					<h1 style="color: #cc1616"><span style="font-size: 16px;margin-right: 3px;">&#9889;</span>Course <%=courseIndex+1 %>: <%=listCourse.get(courseIndex).getCourseTitle()%></h1>
					<div>
						<%
							List<Section> listSection = listCourse.get(courseIndex).getListSection();
							for (int sectionIndex = 0; sectionIndex < listSection.size(); sectionIndex++) {
						%>
							<h2 class="section"> <%=listSection.get(sectionIndex).getTitle()%></h2>
							<div>
								<% 
								List<Test> listTest=listSection.get(sectionIndex).getListTest();
								for(int testIndex=0;testIndex<listTest.size();testIndex++){
								%>
									
									<% 
									if(listTest.get(testIndex).getTestType().getType().equalsIgnoreCase("Essay")){
										
									%>
									<div class="show-test">
										<% 
										if(listTest.get(testIndex).getListResultessayq()!=null){
										%>
											<h3 class="test-mark"><a class="title-test" href="<%=contextPath %>/instructor/show-essay-not-marked/<%=listTest.get(testIndex).getId() %>">+ <%=listTest.get(testIndex).getTitle() %> &#x26D4; </a><span class="essay-test">Essay Test</span>|<span class="mark-essay">Need to mark</span></h3>	
										<% 
										}else if(listTest.get(testIndex).getListResultessayq()==null){
										%>
											<h3 class="test-mark"><a class="title-test" href="<%=contextPath %>/instructor/show-essay-not-marked/<%=listTest.get(testIndex).getId() %>">+ <%=listTest.get(testIndex).getTitle() %> &#9989;</a><span class="essay-test">Essay Test</span></h3>									
										<% 
										}
										%>
										
									</div>
									
									<%
									} else if(listTest.get(testIndex).getTestType().getType().equalsIgnoreCase("Multichoice")){
									%>
									<div class="show-test">
									<h3 class="test-mark"><a class="title-test" href="<%=contextPath %>/instructor/show-essay-not-marked/<%=listTest.get(testIndex).getId() %>">+ <%=listTest.get(testIndex).getTitle() %> &#9989;</a><span class="multichoice-test"> Multichoice Test</span>|<span class="no-mark">Not mark</span></h3>
									</div>
									<%
									}
									%>
								<% 
								}
								%>
							
	
						<%
							}
						%>
	
					</div>
	
				</div>


			<%
				}
			%>

		</div>

		</div>

	</section>

	<footer> </footer>
</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</html>
