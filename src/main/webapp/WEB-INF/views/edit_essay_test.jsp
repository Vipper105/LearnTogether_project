
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.lang.Math"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tp.kits3.learntogether.user.vo.EssayQuestion"%>
<%@page import="tp.kits3.learntogether.user.vo.Test"%>
<!DOCTYPE html>

<%
/**
 * @author PhungDinhHuy
 *
 */
	String contextPath = request.getContextPath();
%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/edit-test-page.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/back_button.css">
<title>Online Course Learning</title>
</head>

<%
	Test test = (Test) request.getAttribute("test");
%>

<body>

	<div class="container">
	<p class="title" style="font-family: cursive;font-size: 32px;">Edit essay question</p>
	<p class="title"><span style="font-family: monospace;">Test name: </span> <%=test.getTitle() %></p>
	
	<!-- Header -->
	<jsp:include page="navigation_instructor.jsp"></jsp:include>
	<!-- //Header -->
	
		<div class="bg-form-1" style="width: 1100px;">
			<form action="update-essay-test" id="" method="post">
				
				<% 
				List<EssayQuestion> listEssayQ=test.getListEssayQuestion();
				for(int i=0;i<listEssayQ.size();i++){
				%>
				<div class="answer-content" style="padding: 18px 22px;">
				
				
				<span class="text">Question <%=i+1 %> : </span><textarea id="text" name="question<%=i+1 %>" wrap="soft" class="essayq-test"><%=listEssayQ.get(i).getTitle() %></textarea><br/><br/>
				
				<span class="text">Answer question: </span> <textarea id="text" name="answer-question<%=i+1 %>" wrap="soft" class="essayq-test-ans"><%= listEssayQ.get(i).getAnswerEssayq().getAnswercontent() %></textarea>
			
				<input name="score<%=i+1 %>" type="number" value="<%=listEssayQ.get(i).getScore() %>" style="width: 80px;height: 50px;text-align: center;" required /> points. 	
				
				</div>
				<%  
				}
				%>
				
				
				 <input class="update-value	" type = "submit" value = "Update question" />
			 </form>
			
			<div class="contain-back-btn">
				<a class="back-btn" href="<%=contextPath %>/instructor/edit-essay-test-page"> Back </a>
			</div>
	</section>
		
		</div>

	
		</div>		
	


</body>


<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html> 

