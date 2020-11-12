<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> App landing</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

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
</head>
<body>
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
    <!-- Preloader Start-->


<!-- Register -->

<main class="login-body" data-vide-bg="resources/assets/img/200314 _Work Life_02_ 4k_059.mp4">
    <!-- Login Admin -->
    <form class="form-default" method="POST" action="register" id="register-form">
        
        <div class="login-form" style="background: black;opacity: 0.7">
            <!-- logo-login -->
            <div class="logo-login">
                <a href="/learntogether/"><img src="resources/assets/img/logo/loder.png" alt=""></a>
            </div>
            <h2>Registration Here</h2>

            <div class="form-input">
                <label for="re_fullname">Full name</label>
                <input type="text" required id="re_fullname" placeholder="Enter Fullname" name="fullname" class="cancelFormRe" onkeypress="return blockSpecialChacter(event)">
            	<p id="error-fullname" style="color: orange;"></p>
            </div>
            <div class="form-input">
                <label for="re_email">Email Address</label>
                <input type="email" required id="re_email" placeholder="Enter Email" name="email" class="cancelFormRe" 
			    onkeypress="return blockSpecialChacter(event)" onblur="checkEmailExisted(this.value)">
			    <p id="error-email" style="color: orange;margin: 5px 0"></p>
            </div>
            <div class="form-input">
                <label for="re_uname">Username</label>
                <input type="text" required id="re_uname" placeholder="Enter Username" name="username" class="cancelFormRe" 
				onkeypress="return blockSpecialChacter(event)" onblur="checkUserExisted(this.value)">
				<p id="error-uname" style="color: orange;margin: 5px 0"></p>
            </div>
            <div class="form-input">
                <label for="re_password">Password</label>
                <input type="password" required id="re_password" placeholder="Enter Password" name="password" class="cancelFormRe">
                <p id="error-message" style="color: orange;margin: 5px 0"></p>
            </div>
            <p style="color: red;margin: 5px 0"><%=result_register %></p>
            <div class="form-input pt-30">
                <input type="submit" name="submit" value="Registration">
                <!-- <button type="submit" id="re_submit">Register</button> -->
            </div>
            <!-- Forget Password -->
            <a href="<%=contextPath%>/login-page" class="registration">Login</a>
            <button type="button" class="cancelbtn" onclick="cancelFormRegister()" style="color:black">Cancel</button>
        </div>
        
    </form>
    <!-- /end login form -->
</main>


    <script src="resources//assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="resources/assets/js/popper.min.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="resources/assets/js/jquery.slicknav.min.js"></script>

    <!-- Video bg -->
    <script src="resources/assets/js/jquery.vide.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="resources/assets/js/owl.carousel.min.js"></script>
    <script src="resources/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="resources/assets/js/wow.min.js"></script>
    <script src="resources/assets/js/animated.headline.js"></script>
    <script src="resources/assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="resources/assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="resources/assets/js/jquery.nice-select.min.js"></script>
    <script src="resources/assets/js/jquery.sticky.js"></script>
    <!-- Progress -->
    <script src="resources/assets/js/jquery.barfiller.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="resources/assets/js/jquery.counterup.min.js"></script>
    <script src="resources/assets/js/waypoints.min.js"></script>
    <script src="resources/assets/js/jquery.countdown.min.js"></script>
    <script src="resources/assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="resources/assets/js/contact.js"></script>
    <script src="resources/assets/js/jquery.form.js"></script>
    <script src="resources/assets/js/jquery.validate.min.js"></script>
    <script src="resources/assets/js/mail-script.js"></script>
    <script src="resources/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="resources/assets/js/plugins.js"></script>
    <script src="resources/assets/js/main.js"></script>
    <script src="<%=contextPath%>/resources/js/custom.js"></script>
<script src="<%=contextPath%>/resources/js/register_form.js"></script>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
    </body>
</html>