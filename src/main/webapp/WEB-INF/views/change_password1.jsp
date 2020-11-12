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
<body>
<%
			HttpSession ss = request.getSession();
	
			//String username = (String) session2.getAttribute(Contansts.USER_LOGGED);
			User user = (User) ss.getAttribute(Contansts.USER_LOGGED);
			if(user!=null){
		%>
		
		<% 
			}
		%>

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
    <main class="login-body bgr-main" data-vide-bg="resources/assets/img/200314 _Work Life_02_ 4k_059.mp4">
        <!-- Login Admin -->
        <form action="change-pwd" id="change-pwd-form" method="post">
            
            <div class="login-form" style="background: black;opacity: 0.7">
                <!-- logo-login -->
                <div class="logo-login">
                    <a href="index.html"><img src="resources/assets/img/logo/loder.png" alt=""></a>
                </div>
                <h2>Change Password</h2>
                <div class="form-input">
                     <label for="uname"><b>Username / Email</b></label>
				      <input type="text"
					placeholder="Enter Username/Email" name="uname"
					class="cancelForm" id="uname"
					onkeypress="return blockSpecialChacter(event)" value="<%=user.getUsername() %>" required>
					  
                </div>
                <div class="form-input">
                   <label for="old-password"><b>Old Password</b></label> 
                   <input type="password"
					placeholder="Enter Old Password" name="old-password"
					class="cancelForm" id="old-password"
					value="" required>
                    
                </div>
                
                <div class="form-input">
                   <label for="new-password"><b>New Password</b></label>  
                   <input type="password"
					placeholder="Enter New Password" name="new-password"
					class="cancelForm" id="new-psw"  required
					value="">
                   
                </div>
                <div class="form-input">
                   <label for="re-newpassword"><b>Re-New Password</b></label>  
                   <input type="password"
					placeholder="Enter Re New Password" name="re-new-password"
					class="cancelForm" id="re-psw" required
					value="">
                   
                </div>
                <div class="form-input pt-30">
                    <input type="submit" name="submit" value="Change password">
                    <!--  <button type="submit" id="btn">Login</button> -->
                </div>
				<p style="color: red">${CHANGE_PASSWORD_MSG}</p>
				
                <div>
			<a href="<%=contextPath%>/" style="margin-right: 20px">Index</a>
			<a href="<%=contextPath%>/login-page">Login</a>
		</div>
                
     
               
            </div>
        </form>
   
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
<style>
	b{
		color: white
	}
</style>
</html>