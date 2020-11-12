<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="tp.kits3.learntogether.user.vo.Test"%>
<%@page import="tp.kits3.learntogether.user.vo.MultichoiceQuestion"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math"%>

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
	 String contextPath=request.getContextPath();
	Test test=(Test)request.getAttribute("testObj");
	 
	//List<MultichoiceQuestion> listQuestionByTestID=(List<MultichoiceQuestion>) request.getAttribute("listQuestionByTestID");
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/do_test_page.css">
</head>
<body>

		<p class="title">Do multichoice test</p>
		<p class="test-name"> <span class="test-span">Test name :</span><%= test.getTitle() %></p>
		<div style="text-align: center;">
		<span class="time-name">Times :</span><p class="timer-count" id="timer" style="color: red;font-size: 30px;"></p>
		</div>
	<div class="container">
		
	
		<!-- show từ DB lên => sử dụng set đối tượng và list -->
		<form action="submit-multichoice-test" id="" method="get" name="resultMultiq-form">
		
		<% 
		int k=0;
		int temp=0;
		double score=test.getScore();
		int numQuestion=test.getListQuestionMultichoice().size();
		double average=(double)Math.round((score/numQuestion)*100)/100;
		double resultScore=0;
		
		for(int i=1;i<=numQuestion;i++){
			String questionContent=test.getListQuestionMultichoice().get(i-1).getTitle();
		%>
		<div style="margin-bottom: 8px;">	
		<span style="font-weight: bold;font-size: 20px;font-family: cursive;color:#5e0655; ">Question <%=i %> (<%=average %> points) :</span>  <span style="font-size: 16px;font-weight: bold;"><%=questionContent %></span>
			
			<% 
			MultichoiceQuestion mulQuestion=test.getListQuestionMultichoice().get(i-1);
			int numAnswer=test.getListQuestionMultichoice().get(i-1).getListAnswer().size();
			for(int j=1;j<=numAnswer;j++){
				k=k+j;
				String contentAnswer=test.getListQuestionMultichoice().get(i-1).getListAnswer().get(j-1).getAnswercontent();
				// bỏ sau khi test xong
				boolean isCorrect=test.getListQuestionMultichoice().get(i-1).getListAnswer().get(j-1).getIscorrect();
			%>
				
				 <div>
					 <input type="checkbox" class="ans-cb" name="answer-cb" value="<%=temp++%>" id="<%=k %>">
					 <label for="<%=k %>"> <%=(char)(j-1+65) %>. <%=contentAnswer %> / <%=isCorrect %></label><br>				 
				</div>
			
			<% 
			
			}
			%>
		</div>
		<% 
		
		}
		%>
		<input type="hidden" value="${courseID}" name="courseID">
		<input id="submit-btn" type="submit" value="Submit">
	
	</div>
	
	</form>
	
<script src="<%=contextPath%>/resources/js/resultMultiq_form.js"></script>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script src="<%=contextPath%>/resources/js/time_countdown.js"></script>

<script type="text/javascript">
	function a(){
		 var element = document.getElementsByClassName('ans-cb');
		    if (element.checked) {
		        element.value = "1";
		    } else {
		        element.value = "0";
		    }
	}
	
	
	
	

</script>

</body>
</html>