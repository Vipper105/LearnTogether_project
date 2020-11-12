<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.Resultessayq"%>
<%@page import="tp.kits3.learntogether.user.vo.Instructor"%>
<%@page import="tp.kits3.learntogether.user.vo.Course"%>
<%@page import="tp.kits3.learntogether.user.vo.Section"%>
<%@page import="tp.kits3.learntogether.user.vo.Test"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="tp.kits3.learntogether.user.vo.EssayQuestion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
/**
 *  
 * @author: PhungDinhHuy
 * 
 */
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Online Courses - Anytime, Anywhere | Learntogether</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/show-test-not-mark.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/back_button.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<%
		List<Test> listTest = (ArrayList<Test>) request.getAttribute("listTestNotMarkedYet");
		User user=(User) request.getAttribute(Contansts.USER_LOGGED);
	
	%>

	<!-- hearder -->
	<jsp:include page="navigation_instructor.jsp"></jsp:include>
	<!-- //hearder -->

	<section>

		<div class="section-container">
			<h1 id="title-content">&#11088; List test is not marked yet</h1>
			<table>
				<tr>
					<th>Test Name</th>
					<th>Times do test</th>
					<th>Username</th>
				</tr>
					<% 
					if(listTest.size()>0){
					%>
				<%
				for (int i = 0; i < listTest.size(); i++) {
				%>

				<tr>
					<!-- show test for instructor mark -->
					<% 
					for(int j=0;j<1;j++){
					%>
					<td><a class="test-name" href="<%=contextPath %>/instructor/show-test-not-score-to-mark/<%=listTest.get(i).getId()%>/<%=listTest.get(i).getListResultessayq().get(j).getTimesDoTest() %>/<%=listTest.get(i).getListResultessayq().get(j).getUser().getId() %>/<%=listTest.get(i).getSectionid() %>/"><%=listTest.get(i).getTitle()%></a></td>
					<td><%=listTest.get(i).getListResultessayq().get(j).getTimesDoTest()%></td>
					<td><%=listTest.get(i).getListResultessayq().get(j).getUser().getUsername() %></td>
					<% 
					}
					%>
								
					<%
					}
					%>
					<%
					}else if(listTest.size()==0 || listTest==null){
					%>
					
					<td id="result-test-td" colspan="3"><p>Not have test</p></td>
				</tr>


				<%
					}
				%>
			</table>
			<div class="contain-back-btn" style="margin-top: 39px;">
			<a class="back-btn"  href="<%=contextPath %>/instructor/show-essay-not-marked"> Back </a>
			</div>
		</div>

	</section>

</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>


</html>
