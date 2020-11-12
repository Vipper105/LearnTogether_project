<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/create2.css">
</head>
<body>
	<header>
		<div class="header-container">
			<div class="logo">
				<img alt="" src="<%=contextPath%>/resources/images/logo.png">
			</div>
			<div class="step">Step 2 of 3</div>
			<a href="<%=contextPath%>/instructor/courses" class="exit">Exit</a>
		</div>
		<div class="progress">
			<div class="inprogress"></div>
			<div class="not-started"></div>
		</div>
	</header>

	<form action="3" method="get">
		<section>
			<h1>How about a working title?</h1>
			<p>It's ok if you can't think of a good title now. You can change
				it later.</p>

			<div class="section-container">
				<input type="text" name="courseTitle"
					placeholder="e.g. Learn Photoshop CS6 from Scratch" maxlength="60"
					onkeyup="textCounter(this, 'counter', 60)" />
				<div class="counter" id="counter">60</div>
			</div>
		</section>

		<footer>
			<div class="footer-container">
				<input type="submit" name="action" value="Previous" id="previousBtn"
				class="btn"> <input type="submit" name="action"
				value="Continue" id="continueBtn" class="btn" disabled="disabled">
			</div>
		</footer>
	</form>
</body>

<script>
	function textCounter(field, counter, maxLimit) {
		var countField = document.getElementById(counter);
		if (field.value.length > maxLimit) {
			field.value = field.value.substring(0, maxLimit);
			return false;
		} else {
			countField.innerHTML = maxLimit - field.value.length;
			visibleContinueBtn();
		}

		if (field.value.length == 0) {
			disableContinueBtn();
		}
	}

	function visibleContinueBtn() {
		var continueBtn = document.getElementById('continueBtn');
		continueBtn.disabled = false;
		continueBtn.style.backgroundColor = "#ec5252";
		continueBtn.style.color = "#fff";
		continueBtn.style.cursor = "pointer";
	}

	function disableContinueBtn() {
		var continueBtn = document.getElementById('continueBtn');
		continueBtn.disabled = true;
		continueBtn.style.backgroundColor = "#f2f3f5";
		continueBtn.style.color = "#686f7a";
		continueBtn.style.cursor = "not-allowed";
	}
</script>
</html>