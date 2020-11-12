
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
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> App landing</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--   <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="resources/assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="resources/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="resources/assets/css/gijgo.css">
    <link rel="stylesheet" href="resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="resources/assets/css/animated-headline.css">
    <link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="resources/assets/css/slick.css">
    <link rel="stylesheet" href="resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="resources/assets/css/style.css">
    <link rel="stylesheet" href="resources/assets/css/custom.css">
	<link rel="stylesheet" href="resources/assets/css/progressbar_barfiller.css">
	<link rel="stylesheet" href="resources/assets/css/animated-headline.css">

	<link rel="stylesheet" href="resources/css/customeIndex.css">
   
</head>
<style>
	/* .bgr-main{
		background-image: url(resources/assets/img/gallery/ocean.jpg);
		background-size: cover;
	} */
	.cl-white{color: #ffffff;}
	.cl-white b{color: #ffffff;}
	
</style>
<body style="background: black;opacity: 0.8">
	<!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="resources/assets/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
	<%
		Cookie[] cookies = request.getCookies();

		String username = "";
		String password = "";
		String remem = "";
		
		
			if (cookies != null) {
				boolean isExistedCookie=false;
				
				for (Cookie cook : cookies) {

					
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
	 
    
    <!-- Preloader Start-->
    <main class="login-body bgr-main" data-vide-bg="resources/assets/img/200314 _Work Life_02_ 4k_059.mp4">
        <!-- Login Admin -->
        <form class="form-default" action="login" method="post">
            
            <div class="login-form" style="background: black;opacity: 0.7">
                <!-- logo-login -->
                <div class="logo-login">
                    <a href="index.html"><img src="resources/assets/img/logo/loder.png" alt=""></a>
                </div>
                <h2>Login Here</h2>
                <div class="form-input">
                     <label for="uname" class="cl-white"><b>Username</b></label>
				      <input type="text" placeholder="Username/Email" name="uname"
									class="cancelForm disableCopyPaste" id="name"
									onkeypress="return blockSpecialChacter(event)" onclick='cancelForm'
									value="<%=username%>">
					  <p style="color: red;">${resultUserName}</p>
                </div>
                <div class="form-input">
                   <label for="password" class="cl-white"><b>Password</b></label> 
                   <input type="password" placeholder="Password" name="password" class="cancelForm disableCopyPaste" id="password" value="<%=password%>">
                    <p style="color: red; text-align: center;">${resultLogin}</p>
                </div>
                
                <div class="form-input pt-30">
                    <input type="submit" name="submit" value="Login">
                    <!--  <button type="submit" id="btn">Login</button> -->
                </div>
                <label class="cl-white"> <input id="rb-checkbox" type="checkbox"
						name="remember" value="1" checked="checked" onclick="changeValue()" />
						Remember	
				</label>
                
                <!-- Forget Password -->
                <a href="<%=contextPath%>/forgot-pwd-page" class="forget">Forget Password</a>
                <%-- <span class="psw forget">Forgot <a href="<%=contextPath%>/forgot-pwd-page">password?</a></span> --%>
                <!-- Forget Password -->
                <a href="<%=contextPath%>/register-page" class="registration">Registration</a>
                <%-- <span class="rgt"><a href="<%=contextPath%>/register-page">Register</a></span> --%>
            </div>
        </form>
        <!-- /end login form -->
    </main>
    
    <script src="./resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
    <script src="./resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
		<!-- Jquery Mobile Menu -->
    <script src="./resources/assets/js/jquery.slicknav.min.js"></script>

    <script src="./resources/assets/js/jquery.vide.js"></script>
	<!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
    <script src="./resources/assets/js/wow.min.js"></script>
    <script src="./resources/assets/js/animated.headline.js"></script>
    <script src="./resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
    <script src="./resources/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
    <script src="./resources/assets/js/jquery.nice-select.min.js"></script>
    <script src="./resources/assets/js/jquery.sticky.js"></script>
 	<!-- Progress -->
    <script src="./resources/assets/js/jquery.barfiller.js"></script>

   	<!-- counter , waypoint,Hover Direction -->
    <script src="./resources/assets/js/jquery.counterup.min.js"></script>
    <script src="./resources/assets/js/waypoints.min.js"></script>
    <script src="./resources/assets/js/jquery.countdown.min.js"></script>
    <script src="./resources/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
    <script src="./resources/assets/js/contact.js"></script>
    <script src="./resources/assets/js/jquery.form.js"></script>
    <script src="./resources/assets/js/jquery.validate.min.js"></script>
    <script src="./resources/assets/js/mail-script.js"></script>
    <script src="./resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->	
    <script src="./resources/assets/js/plugins.js"></script>
    <script src="./resources/assets/js/main.js"></script>
</body>
</html>