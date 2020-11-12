<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	/**
	* 	@author: Diep Nguyen
	*/
%>

<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Courses - Anytime, Anywhere | Learntogether</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/create3.css">
</head>
<body>
	<header>
		<div class="header-container">
			<div class="logo">
				<img alt="" src="<%=contextPath%>/resources/images/logo.png">
			</div>
			<div class="step">Step 3 of 3</div>
			<a href="<%=contextPath%>/instructor/courses" class="exit">Exit</a>
		</div>
		<div class="progress">
			<div class="inprogress"></div>
			<div class="not-started"></div>
		</div>
	</header>

	<form action="../create-final" method="post">
		<section>
			<h1>What category best fits the knowledge you'll share?</h1>
			<p>If you're not sure about the right category, you can change it
				later.</p>
	
			<div class="section-container">
				<select name="categoryId">
					<option value="" disabled="disabled" selected="selected" hidden="hidden">Choose a category</option>
					<c:forEach items="${CategoryList}" var="cat">
						<option value="${cat.getId()}">${cat.getCategoryName()}</option>
					</c:forEach>
					<option value="-1">I don't know yet</option>
				</select>
			</div>
		</section>
	
		<footer>
			<div class="footer-container">
				<input type="submit" name="action" value="Previous" id="previousBtn" class="btn">
				<input type="submit" name="action" value="Continue" id="continueBtn" class="btn">
			</div>
			
		</footer>
	</form>
</body>

<script type="text/javascript">
function visibleContinueBtn(){
	var continueBtn = document.getElementById('continueBtn');
	continueBtn.disabled = true;
	continueBtn.style.backgroundColor = "#ec5252";
	continueBtn.style.color = "#fff";
}
</script>
</html>