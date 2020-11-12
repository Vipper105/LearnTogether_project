<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% 
/**
 * @author PhungDinhHuy
 *
 */
String contextPath=request.getContextPath(); %>

<% 
String result_register=(String)request.getAttribute(Contansts.ATTR_REGISTER);
if(result_register==null){
	result_register="";
}else{
	result_register=(String)request.getAttribute(Contansts.ATTR_REGISTER);
}
%>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="<%=contextPath%>/resources/css/register.css">
</head>
<body>

	<div style="width: 600px;">
	
		<form action="register" method="post" id="register-form">
			<div class="imgcontainer">
				<img src="<%=contextPath%>/resources/images/icon-register.png" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="re_fullname"><b>Full Name</b></label> 
				<input type="text" required id="re_fullname" placeholder="Enter Fullname" name="fullname" class="cancelFormRe" onkeypress="return blockSpecialChacter(event)" > 
				 <p id="error-fullname"></p>
				 
				<label for="re_email"><b>Email</b></label>
			    <input type="email" required id="re_email" placeholder="Enter Email" name="email" class="cancelFormRe" 
			    onkeypress="return blockSpecialChacter(event)" onblur="checkEmailExisted(this.value)"> 
			    <p id="error-email"></p>
			    
			    <label for="re_uname"><b>Username</b></label> 
				<input type="text" required id="re_uname" placeholder="Enter Username" name="username" class="cancelFormRe" 
				onkeypress="return blockSpecialChacter(event)" onblur="checkUserExisted(this.value)"> 
				<p id="error-uname"></p>
				
				<label for="re_password"><b>Password</b></label> 
				<input type="password" required id="re_password" placeholder="Enter Password" name="password" class="cancelFormRe" >
				
				<p id="error-message"></p>
				
				<p style="color: red;"><%=result_register %></p>
				
				<button type="submit" id="re_submit">Register</button>
						 
			</div>
			

			<div class="container" style="background-color: #f1f1f1">
				<button type="button" class="cancelbtn" onclick="cancelFormRegister()">Cancel</button>
				
			</div>
			
		</form>
		<a href="<%=contextPath%>/login-page">Login</a> <br/>
		<a href="<%=contextPath%>/">Home page</a> <br/>

	</div>

<script src="<%=contextPath%>/resources/js/custom.js"></script>
<script src="<%=contextPath%>/resources/js/register_form.js"></script>

</body>
</html>