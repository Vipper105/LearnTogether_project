<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="tp.kits3.learntogether.user.vo.TestType"%>
<%@page import="tp.kits3.learntogether.user.vo.Section"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>



<!DOCTYPE html>
<html>

<%
	/**
	 * @author PhungDinhHuy
	 *
	 */
	HttpSession httpSession = request.getSession();
	User user = (User) httpSession.getAttribute(Contansts.USER_LOGGED);
	List<TestType> listTestType = (ArrayList<TestType>) request.getAttribute(Contansts.ATTR_ALL_TESTTYPE);
	List<Section> listSection = (ArrayList<Section>) request.getAttribute(Contansts.ATTR_ALL_SECTION);
	String contextPath=request.getContextPath();
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/create_test_page.css">
</head>
<body>

	<div class="container">
		<p class="create-test-title">Create Test page</p>
	
		<form action="create-test" method="get" id="creat-test-form">
			<span class="text">Test type : </span><br/><select class="input-text-select" class="" name="testType" id="select-testType"
				onblur="disableField()">
				<%
					for (int i = 0; i < listTestType.size(); i++) {
				%>
				<option value="<%=listTestType.get(i).getType()%>"><%=listTestType.get(i).getType()%></option>
				<%
					}
				%>
			</select><br /> 
			<span class="text">Title : </span><br/><input class="input-text" type="text" name="title" required><br />
			<span class="text">Number Question : </span><br/><input class="input-text" type="number" name="number-question" required><br />
			
			<div id="number-answers">
			<span class="text">Number Answer of Question : </span><br/><input class="input-text" type="number" name="number-answer" value="">
			</div> 
				
			<div id="score">
			<span class="text">Score : </span><br/><input class="input-text" type="number" name="score" value="0"><br />
			</div>	
			
			<%
				if (user != null) {
			%>
			<span class="text">Instructor name : </span><br/><input class="input-text" type="text" value="<%=user.getFullname()%>"
				required><br />
			<%
				} else {
			%>
			<span class="text">Instructor name : </span><br/><input class="input-text" type="text" value="" required><br />
	
			<%
				}
			%>
			<span class="text">Created date : </span><br/> <input class="input-text" type="date" name="createDate" required><br />
	
	
			<span class="text">Section : </span><br/> <select class="input-text-select" name="sectionID" id="">
				<%
					for (int i = 0; i < listSection.size(); i++) {
				%>
	
				<option value="<%=listSection.get(i).getId()%>"><%=listSection.get(i).getTitle()%></option>
	
				<%
					}
				%>
			</select> <br /> 
			
			<span class="text">Time (minutes) : </span><br/> <input class="input-text" type="number" value="" name="time" required>  <br />
			
			<input class="btn-submit" type="submit" value="Create test">
			
			
			
		</form>
	
	</div>


	<script>
	var creat_test_form=document.getElementById('creat-test-form');
	
		function disableField() {
			var x = document.getElementById("select-testType").value;
			var number_answers = document.getElementById("number-answers");
			var score = document.getElementById("score");	
	
			if (x == 'Essay') {
				number_answers.hidden = true;
				score.hidden = true;
			} else if (x == 'Multichoice') {
				number_answers.hidden = false;
				score.hidden = false;
			}		
		}
		
			
		/* creat_test_form.addEventListener('submit',function(event){
			
			if(score.value==null){
				score.required=true;
				
			}else{
				score.required=false;
				
			}
				
			event.preventDefault();
			
			
		}); */

		
	</script>


</body>
</html>