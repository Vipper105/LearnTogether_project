
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js" lang="us">

<%
	String contextPath = request.getContextPath();
	HttpSession session1 = request.getSession();
	User user = (User) session1.getAttribute(Contansts.USER_LOGGED);
%>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Courses | Education</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="manifest" href="site.webmanifest"> -->
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

<link rel="stylesheet"
	href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">



<link rel="stylesheet" href="resources/css/login.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<!-- <!-- <link rel="stylesheet" href="resources/assets/js/jquery.min.js">
<link rel="stylesheet" href="resources/assets/ccs/jquery.rateyo.min.css">
<script type="text/javascript" src="resources/assets/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/assets/js/jquery.rateyo.min.js"></script> -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main>

		<section class="slider-area slider-area2">
			<div class="slider-active">
				<!-- Single Slider -->
				<div class="single-slider slider-height2">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-11 col-md-12">
								<div class="hero__caption hero__caption2">
									<h1 data-animation="bounceIn" data-delay="0.2s">My courses</h1>
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
								<img src="resources/assets/img/icon/icon1.svg" alt="">
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
								<img src="resources/assets/img/icon/icon2.svg" alt="">
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
							<h2>My courses</h2>
						</div>
						<ul>
							<li style="display: inline-block; margin-right: 50px"><a
								href="#" style="color: black; display: inline-block;">All
									courses</a></li>
							<li style="display: inline-block;"><a href="#"
								style="color: black;">Whislist</a></li>
						</ul>
					</div>
				</div>
				<div class="courses-actives">
					<!-- Single -->



					<%-- 					<c:set var="listCs" value="${ListCourses}"></c:set>
						${listCs.size()}
					<c:if test="${listCs.size() > 0 } ">
						<h1>${listCs.size()} 123</h1>
					</c:if>
					<c:if test="${listCs.size()<= 0} ">
					<h1></h1>	${listCs.size()}
					</c:if> --%>
					<c:set var="val" value="${ListCourses }" />
					<c:choose>
						<c:when test="${val.size() > 0}">
   							 <c:forEach var="listCs" items="${ListCourses}">

						<div class="col-md-3 properties pb-20 qqq"
							style="overflow: hidden; height: 500px">
							<div class="properties__card">
								<div class="properties__img overlay1">
									<a href="#"><img
										src="resources/assets/img/gallery/featured1.png" alt=""></a>
								</div>
								<div class="properties__caption"
									style="height: 300px; position: relative;">
									<p>User Experience</p>
									<h3 style="height: 48px">
										<a href="#"
											style="-webkit-box-orient: vertical; -webkit-line-clamp: 2; display: -webkit-box; text-overflow: ellipsis; overflow: hidden">${listCs.courseTitle}</a>
									</h3>
									<p
										style="-webkit-box-orient: vertical; -webkit-line-clamp: 4; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; height: 80px">${listCs.description}</p>
									<c:set var="rateValue" scope="session"
										value="${listCs.rating.ratevalue}" />
									<c:if test="${rateValue == null}">
										<div class="rateyo-readonly" style="margin-bottom: 20px"></div>
										<p type="button" data-toggle="modal"
											data-target="#myModal${listCs.id}" class="zzz"
											style="height: 20px; margin-top: 8px; line-height: 4px; position: absolute; right: 0">Leave
											a rating</p>
										<a href="<%=contextPath%>/course/${listCs.id}/learn">Start
											my course</a>

										<!-- Modal -->
										<div class="modal fade" id="myModal${listCs.id}" role="dialog">
											<div class="modal-dialog ">
												<form class="modal-content animate cts-form" action="rating"
													method="get">
													<div class="container"
														style="position: relative; height: 200px">
														<div>
															<div class="counter"
																style="float: left; font-weight: bold; margin-left: 10px; margin-top: 7px; display: none"></div>
															<div style="clear: both"></div>
														</div>
														<h3 style="text-overflow: unset; overflow: inherit;">How
															would you rate this course?</h3>
														<div class="rateyo" onclick="checkMinStar()"></div>
														<input type="hidden" id="hdrating${listCs.id}"
															name="hdrating" value="1"> <input type="hidden"
															value="${listCs.id}" name="idCourse" class="abc">
														<button type="submit" id="btn-star${listCs.id}"
															style="width: 40%; background: lawngreen; height: 40px; margin-top: 20px;">Save</button>
														<br>
														<button type="button" data-dismiss="modal"
															style="position: absolute; top: 6px; right: 683px">Close</button>

													</div>
												</form>
											</div>
										</div>
									</c:if>
									<c:if test="${rateValue != null}">
										<input type="hidden" value="${listCs.rating.ratevalue} "
											id="rateValue${listCs.id}" class="rateValue${listCs.id}">
										<input type="hidden" value="${listCs.id}" name="idCourse"
											class="abcc">
										<div class="rateyo-readonly${listCs.id}"
											style="margin-bottom: 20px"></div>
										<div class="item">
											<p type="button" class="edit-rating" data-toggle="modal"
												data-target="#myModal1${listCs.id}">
												<span class="yyy"
													style="height: 20px; margin-top: 5px; line-height: 4px; position: absolute; right: 0">Your
													rating</span>
											</p>

										</div>
										<a href="<%=contextPath%>/course/${listCs.id}/learn">Start
											my course</a>


										<!-- Modal -->
										<div class="modal fade" id="myModal1${listCs.id}"
											role="dialog">
											<div class="modal-dialog ">
												<form class="modal-content animate cts-form"
													action="deleteRating" method="get">
													<div class="container"
														style="position: relative; height: 200px">
														<div>
															<div class="counter"
																style="float: left; font-weight: bold; margin-left: 10px; margin-top: 7px; display: none"></div>
															<div style="clear: both"></div>
														</div>
														<h3 style="text-overflow: unset; overflow: inherit;">Your
															review</h3>
														<input type="hidden" value="${listCs.id}" name="idCourse"
															class="abcc">
														<div class="rateyo-readonly${listCs.id}"
															style="margin-bottom: 20px"></div>

														<button type="submit" id="btn-star${listCs.id}"
															style="border: 2px solid red; font-size: 20px; position: absolute; right: 700px; background: white; font-weight: 700; height: 40px; margin-top: 20px">Delete</button>

														<br>
														<button type="button" data-dismiss="modal"
															style="position: absolute; top: 6px; right: 683px">Close</button>

													</div>
												</form>
											</div>
										</div>

									</c:if>
								</div>
							</div>

							<!-- Trigger the modal with a button -->
						</div>
					</c:forEach>
 						 </c:when>
						<c:when test="${val.size() <= 0}">
   							 You have not registered for any course
 						 </c:when>

					</c:choose>

					
				</div>
			</div>
		</div>
		<!-- Courses area End -->
		<!--? About Area-1 Start -->
		<section class="about-area1 fix pt-10">
			<div class="support-wrapper align-items-center"></div>
		</section>
		<!-- About Area End -->
		<!--? top subjects Area Start -->

		<!-- top subjects End -->
		<!--? Team -->

		<!-- Services End -->
	</main>
	<jsp:include page="footer.jsp"></jsp:include>

	<!--? slider Area Start-->



</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script>
	var bb = document.getElementsByClassName('abcc');
	var rateValue = 'rateValue';
	var fu;
	var xx;
	var vvv = '.rateyo-readonly';

	for (j = 0; j < bb.length; j++) {
		x = bb[j].value;
		xx = rateValue + x;
		console.log(xx);
		fu = document.getElementById(xx).value;
		console.log(fu);
		var ck;
		
		ck = vvv + x;
		console.log(ck);
		$(ck).rateYo({
			rating : fu,
			numStars : 5,
			readOnly : true,
			starWidth: "25px"
		})
	}
	var b = document.getElementsByClassName('abc');
	var a = '#hdrating';
	var aa = 'hdrating'
	var d = '';
	$(function() {
		var rating = 0;
		console.log(rating);
		$(".counter").text(rating);
		$(".rateyo").rateYo({
			rating : 1,
			numStars : 5,
			halfStar : true,
			minValue : 1,
			maxValue : 5,
			starWidth: "30px"
		}).on("rateyo.change", function(e, data) {
			for (i = 0; i < b.length; i++) {
				c = b[i].value;
				d = a + c;
				$(d).val(data.rating);
				console.log(data.rating);
			}
		});
	});
	var e = 'btn-star';
	function checkMinStar() {
		var val;
		var output;
		for (i = 0; i < b.length; i++) {
			c = b[i].value;
			d = aa + c;
			val = document.getElementById(d);
			ee = e + c;
			output = document.getElementById(ee);
			
			
			
			if (val.value < 1) {
				output.disabled = true;
			} else {
				output.disabled = false;
			}
		}

	}
    $(".rateyo-readonly").rateYo({

        rating: 0,
        numStars: 5,
        precision: 2,
        minValue: 1,
        maxValue: 5,
        readOnly: true,
        starWidth: "25px"
      })
</script>
<style>
.item:hover p span {
	display: none;
}

.item:hover p:after {
	position: absolute;
	right: 0;
	content: 'Delete rating';
	color: #c86fff;
}

.qqq p:hover {
	color: #c86fff;
}
</style>
</html>
