<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%
	String contextPath = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Courses | Education</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/slicknav.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="<%=contextPath %>/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/gijgo.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=contextPath %>/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/slick.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/style.css">
<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/custom.css">

</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<!--? slider Area Start-->
		<section class="slider-area slider-area2">
			<div class="slider-active">
				<!-- Single Slider -->
				<div class="single-slider slider-height2">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-11 col-md-12">
								<div class="hero__caption hero__caption2">
									<h1 data-animation="bounceIn" data-delay="0.2s">${selectedCourse.courseTitle }</h1>
									<!-- breadcrumb Start-->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="/learntogether/courses">Courses</a></li>
											<li class="breadcrumb-item"><a href="#">${selectedCourse.language }</a></li>
										</ol>
									</nav>
									<!-- breadcrumb End -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="services-area services-area2 section-padding40">
			<div class="container">
				<div class="row justify-content-sm-center">
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon">
								<img src="<%=contextPath %>/resources/assets/img/icon/icon1.svg" alt="">
							</div>
							<div class="features-caption">
								<h3>60+ UX courses</h3>
								<p>The automated process all your website tasks.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon">
								<img src="<%=contextPath %>/resources/assets/img/icon/icon2.svg" alt="">
							</div>
							<div class="features-caption">
								<h3>Expert instructors</h3>
								<p>The automated process all your website tasks.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon">
								<img src="<%=contextPath %>/resources/assets/img/icon/icon3.svg" alt="">
							</div>
							<div class="features-caption">
								<h3>Life time access</h3>
								<p>The automated process all your website tasks.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--? About Area-1 Start -->
		<section class="about-area1 fix pt-10">
			<div class="support-wrapper align-items-center">
				<div class="left-content1">
					<div class="about-icon">
						<img src="<%=contextPath %>/resources/assets/img/icon/about.svg" alt="">
					</div>
					<!-- section tittle -->
					<div class="section-tittle section-tittle2 mb-55">
						<div class="front-text">
							<h2 class="">Learn new skills online with top educators</h2>
							<p>${selectedCourse.description }</p>
						</div>
					</div>
					 <c:forEach items="${selectedCourse.listSection}" var="section" varStatus="sectionIndex">
						<div class="single-features">
							<div class="features-icon">
								<img src="<%=contextPath %>/resources/assets/img/icon/right-icon.svg" alt="">
							</div>
							<div class="features-caption">
								<p>${section.title } : ${section.description }</p>
								 <p>
								 <c:forEach items="${section.listTest}" var="test" varStatus="testIndex">
								 	- ${test.title }<br/>
								 </c:forEach>
								 </p>
							</div>
						</div>
					 </c:forEach>

				</div>

				<div class="right-content1">
					<!-- img -->
					<div class="right-img">
						<div class="video-icon">
							<a class="popup-video btn-icon"
								href="https://www.youtube.com/watch?v=ekzHIouo8Q4"><i
								class="fas fa-play"></i></a>
						</div>
					</div>
				</div>
				
			</div>
		</section>
		<!-- About Area End -->
		<!--? top subjects Area Start -->
		
		<!-- top subjects End -->
		<!--? About Area-3 Start -->
		<section class="about-area3 fix" style="margin-top: 50px">
			<div class="support-wrapper align-items-center">
				<div class="right-content3">
					<!-- img -->
					<div class="right-img">
						<img src="<%=contextPath %>/resources/images/upload/${selectedCourse.urlImg}" alt="" style="width: 75%; margin-left: 100px;    border-radius: 20px 120px 20px 120px;">
					</div>
				</div>
				<div class="left-content3">
					<!-- section tittle -->
					<div class="section-tittle section-tittle2 mb-20">
						<div class="front-text">
							<h2 class="">Learner outcomes on courses you will take</h2>
						</div>
					</div>
				 <c:forEach items="${selectedCourse.lessonList}" var="lesson" varStatus="lessonIndex">
					<div class="single-features">
						<div class="features-icon">
							<img src="<%=contextPath %>/resources/assets/img/icon/right-icon.svg" alt="">
						</div>
						<div class="features-caption">
							<p>${lesson.title }<br/>- ${lesson.description }</p>
						</div>
					</div>
				 </c:forEach>
					
					
				</div>
			</div>
		</section>
		<!-- About Area End -->
		
		<br/><br/><br/>
		
		<!--? Team -->
		<section class="team-area section-padding40 fix">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-7 col-lg-8">
						<div class="section-tittle text-center mb-55">
							<h2>Community experts</h2>
						</div>
					</div>
				</div>
				<div class="team-active">
					<div class="single-cat text-center">
						<div class="cat-icon">
							<img src="https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/26585_102459323128895_2730187_n.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_ohc=6uZJij3Fid0AX-A9-Zr&_nc_ht=scontent.fvca1-2.fna&oh=94570f4fd2afc7e781284f273a2b282b&oe=5F927FAD" alt="">
						</div>
						<div class="cat-cap">
							<h5>
								<a href="services.html">Mrs. Diep</a>
							</h5>
							<p>Leader team learntogether</p>
							<p>Create course, Create session, Create lesson, Submit for review.</p>
						</div>
					</div>

					<div class="single-cat text-center">
						<div class="cat-icon">
							<img
								src="<%=contextPath %>/resources/assets/img/gallery/photo-1-1573635284176282989283.gif"
								alt="">
						</div>
						<div class="cat-cap">
							<h5>
								<a href="services.html">Mr. Hoa</a>
							</h5>
							<p>Add course to cart, Payment, Promotion</p>
						</div>
					</div>
					<div class="single-cat text-center">
						<div class="cat-icon" >
							<img src="<%=contextPath %>/resources/assets/img/gallery/huy1.gif" alt="" >
						
						</div>
						<div class="cat-cap">
							<h5>
								<a href="services.html">Mr. Huy</a>
							</h5>
							<p>Elder team learn together</p>
							<p>Register, login, logout, Create/do/calculate multichoice test/marks, Create/do/calculate essay test/marks, Authentication</p>
						</div>
					</div>
					<div class="single-cat text-center">
						<div class="cat-icon">
							<img src="https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/118303741_1312545429092573_1832540124874424102_n.jpg?_nc_cat=106&_nc_sid=09cbfe&_nc_ohc=TncIdNYDNLMAX8FhHdZ&_nc_ht=scontent.fvca1-1.fna&oh=e9915542a76fa9599cc46f508185b4a8&oe=5F9273C8" alt="">
						</div>
						<div class="cat-cap">
							<h5>
								<a href="services.html">Mr. Nam</a>
							</h5>
							<p>Data management ( admin ), Approve course ( admin ), Statistic ( admin )</p>
						</div>
					</div>
					<div class="single-cat text-center">
						<div class="cat-icon">
							<img src="<%=contextPath %>/resources/assets/img/gallery/pho.gif" alt="">
						</div>
						<div class="cat-cap">
							<h5>
								<a href="services.html">Mr. Pho</a>
							</h5>
							<p>Show approved course by category</p>
						</div>
					</div>
					<div class="single-cat text-center">
						<div class="cat-icon">
							<img src="<%=contextPath %>/resources/assets/img/gallery/team1.png" alt="">
						</div>
						<div class="cat-cap">
							<h5>
								<a href="services.html">Mr. Cong</a>
							</h5>
							<p>Edit user profile, Search course by name, Rating, About</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Services End -->
	</main>
	<%@ include file="footer.jsp"%>
	<!-- Footer End-->

	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->
	<script src="<%=contextPath %>/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="<%=contextPath %>/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/popper.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="<%=contextPath %>/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="<%=contextPath %>/resources/assets/js/owl.carousel.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="<%=contextPath %>/resources/assets/js/wow.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/animated.headline.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script src="<%=contextPath %>/resources//assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script src="<%=contextPath %>/resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script src="<%=contextPath %>/resources/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script src="<%=contextPath %>/resources/assets/js/jquery.counterup.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/waypoints.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/jquery.countdown.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/hover-direction-snake.min.js"></script>
	<!-- 
contact js -->
	<script src="<%=contextPath %>/resources/assets/js/contact.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/jquery.form.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/jquery.validate.min.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/mail-script.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery	 -->
	<script src="<%=contextPath %>/resources/assets/js/plugins.js"></script>
	<script src="<%=contextPath %>/resources/assets/js/main.js"></script>
	
	<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>

</body>
<style>
.cat-icon img {
	width: 160px;
	height: 140px;
	border-radius: 50%;
}
</style>
</html>