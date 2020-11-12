<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Link css -->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/change_pwd.css">

</head>
<body>

		<%
			HttpSession ss = request.getSession();
	
			//String username = (String) session2.getAttribute(Contansts.USER_LOGGED);
			User user = (User) ss.getAttribute(Contansts.USER_LOGGED);
			if(user!=null){
		%>
		<p>Username:  <span style="color: red;text-decoration: underline; " ><%=user.getUsername() %></span> </p>
		<% 
			}
		%>

<div style="width: 500px;">
		<form action="change-pwd" id="change-pwd-form" method="post">
			<div class="imgcontainer">
				<img src="<%=contextPath%>/resources/images/icon-login.png"
					alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="uname"><b>Username / Email</b></label> 
				<input type="text"
					placeholder="Enter Username/Email" name="uname"
					class="cancelForm" id="uname"
					onkeypress="return blockSpecialChacter(event)" value="<%=user.getUsername() %>" required>
					
				<!--   -->
				
				<label for="old-password"><b>Old Password</b></label> 
				<input type="password"
					placeholder="Enter Old Password" name="old-password"
					class="cancelForm" id="old-password"
					value="" required>
				
				<label for="new-password"><b>New Password</b></label> 
				<input type="password"
					placeholder="Enter New Password" name="new-password"
					class="cancelForm" id="new-psw"  required
					value="">
					
				<label for="re-newpassword"><b>Re-New Password</b></label> 
				<input type="password"
					placeholder="Enter Re New Password" name="re-new-password"
					class="cancelForm" id="re-psw" required
					value="">	
				<!--   -->
				<p style="color: red">${CHANGE_PASSWORD_MSG}</p>
				<button type="submit">Change password</button>

			</div>
			
			<p id="changepwd-err-msg" style="color: red;"></p>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button" class="cancelbtn" onclick="cancelForm()">Cancel</button>
			</div>
		</form>

		<div>
			<a href="<%=contextPath%>/">Index</a>
			<a href="<%=contextPath%>/login-page">Login</a>
		</div>


	</div>

	<script src="<%=contextPath%>/resources/js/change_pwd_form.js"></script>

</body>
</html>