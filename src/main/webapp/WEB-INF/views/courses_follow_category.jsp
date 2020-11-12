<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tp.kits3.learntogether.utils.Contansts"%>

<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js" lang="us">
<%
	/**
	*@author	pho
	*/
%>
<%
	String contextPath = request.getContextPath();
%>
<head>
<title>Development</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Courses | Education</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- CSS here -->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/slicknav.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/gijgo.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/animate.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/animated-headline.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/slick.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/nice-select.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/style.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/custom.css">

<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/animated-headline.css">

<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/customeIndex.css">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
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
									<h1 data-animation="bounceIn" data-delay="0.2s">Courses</h1>
									<!-- breadcrumb Start-->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="index.html">Home</a></li>
											<li class="breadcrumb-item"><a href="#">Contact</a></li>
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
		<!-- ? services-area -->
		<div class="services-area">
			<div class="container">
				<div class="row justify-content-sm-center">
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon">
								<img src="<%=contextPath%>/resources/assets/img/icon/icon1.svg"
									alt="">
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
								<img src="<%=contextPath%>/resources/assets/img/icon/icon2.svg"
									alt="">
							</div>
							<div class="features-caption">
								<h3>Expert instructors</h3>
								<p>The automated process all your website tasks.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-8">
						<div class="single-services mb-30">
							<div class="features-icon"></div>
							<div class="features-caption">
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
				<div class="row justify-content-center">
					<div class="col-xl-7 col-lg-8">
						<div class="section-tittle text-center mb-55">
							<h2>
								<c:out value="${cateName}"></c:out>
							</h2>
						</div>
					</div>
				</div>
				<div class="courses-actives">

					<c:forEach var="cour" items="${cour}">

						<div class="col-md-3 properties pb-20"
							style="overflow: hidden; height: 500px">
							<div class="properties__card">
								<div class="properties__img overlay1">
									<img id="imgcour"
										src="<%=contextPath%>/resources/images/upload/${cour.getCourse().getUrlImg()}">
								</div>
								<div class="properties__caption">
									<p>User Experience</p>
									<h3>
										<a id="titlecour" href="/learntogether/product/${cour.course.id}" style="text-decoration: none;">${cour.course.courseTitle}</a>
									</h3>
									<p id="loadname">${cour.user.fullname }</p>
									<p id="descour">${cour.course.description}</p>
									<div class="properties__footer d-flex justify-content-between align-items-center">
										<div class="restaurant-name">
											<div class="rating">
												<c:set var="count" scope="session" value="${cour.course.count}" />
												<c:if test="${count == 0}">
													<p>No comments yet</p>
												</c:if>
												<c:if test="${count != 0}">
													<input type="hidden" value="${cour.course.average} " id="rateValue${cour.course.id}" class="rateValue${cour.course.id}">
													<input type="hidden" value="${cour.course.id}" id="${cour.course.id}" class="abcc">
													<div class="rateyo-readonly${cour.course.id}"></div>
												</c:if>
											</div>
											<p>
												<span>${cour.course.average}</span> based on
												${cour.course.count}

											</p>
										</div>
										<div class="price">
											<span id="prcour">${cour.course.priceCourse}</span>
										</div>
									</div>
									<a href="/learntogether/cartitem/?idcourse=${cour.course.id}" class="border-btn border-btn2" style="text-decoration: none;">Add to cart</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</main>
	<%@ include file="footer.jsp"%>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script>
	
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
   			mmm = bb[j].value;
   			ck =  vvv + mmm; 
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
.fied {
	display: inline-block;
	float: left;
	position: relative;
	padding: 0;
}

.containt-fied {
	display: inline-block;
	padding: 0;
}
</style>
</html>
