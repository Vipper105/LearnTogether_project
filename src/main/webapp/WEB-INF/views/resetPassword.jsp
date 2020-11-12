<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	/**
 * @author NguyenDoanNam
 *
 */
String contextPath = request.getContextPath();
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Reset Password</h1>
	<form action="<%=contextPath%>/setPass/${token}" id="register-form">
		<input id="re_password" name="password" type="text" placeholder="New pass">
		<p id="error-message"></p>
		<button type="submit" id="re_submit">Submit</button>
	</form>
</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script type="text/javascript"></script>
<script src="<%=contextPath%>/resources/js/custom.js"></script>
<script src="<%=contextPath%>/resources/js/register_form.js"></script>
</html>