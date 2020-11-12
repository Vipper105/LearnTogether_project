<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>

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

	String contextPath = request.getContextPath();
	// int courseIDx=(int)request.getAttribute("courseIDx");
%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=contextPath %>/resources/css/result_test.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/css/show_history.css">
<title>Insert title here</title>
</head>
<body>

	<div class="container-result">
		<p class="title">Congratulations on completing the test &#128076;</p>
		<p style="font-size: 19px;">Test score: <span style="font-size: 20px">${scoreTestResult}</span></p>
		<input class="btn" type="button" onclick="displayHistoryTest()"
			value="&#128073;History Test" >
			
		<input class="btn" type="button" onclick="displayShowHide()"
			value="&#128073;Show/Hide">	
		<br />
		<%--  <a href="<%=contextPath%>/test/do-test-page/show-history">Show test json</a><br/> --%>
		<a class="link-1" href="<%=contextPath %>/course/${courseIDx}/learn">&#128218;Return course content</a><br/>
		<a class="link-2" href="<%=contextPath %>/">&#127968;Return Home</a>
	
		<div id="show-his-test-mul">
			
		</div>
	
	</div>


	<script>
		var output = document.getElementById('show-his-test-mul');

		function displayHistoryTest() {

			var xhr = new XMLHttpRequest();
			var url = 'show-history-multichoice';

			xhr.open('GET', url);
			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					//output.innerHTML = xhr.responseText;
					var listHistory = JSON.parse(xhr.responseText); // JSON.parse() transform to Object Javascript, JSON.stringify() >< 
					showView(listHistory);
				}
			};

			xhr.send();
		}
		
		function showView(data) {
			
			
			let str = 
				    "<table class='tablestype'>"+			
					"<tr>"+
							"<th>Times Do Test</th>"+
							"<th>Test</th>"+
							"<th>Date Test</th>"+
							"<th>question number</th>"+
							"<th>score</th>"
			 		 "</tr>";

			for (i = 0; i < data.length; i++) {
				let convertTimeStampToData = convertDateTime(data[i].datetest);		
				str += 						
						"<tr>" +
						 	"<td>"+data[i].timesdotest+"</td>"+
						 	"<td>"+data[i].test.title+"</td>"+
						 	"<td>"+convertTimeStampToData+"</td>"+
						 	"<td>"+data[i].test.numquestion+"</td>"+
						 	"<td>"+Math.round(data[i].score*100)/100+"</td>"
						 	
						"</tr>"+"<br/>"
   						 
						"</table>";
			}
				output.innerHTML = str;
		} 
		
		
		function convertDateTime(data){
			  return new Date((data / 1000 + 25200) * 1000)
			    .toISOString()
			    .slice(0, 19)
			    .replace('T', ' ');
		}
		
		// show/hide
		function displayShowHide(){
			var x = document.getElementById("show-his-test-mul");
			  if (x.style.display === "none") {
			    x.style.display = "block";
			  } else {
			    x.style.display = "none";
			  }
		}
	</script>


</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>