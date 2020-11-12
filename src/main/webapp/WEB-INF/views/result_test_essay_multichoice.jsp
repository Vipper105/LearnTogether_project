<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Math"%>
<%@page import="tp.kits3.learntogether.user.vo.TestResult"%>

<!DOCTYPE html>
<html>

<%
	/**
	 * @author PhungDinhHuy
	 *
	 */

	/* HttpSession httpSession = request.getSession();
	User user = (User) httpSession.getAttribute(Contansts.USER_LOGGED);
	 */

	 List<TestResult> listMultichoiceTest=(ArrayList<TestResult>)request.getAttribute("listMultichoice");
	 List<TestResult> listEssayTest=(ArrayList<TestResult>)request.getAttribute("listEssay");
	 String contextPath = request.getContextPath();
%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=contextPath %>/resources/css/customeIndex.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/back_button.css">
<title>Insert title here</title>
</head>
<body>
	
	<h1 class="title">Show all test result &#128076;</h1>
	<div class="container-table-result">
		<div class="result-table">
			<p class="title-2">Multichoice test</p>
			<table style="width:100%">
				  <tr>
				  	<th>NO. </th>
				    <th>Test Name</th>
				    <th>Test Type</th>
				    <th>Times Do Test</th>
				    <th>Question number</th>
				    <th>Score</th>
				  </tr>
				  
				  <% 
				  for(int i=0;i<listMultichoiceTest.size();i++){
					 double score=(double)(Math.round(listMultichoiceTest.get(i).getScore()*100))/100;
				  %>
				  <tr>
				  	<td><%=i+1 %></td>
				  	<td><%=listMultichoiceTest.get(i).getTest().getTitle() %></td>			    
				    <td><%=listMultichoiceTest.get(i).getTest().getTestType().getType() %></td>
				    <td><%=listMultichoiceTest.get(i).getTimesdotest() %></td>
				    <td><%=listMultichoiceTest.get(i).getTest().getNumquestion() %></td>
				    <td><%=score %></td>
				  </tr>
		  		 <% 
				  }
		  		 %>
			</table>
		</div>
	
		<div class="result-table">
			<p class="title-2">Essay test</p>
			<table style="width:100%">
				 <tr>
				  	<th>NO. </th>
				    <th>Test Name</th>
				    <th>Test Type</th>
				    <th>Times Do Test</th>
				    <th>Question number</th>
				    <th>Score</th>
				  </tr>
				   <% 
				  for(int i=0;i<listEssayTest.size();i++){
					  double score=(double)(Math.round(listEssayTest.get(i).getScore()*100))/100;
				  %>
				  <tr>
				  	<td><%=i+1 %></td>
				  	<td><%=listEssayTest.get(i).getTest().getTitle() %></td>			    
				    <td><%=listEssayTest.get(i).getTest().getTestType().getType() %></td>
				    <td><%=listEssayTest.get(i).getTimesdotest() %></td>
				    <td><%=listEssayTest.get(i).getTest().getNumquestion() %></td>
				    <td><%=score %></td>
				  </tr>
		  		 <% 
				  }
		  		 %>
		  
			</table>		
		</div>
		
		<div class="contain-back-btn" style="margin-top: 50px;">
			<a class="back-btn" href="<%=contextPath %>/course/${courseId}/learn"> Back </a>
		</div>
	</div>
		

</body>
<style>
body{
background: #fbf5ff;
}

.container-table-result{
width: 1096px;
margin: auto;
}

table{
border: 1px solid black;
box-shadow: 5px 5px 8px #888888;
}	

tr:nth-child(even){
background: #fff;
}

tr:nth-child(odd){
background: #ddd;
}

tr:nth-child(1){
background: #52143e;
color: #fff;
}

tr th{
padding: 5px 0;
}

tr td{
text-align: center;
}

.title{
 font-family: cursive;
 text-align: center;
 color: #52143e;
}

.title-2{
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 7px;
	color: #52143e;
	text-align: center;
	
}

.result-table{
	margin-bottom: 30px;
}
	
	
</style>

<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>