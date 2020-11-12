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
	String contextPath2 = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Online Courses - Anytime, Anywhere | Learntogether</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=contextPath2%>/resources/css/instructor-dashboard.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<%
		/**
		 * @author PhungDinhHuy
		 *
		 */
	%>

	<header>
		 <div class="area"></div>
    
	    <nav class="main-menu">
		    <ul>
		        <li>
		            <a href="#">
		                <img class="fa fa-2x" alt="" src="<%=contextPath2%>/resources/images/icon-learntogether.png">
		                <!-- <i class="fa fa-home fa-2x"></i> -->
		                <span class="nav-text">
		                    Learn Together
		                </span>
		            </a>
		          
		        </li>
		        <li class="has-subnav">
		            <a href="<%=contextPath2 %>/instructor/courses">
		                <i class='fas fa-chalkboard-teacher fa fa-2x'></i>
		                <span class="nav-text">
		                    Course
		                </span>
		            </a>
		            
		        </li>
		       <!--  
		       <li>
		            <a href="#">
		                <i class="fa fa-bar-chart-o fa-2x"></i>
		                <span class="nav-text">
		                    Performance
		                </span>
		            </a>
		        </li> 
		        -->
		        
		        <%       
		        
		         // show list eassy test (essays not yet mark) 
		        %>
		        
		         <li>
		            <a href="<%=contextPath2%>/instructor/edit-multichoice-test-page">
		                <i class="fa fa-file-text fa-2x"></i>
		                <span class="nav-text">
		                    Edit multichoice test
		                </span>
		            </a>
		        </li>
		        
		         <li>
		            <a href="<%=contextPath2%>/instructor/edit-essay-test-page">
		                <i class="fa fa-file fa-2x"></i>
		                <span class="nav-text">
		                    Edit essay test 
		                </span>
		            </a>
		        </li>
		        
		         <li>
		            <a href="<%=contextPath2%>/instructor/show-essay-not-marked">
		                <i class="fa fa-pencil-square-o fa-2x"></i>
		                <span class="nav-text">
		                    Mark essay test 
		                </span>
		            </a>
		        </li>
		        
		        <li>
		            <a href="<%=contextPath2%>/">
		                <i class="fa fa-home fa-2x"></i>
		                <span class="nav-text">
		                    Home
		                </span>
		            </a>
		        </li>
		        
		        <% 
		     
		        %>
		    </ul>
		</nav>
	</header>

</body>


<style>
i {
padding-top: 6px;
}

.nav-text{
color: #ffffff;
}
</style>


</html>