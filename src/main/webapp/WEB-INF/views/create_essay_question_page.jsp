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
%>

<body>
	
		<p style="text-align: center;font-family: cursive;font-size: 30px;font-weight: bold;color:#5e0655 ">Create multichoice question</p>
		 <p style="font-size: 17px;text-align: center;margin-bottom: 30px"><span style="color: #5e0655 ;font-size: 18px;font-weight: bold;">Test name:</span> ${titleOfTest}</p>
		<div class="container">
			
			<form action="add-essay-question" method="get">
			<%
			for (int i = 0; i < numberQuestion; i++) {
			%>
				<div class="question">		
				
				<div style="height: 50px;">
				<span style="font-family: cursive;color:#5e0655 ">Question <%=i+1 %></span> :		
				<%-- <input type="text" name="question-content<%=i+1 %>" required="required" size="80" placeholder="Input question content..."> --%>
				
				<textarea autofocus class="q-content"  name="question-content<%=i+1 %>"  rows="2" cols="90" wrap="soft" placeholder="Input question content..."></textarea>
				
				<input class="points" type="text" name="points<%=i+1 %>" required="required" size="5" placeholder="points.." ><br/>
				</div>
				<textarea class="answer" placeholder="Input your answer..." id="text" name="answer-content<%=i+1 %>" wrap="soft"></textarea><br/><br/>
			
				
				</div>
				
			<%
			}
			%>
				<input class="btn" type="submit" name="add-question" value="Submit questions">	  
				<button class="btn" style="margin-left: 2px" type="reset" class="cancelbtn">Cancel</button>
			</form>
			
		
		</div>

</body>

<style>
.container{
margin-left: 420px;
box-shadow: 5px 5px 15px black;
width: 1024px;
padding: 30px 15px;
}

.points{
border: 1px solid green;
vertical-align: top;
height:30px;
}

.btn{
border: none;
background: #5e0655 ;
color: #fff;
padding: 8px 12px;
margin-left: 25px;
margin-bottom: 20px;
}

.btn:hover{
background: #7029B2;

}


.answer{
overflow:hidden; 
resize:none;
width: 800px;
height: 90px;" 
}

.q-content{
style="overflow:hidden; 
resize:none;
vertical-align: top;
}

.question{
padding:0px 80px;

width: 900px;
}

</style>

</html>