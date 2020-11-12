<%@page import="tp.kits3.learntogether.user.vo.AnswerMultichoiceq"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.lang.Math"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tp.kits3.learntogether.user.vo.Test"%>
<%@page import="tp.kits3.learntogether.user.vo.MultichoiceQuestion" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Insert title here</title>
</head>

<%
	Test test = (Test) request.getAttribute("test");
	
%>

<body>

	<jsp:include page="navigation_instructor.jsp"></jsp:include>

	<div class="container">
	<p class="title" style="font-family: cursive;font-size: 32px;">Edit multichoice question</p>
	<p class="title"><span style="font-family: monospace;">Test name: </span> <%=test.getTitle() %></p>
	
	
	
		<div class="bg-form-1">
			<form action="update-multichoice-test" method="post">
			<%
			
			int k=0;
			int question_size=test.getListQuestionMultichoice().size();
			List<MultichoiceQuestion> listQuestion=test.getListQuestionMultichoice();
			double scoreEachQuestion=0	;
			for (int i = 0; i < question_size; i++) {
				scoreEachQuestion=(double)Math.round((test.getScore()/test.getNumquestion())*100)/100;
			%>
				<div class="content-answer">
				<h5 class="question-title">Question <%=i+1 %> : <%=scoreEachQuestion %> points</h5>
				<input class="multiq-test" type="text" name="question-content<%=i+1 %>" value="<%=listQuestion.get(i).getTitle() %>" required="required"><br/>
				<% 
				List<AnswerMultichoiceq> listAnswer=listQuestion.get(i).getListAnswer();
				for(int j=1;j<=listAnswer.size();j++){
					k++;
				%>
				
				<c:set var="val" value="<%=listAnswer.get(j-1).getIscorrect() %>" />
					<c:choose>
						<c:when test="${val == true}">
						<%= (char)(j-1+65) %>. <input type="text" class="answer-input" name="answer-content<%=k %>" value="<%=listAnswer.get(j-1).getAnswercontent() %>" required="required" >
						<input class="radio-btn" type="radio" id="correct" name="isCorrect<%=k %>"  value="true"  required="required" checked="checked">correct
						<input class="radio-btn" type="radio" id="wrong" name="isCorrect<%=k %>" value="false" required="required" >wrong
						<br/>
						</c:when>
					
						<c:otherwise>
							<%= (char)(j-1+65) %>. <input class="answer-input" type="text" name="answer-content<%=k %>" value="<%=listAnswer.get(j-1).getAnswercontent() %>" required="required" >
							<input class="radio-btn" type="radio" id="correct" name="isCorrect<%=k %>" value="true" required="required">correct
							<input class="radio-btn" type="radio" id="wrong" name="isCorrect<%=k %>" value="false" required="required" checked="checked">wrong
							<br/>
						</c:otherwise>
					
					</c:choose>
				<% 
				}
				%>

				</div>
			<%
			}
			%>	
				<div class="content-submit">
				<input class="update-value" type="submit" name="add-question" value="Update questions">	
				<button type="reset" class="cancelbtn">Cancel</button>
				</div>
			</form>
			
			<div class="contain-back-btn">
				<a class="back-btn" href="<%=contextPath %>/instructor/edit-multichoice-test-page"> Back </a>
			</div>
		
		</div>

	
		</div>


</body>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>