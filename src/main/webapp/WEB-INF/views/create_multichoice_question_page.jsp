<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.lang.Math"%>
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
<title>Insert title here</title>
</head>

<%
	int numberQuestion = (int) request.getAttribute("numberQuestion");
	int numberAnswerOfQuestion = (int) request.getAttribute("numberAnswerOfQuestion");
	double scoreOfTest = (double) request.getAttribute("scoreOfTest");
%>

<body>
	<div class="container">
	<p class="title-m">Create multichoice question</p>
	 <p style="font-size: 17px;text-align: center;margin-bottom: 30px"><span style="color: #5e0655 ;font-size: 18px;font-weight: bold;">Test name:</span> ${titleOfTest}</p>
	
		<div>
			<form action="add-multichoice-question" method="get">
			<%
			double scoreEachQuestion=(double)Math.round((scoreOfTest/numberQuestion)*100)/100;
			int k=0;
			for (int i = 0; i < numberQuestion; i++) {
			%>
			<div class="question-content">
				<span style="font-family: cursive;color: #5e0655;font-size: 18px; " >Question <%=i+1 %> (<%=scoreEachQuestion %> points ) :
				</span><input style="width: 90%;margin-bottom: 8px;margin-top: 5px" type="text" name="question-content<%=i+1 %>" required="required"><br/>
				<% 
				
				for(int j=1;j<=numberAnswerOfQuestion;j++){
					k=k+j;
				%>
				<%= (char)(j-1+65) %>. <input class="answer-in" type="text" name="answer-content<%=k %>" required="required" >
				<input type="radio" id="correct" name="isCorrect<%=k %>" value="1" required="required">correct
				<input type="radio" id="wrong" name="isCorrect<%=k %>" value="0" required="required">wrong
				<br/>
				
				<% 
				}
				%>
			</div>
			<%
			}
			%>
				<input class="btn" type="submit" name="add-question" value="Submit questions">	
				<button class="btn" type="reset" class="cancelbtn">Cancel</button>
			</form>
			
		
		</div>
	</div>
</body>

<style>
.container{
margin-left: 450px;
width: 800px;
padding: 50px 50px;
box-shadow: 5px 5px 15px black;
margin-top: 20px;
}

.title-m{
font-family: cursive;
color: #5e0655 ;
font-size: 30px;
font-weight: 700;
text-align: center;
}

.question-content{
margin-bottom: 18px;
}

.btn{
border: none;
background: #5e0655 ;
color: #fff;
padding: 6px 10px;

}

.btn:hover{
background: #7029B2;

}

.answer-in{
width: 70%;
}



</style>

</html>