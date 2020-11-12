<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ page session="false"%> --%>

<%
	/*
	*@author Hoa
	*/
%>

<html class="no-js" lang="us">
<%
	String contextPath = request.getContextPath();
%>

<head>
<title>Learn Together</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Courses | Education</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/custom.css">
<link rel="stylesheet" href="resources/css/customeIndex.css">
<link rel="stylesheet" href="resources/css/jquery.rateyo.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.rateyo.min.js"></script>
<script src="<%=contextPath%>/resources/js/customIndex.js"></script>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<!--? slider Area Start-->
		<section class="slider-area ">
			<div class="slider-active">
				<!-- Single Slider -->
				<div class="single-slider slider-height d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-6 col-lg-7 col-md-12">
								<div class="hero__caption">
									<h1 data-animation="fadeInLeft" data-delay="0.2s">
										Online learning<br> platform
									</h1>
									<p data-animation="fadeInLeft" data-delay="0.4s">Build
										skills with courses, certificates, and degrees online from
										world-class universities and companies</p>
									<a href="#" class="btn hero-btn" data-animation="fadeInLeft"
										data-delay="0.7s">Join for Free</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ? services-area -->
		<div class="services-area">
			<div class="container">
				<div class="row justify-content-sm-center">
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon">
								<img src="resources/assets/img/icon/icon1.svg" alt="">
							</div>
							<div class="features-caption wow swing">
								<h3>60+ UX courses</h3>
								<p>The automated process all your website tasks.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon">
								<img src="resources/assets/img/icon/icon2.svg" alt="">
							</div>
							<div class="features-caption wow swing " data-wow-offset="10">
								<h3>Expert instructors</h3>
								<p>The automated process all your website tasks.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon"></div>
							<div class="features-caption wow swing">
								<h3>Life time access</h3>
								<p>The automated process all your website tasks.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Courses area start -->
		<div class="courses-area section-padding40 fix">
			<div class="container">
				<%
					/*
					*
					* @author VoVanPho
					*/
				%>
				<div class="slider-product ">
					<div class="pc-layout">
						<div>
							<h2>The world's largest selection of courses</h2>
							<p>Choose from 150,000 online video courses with new
								additions published every month</p>
						</div>
						<div class="tab-container tabs">

							<div class="container" id="username1" role="tablist"
								aria-label="Sample Tabs">
								<c:forEach var="cate" items="${cate}" end="4">
									<c:url value="/api/courcate" var="courcate">
										<c:param name="id" value="${cate.id}"></c:param>
										<c:set var="a" value="${cate.categoryName}"></c:set>
										<c:set var="b" value="${fn:replace(a, '_', ' ')}"></c:set>
									</c:url>
									<button id="idcate" onclick="myFunction(${cate.id})">${fn:replace(b, "and", "&")}</button>
								</c:forEach>
							</div>
							<div class="tab-content">
								<div class="carousel-container">
									<div class="main-carousel carousel-scroll" id="sliderd">
										<c:forEach var="cour" items="${cour}">

											<div class="carousel-scoll-item item">

												<div class="properties__card">
													<div class="properties__img overlay1">
														<img id="imgcour"
															src="<%=contextPath%>/resources/images/upload/${cour.course.urlImg}">
													</div>
													<div class="properties__caption">
														<p>User Experience</p>
														<h3>
															<a id="titlecour"
																href="/learntogether/product/${cour.course.id}"
																style="text-decoration: none;">${cour.course.courseTitle}</a>
														</h3>
														<p id="loadname">${cour.getUser().getFullname()}</p>
														<p id="descour">${cour.course.description}</p>
														<div
															class="properties__footer d-flex justify-content-between align-items-center">
															<div class="restaurant-name">
																<div class="rating">
																	<c:set var="count" scope="session"
																		value="${cour.course.count}" />

																	<c:if test="${count == 0}">
																		<p>No comments yet</p>
																	</c:if>
																	<c:if test="${count != 0}">
																		<input type="hidden" value="${cour.course.average} "
																			id="rateValue${cour.course.id}"
																			class="rateValue${cour.course.id}">
																		<input type="hidden" value="${cour.course.id}"
																			id="${cour.course.id}" class="abcc">
																		<div class="rateyo-readonly${cour.course.id}"
																			style="z-index: 0"></div>
																	</c:if>
																</div>
																<p>
																	<span style="margin-right: 0.4rem">${cour.course.average}</span><span>(${cour.course.count}
																		ratings)</span>

																</p>
															</div>
															<div class="price">
																<span id="prcour">${cour.course.priceCourse}</span>
															</div>
														</div>
														<a
															href="/learntogether/cartitem/?idcourse=${cour.course.id}"
															class="border-btn border-btn2">Add to cart</a>
													</div>
												</div>

											</div>
										</c:forEach>
										
										<a href="javascript:prevPage()" id="btn_prev">Prev</a> <a
											href="javascript:nextPage()" id="btn_next">Next</a>

									</div>
								</div>
							</div>
						</div>
						
						
	
		<script type="text/javascript">
		function myFunction(id) {
			$.ajax({
				type : 'GET',
				dataType : 'json',
				data : {
					id: id
				},
				url : "/learntogether/api/courcate",
				success : function(data) {
					console.log(data);
					$("#sliderd").html(loadData(data));
					var cour = JSON.parse(JSON.stringify(data));
					$("#imgcour").val(cour[0].course.urlImg);
					$("#titlecour").val(cour[0].course.courseTitle);
					$("#descour").val(cour[0].course.description);
					$("#prcour").val(cour[0].course.priceCourse);
				 	$("#loadname").val(cour[0].user.fullname);
				 	
				}
			});
		};
						
		function loadData(data) {
			var str ='<div class="main-carousel carousel-scroll">'
				$.each(data, function(index, value){
				str +='		<div class="carousel-scoll-item item">'
				str +='			<div class="properties__card">'
				str +='				<div class="properties__img overlay1">'
				str +='					<img id="imgcour" src="/learntogether/resources/images/upload/'+ value.course.urlImg +'">'
				str +='				</div>'
				str +='				<div class="properties__caption">'
				str +='					<p id="user">User Experience</p>'
				str +='					<h3><a id="titlecour" href="/learntogether/product/'+value.course.id+'" style="text-decoration: none;">'+value.course.courseTitle+'</a></h3>'
				str +='					<p id="loadname">'+value.user.fullname+'</p>'
				str +='					<p id="descour">'+value.course.description+'</p>'
				str +='					<div class="properties__footer d-flex justify-content-between align-items-center">'
				str +='						<div class="restaurant-name">'
				str +='							<div class="rating">'
				str +=`								<c:set var="count" scope="session" value="${value.course.count}"/>`
				str +='								<c:if test="${count == 0}">'
				str +='									<p>No comments yet</p>'
				str +='								</c:if>'
				str +='								<c:if test="${count != 0}">'
				str +='									<input type="hidden" value="'+value.course.average+'" id="rateValue'+value.course.id+'" class="rateValue'+value.course.id+'">'
				str +='									<input type="hidden" value="'+value.course.id+'" id = "'+value.course.id+'" class="abcc">'
				str +='									<div class="rateyo-readonly'+value.course.id+'"></div>'
				str +='								</c:if>'
				str +='							</div>'
				str +='							<p>'
				str +='								<span style="margin-right: 0.4rem">'+value.course.average+'</span><span>('+value.course.count+' ratings)</span>'
				str +='							</p>'
				str +='						</div>'
				str +='						<div class="price">'
				str +='							<span id="prcour">'+value.course.priceCourse+'</span>'
				str +='						</div>'
				str +='					</div>'
				str +='					<a href="/learntogether/cartitem/?idcourse='+value.course.id+'" class="border-btn border-btn2">Add to Cart</a>'
				str +='				</div>'
				str +='			</div>'
				str +='		</div>'
				str +='</div>'
				
				});
			return str;
		}

		
		const slider = document.querySelector('.carousel-scroll');
		let isDown = false;
		let startX;
		let scrollLeft;
		
		 	slider.addEventListener('mousedown', (e) => {
				isDown = true;
				slider.classList.add('active');
				startX = e.pageX - slider.offsetLeft;
				scrollLeft = slider.scrollLeft;
			}); 
			slider.addEventListener('mouseleave', () => {
				isDown = false;
				slider.classList.remove('active');
			});
			slider.addEventListener('mouseup', () => {
				isDown = false;
				slider.classList.remove('active');
			});
			slider.addEventListener('mousemove', (e) => {
				if(!isDown) return;
				e.preventDefault();
				const x = e.pageX - slider.offsetLeft;
				const walk = (x - startX) * 3; //scroll-fast
				slider.scrollLeft = scrollLeft - walk;
				console.log(walk);
			});
		
			
		</script>
		<!-- Courses area End -->
		<!--? About Area-1 Start -->
		<div>
			<h2>The world's largest selection of courses</h2>
			<p>Choose from 150,000 online video courses with new additions published every month</p>
		</div>
		<c:forEach var="lcfr" items="${lcfr}" end="7">
			<div class="carousel-scoll-item item">
				<div class="properties__card">
					<div class="properties__img overlay1">
						<img id="imgcour" src="<%=contextPath%>/resources/images/upload/${lcfr.course.urlImg}">
					</div>
					<div class="properties__caption">
						<p>User Experience</p>
						<h3>
							<a id="titlecour" href="/learntogether/product/${lcfr.course.id}" style="text-decoration: none;">${lcfr.course.courseTitle}</a>
						</h3>
						<p id="loadname">${lcfr.getUser().getFullname()}</p>
						<p id="descour">${lcfr.course.description}</p>
						<div class="properties__footer d-flex justify-content-between align-items-center">
							<div class="restaurant-name">
								<div class="rating">
									<c:set var="count" scope="session" value="${lcfr.course.count}" />
										<c:if test="${count == 0}">
												<p>No comments yet</p>
										</c:if>
										<c:if test="${count != 0}">
											<input type="hidden" value="${lcfr.course.average} "id="rateValue${lcfr.course.id}" class="rateValue${lcfr.course.id}">
											<input type="hidden" value="${lcfr.course.id}" id = "${lcfr.course.id}" class="abcc">
											<div class="rateyo-readonly${lcfr.course.id}" style="z-index: 0"></div>
										</c:if>
								</div>
									<p>
										<span style="margin-right: 0.4rem">${lcfr.course.average}</span><span>(${lcfr.course.count} ratings)</span>
									</p>
							</div>
							<div class="price">
								<span id="prcour">${lcfr.course.priceCourse}</span>
							</div>
						</div>
							<a href="/learntogether/cartitem/?idcourse=${lcfr.course.id}" class="border-btn border-btn2">Add to cart</a>
					</div>
				</div>
			</div>
		</c:forEach>
				
	</div>
	</div>
	</div>
	</div>
		<!-- About Area End -->
		<!--? top subjects Area Start -->
		<div class="topic-area section-padding40">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-7 col-lg-8">
						<div class="section-tittle text-center mb-55">
							<h2>Top Category</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach var="cate" items="${cate}">
						<c:set var="a" value="${cate.categoryName}"></c:set>
						<c:set var="b" value="${fn:replace(a, '_', ' ')}"></c:set>
						<div class="col-lg-3 col-md-4 col-sm-6 wow bounce">
							<div class="single-topic text-center mb-30">
								<div class="topic-img">
									<img src="resources/images/${cate.urlimg}" alt="">
									<div class="topic-content-box">
										<div class="topic-content">
											<h3>
												<a href="<%=contextPath%>/courses/${cate.categoryName}"
													style="text-decoration: none;">${fn:replace(b, "and", "&")}</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- top subjects End -->

		<div class="qt" style="margin: 50px 0">
			<div class="qt1" style="width: 1920px; background: black;opacity: .5">
				<div class="qt2">
					<p style="line-height: 50px; right: -280 px;width: 55vh; top: 100px; margin-left: 80vh" class="wow slideInLeft">
						" If you are not willing to learn, no one can help you. If you are
						determined to learn, no one can stop you. "<br> <span >Zig
							Ziglar</span>
					</p>

				</div>
			</div>

		</div>

		<!--? Team -->
		<section class="team-area section-padding40 fix" style="height: 56vh">
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
							<img src="/learntogether/resources/assets/img/gallery/team4.png"
								alt="" class="wow flip">
						</div>
						<div class="cat-cap ">
							<h5>
								<a href="services.html">Mrs. Diep</a>
							</h5>
							<p>Leader team learn together</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Services End -->
	</main>
	<%@ include file="footer.jsp"%>
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>
</body>
<script type="text/javascript">
										 var bb = document.getElementsByClassName('abcc');
										   var rateValue='rateValue';
										   var fu ;
										   var xx;
										   var vvv  = '.rateyo-readonly';

										   	for(j = 0; j <bb.length; j++){
										   		x = bb[j].value;
										   		xx = rateValue + x; 
										   		console.log(xx);
										   		fu = document.getElementById(xx).value;
										   		console.log(fu);
										   			var ck;
										   			ck =  vvv + x; 
										   				console.log(ck);
										   				$(ck).rateYo({
										   						rating: fu,
										   						numStars : 5,
										   						readOnly : true,
										   						starWidth: "15px"
										   				})	
										   	}
								
										</script>
<style>
.qt {
	background: url('<%=contextPath%>/resources/images/1175478.jpg');
	background-attachment: fixed;
	height: 50vh;
	display: flex;
	justify-content: center;
}

.qt .qt1 .qt2 {
	width: 34%;
	position: relative;
}

.qt .qt1 .qt2 p {
	/* line-height: 20vh; */
	text-align: center;
	color: white;
	font-size: 35px;
	position: absolute;
	top: 15%;
	font-weight: 500;
}

.qt .qt2 p span {
	color: white;
	font-size: 28px;
	font-weight: 900;
}
</style>
<!-- JS here -->
<script src="resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="resources/assets/js/popper.min.js"></script>
<script src="resources/assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="resources/assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="resources/assets/js/owl.carousel.min.js"></script>
<script src="resources/assets/js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="resources/assets/js/wow.min.js"></script>
<script src="resources/assets/js/animated.headline.js"></script>
<script src="resources/assets/js/jquery.magnific-popup.js"></script>

<!-- Date Picker -->
<script src="resources//assets/js/gijgo.min.js"></script>
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
<!-- 
contact js -->
<script src="resources/assets/js/contact.js"></script>
<script src="resources/assets/js/jquery.form.js"></script>
<script src="resources/assets/js/jquery.validate.min.js"></script>
<script src="resources/assets/js/mail-script.js"></script>
<script src="resources/assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery	 -->
<script src="resources/assets/js/plugins.js"></script>
<script src="resources/assets/js/main.js"></script>

<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>
