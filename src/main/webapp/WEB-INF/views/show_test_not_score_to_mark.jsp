<%@page import="tp.kits3.learntogether.user.controller.QuestionController"%>
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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/instructor-dashboard.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/back_button.css">
	
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<%
		Test test=(Test) request.getAttribute("test");
	//	String attrErrorMark=(String)request.getAttribute("MARK_WRONG_SCORE");
	%>

	<!-- hearder -->
	<jsp:include page="navigation_instructor.jsp"></jsp:include>
	<!-- //hearder -->

	<section>
		<h1 style="color: skyblue;font-size: 25px;">Start get marked for student</h1>
		<div class="section-container">
			
	
			<form action="update-score-after-marked" id="" method="get">
			
			<div class="test-content">
				<% 
				List<EssayQuestion> listEssayQ=test.getListEssayQuestion();
				for(int i=0;i<listEssayQ.size();i++){
				%>
				<div class="question-content"">
				
				<p class="question-title">Question <%=i+1 %> :<%=listEssayQ.get(i).getTitle() %></p>
				
				<div class="mark-content">
					<span class="text-title">Result Test: </span><textarea id="text" name="" wrap="soft" class="result-test"
					readonly="readonly"><%= listEssayQ.get(i).getResultessayq().getUseranswer() %></textarea><br/><br/>
					
					<span class="text-title">Answer right: </span><textarea id="text" name="" wrap="soft" class="answer-test"
						readonly="readonly"><%= listEssayQ.get(i).getAnswerEssayq().getAnswercontent() %></textarea><br/><br/>
							
					<span class="text-title">Commment:</span> <textarea id="text" name="comment<%=i+1%>" wrap="soft" placeholder="Input comment.." class="comment"></textarea>
					<input class="score-value" onblur="checkScore(this.value,<%=i %>,<%=listEssayQ.get(i).getId() %>)" name="score<%=i+1 %>" type="number" placeholder="Input score.." style="width: 100px;height: 50px" required /> / <%=listEssayQ.get(i).getScore() %> points. 	
					<span class="error-mark-score"></span>
				</div>
				</div>
				<%  
				}
				%>
							
				<input id="submit-btn" type = "submit" value = "Submit" />
				
			</div>	
			
			<div class="contain-back-btn" >
				<a class="back-btn" href="<%=contextPath %>/instructor/show-essay-not-marked/<%=test.getId() %>"> Back </a>
			</div>
			
			<p style="color:red">${MARK_WRONG_SCORE}</p>
			
			 </form>
			

		</div>
	</section>

</body>

<script src="<%=contextPath%>/resources/js/check_score_value.js"></script>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>

<style>
.error-mark-score{
position: absolute;
bottom:-15px;
right: 90px;
color: red;
} 
 
.mark-content{
margin-left: 20px;
position: relative;
} 
 
.section-container{
	width: 80%;
} 

.text-title{
color: #95417B;
font-weight: 550;
}

.test-content{
background-color: #FFFFF2;
box-sizing: border-box;
padding: 20px;
position: relative;

}


.question-content{
margin-left:10px;
margin-bottom: 20px;
background-color: #FEFFDF;
box-sizing: border-box;
padding: 20px;

}

 
#submit-btn{
    width: 120px;
    cursor: pointer;
    position: absolute;
    left: 650px;
    height: 45px;
    font-size: 16px;
    letter-spacing: 1px;
    margin-top: 15px;

}

#submit-btn:hover{
background-color: #F78181;

}

.result-test{
margin-left:16px;
overflow:hidden; 
resize:none;
width: 600px;
height: 70px;
vertical-align: top;
}

.answer-test{
margin-left:5px;
overflow:hidden; 
resize:none;
width: 597px;
height: 70px;
vertical-align: top;

}

.comment{
margin-left:12px;
overflow:hidden; 
resize:none;
width: 598px;
height: 60px;
vertical-align: top;
}

.score-value{
margin-left: 20px;
}

.question-title{
color: red;
font-size: 18px;
font-weight: 800;
margin-bottom: 15px;
}
textarea#text:focus{
    outline-color: #652751;  
}

input#text:focus {
outline-color: red; 
}
</style>


</html>
