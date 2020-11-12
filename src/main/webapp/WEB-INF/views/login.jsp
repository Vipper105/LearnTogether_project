<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	session="false" pageEncoding="UTF-8"%>

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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/login.css">

</head>
<body>



	<%
		Cookie[] cookies = request.getCookies();

		String username = "";
		String password = "";
		String remem = "";
		
		/*
		
		String checkboxValue = (String) request.getAttribute("stateCheckbox");
		if(checkboxValue==null){
			// when load page default value 1 (checked)
			checkboxValue="3";
		}else{
			checkboxValue=(String) request.getAttribute("stateCheckbox");
		}

		System.out.println(checkboxValue);
		
		*/
		
			if (cookies != null) {
				boolean isExistedCookie=false;
				
				for (Cookie cook : cookies) {

					/*	
					if (cook.getName().equals(Contansts.COOKIE_NAME)) {
						if (checkboxValue.equals("1")) {
							username = cook.getValue();
						} else if(checkboxValue.equals("2")){
							cook.setMaxAge(0);
							cook.setValue(null);
							response.addCookie(cook);
						}
					} else if (cook.getName().equals(Contansts.COOKIE_PASSWOD)) {
						//password = cook.getValue();

						if (checkboxValue.equals("1")) {
							password = (String) request.getAttribute("remember_pwd");
						} else if(checkboxValue.equals("2")){
							cook.setMaxAge(0);
							cook.setValue(null);
							response.addCookie(cook);
						}
					} else if (cook.getName().equals(Contansts.COOKIE_REMEMBER)) {
						if (cook.getValue().equals("1")) {
							remem = cook.getValue();
						} else {
							username = "";
							password = "";
							cook.setMaxAge(0);
							cook.setValue(null);
							response.addCookie(cook);

						}
					}
					*/
					
					if(cook.getName().equals(Contansts.COOKIE_REMEMBER)){
						isExistedCookie=true;
						remem=cook.getValue();
					}
					
				}
				 
				if(isExistedCookie){
					for(Cookie cook:cookies){
						if(cook.getName().equals(Contansts.COOKIE_NAME)){
							if(remem.equals("1")){
								username = cook.getValue();
								System.out.println(username);
							}else{
								//System.out.println("Delete cookie");
								cook.setMaxAge(0);
								cook.setValue(null);
								response.addCookie(cook);
							}
						}else if(cook.getName().equals(Contansts.COOKIE_PASSWOD)){
							if(remem.equals("1")){
							   password = cook.getValue();
							}else{
								cook.setMaxAge(0);
								cook.setValue(null);
								response.addCookie(cook);
							}
						}else if(cook.getName().equals(Contansts.COOKIE_PASSWOD)){
							if(remem.equals("1")){
								//remem = cook.getValue();
							}else{
								cook.setMaxAge(0);
								cook.setValue(null);
								response.addCookie(cook);
							}
						}
						
						
					}
					
				}
			}else{
				System.out.println("Cookie is not Existed");
				
			}
		
	%>
<!-- <h2>Modal Login Form</h2>
<button onclick="document.getElementById('show-form').style.display='block'" style="width:auto;" id="btn">Login</button> -->

<div id="show-form" class="modal" >
  <form class="modal-content animate cts-form" action="login" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('show-form').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="resources/assets/img/logo/login-img.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username/Email" name="uname"
					class="cancelForm disableCopyPaste" id="name"
					onkeypress="return blockSpecialChacter(event)" onclick='cancelForm'
					value="<%=username%>">
	  <p style="color: red;">${resultUserName}</p>
	  
     <label for="password"><b>Password</b></label> 
     <input type="password"
					placeholder="Enter Password" name="password"
					class="cancelForm disableCopyPaste" id="password"
					value="<%=password%>">
      <p style="color: red; text-align: center;">${resultLogin}</p>
      <button type="submit" id="btn">Login</button>
		<label> <input id="rb-checkbox" type="checkbox"
			name="remember" value="1" checked="checked" onclick="changeValue()" />
			Remember	
		</label>
    </div>
    
    <div class="container" style="background-color: #f1f1f1">
		<button type="button" class="cancelbtn" onclick="document.getElementById('show-form').style.display='none'">Cancel</button>
		<span class="psw"><a href="<%=contextPath%>/forgot-pwd-page">Forgot password?</a></span>
		<span class="rgt"><a href="<%=contextPath%>/register-page">Register</a></span>
	</div>
  </form>
  
	
</div>
	<script>
	// Get the modal
	    var modal = document.getElementById('show-form');
	
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	</script>
	<script src="<%=contextPath%>/resources/js/custom.js"></script>


</body>
</html>