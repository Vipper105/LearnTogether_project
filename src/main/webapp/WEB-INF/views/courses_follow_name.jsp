<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%
	String contextPath = request.getContextPath();
%>
<%
	/*
	*
	* @author VoVanPho
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="<%=contextPath%>/resources/assets/img/favicon.ico">
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

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<style>
header {
	position: relative;
	background: #4255a4;
}

.header-transparent {
	position: relative;
}

.border-btn.border-btn2:hover {
	color: #fff;
	background-color: #ff9f67;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<main>
		<section>
				<div class="container">
					<div class="row col-md-12">
						<div class="col-md-9">
							<div class="detail-cour" style="padding: 10px; background-color: azure; border: 1px solid #dcdacb;">
								<div style="padding-top: 10px;">
									<div id="sliderd">
										<h1>${cour.course.courseTitle}</h1>
										<p><fmt:formatDate pattern = "yyyy-MM-dd" value = "${cour.course.lastedUpdate}" /></p>
										<div>
											<img src="<%=contextPath%>/resources/images/${cour.getUser().getUrlimg()}" alt="" class="img-circle" style="width: 50px; height: 50px;">
											<span id="loadname">${cour.getUser().getFullname()}</span>					
										</div>
										<p id="descour">${cour.course.description}</p>
										<div
											class="properties__footer d-flex justify-content-between align-items-center">
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
													<span style="margin-right: 0.4rem">${cour.course.average}</span><span style="margin-right: 0.4rem">(${cour.course.count} ratings)</span><span>(${cour.course.totalPurchased} students)</span>
												</div>
											</div>
										</div>
									</div>
									<div class="slider-min">
										<h1>${cour.course.courseTitle}</h1>
										<p><fmt:formatDate pattern = "yyyy-MM-dd" value = "${cour.course.lastedUpdate}" /></p>
									</div>
								</div>
							</div>
							<div class="content-cour" >
								<h2>Content courses</h2>
								<div style="padding: 15px 0; background-color: #fbfbf8; border: 1px solid #dcdacb;">
								<c:forEach var="sec" items="${sec}" varStatus="vs">
									<button class="accordion">${sec.section.title}</button>
									<div class="panel">
										<p>${sec.section.description}</p>
										<div>
											<ul>
												<li>
													<!DOCTYPE html>
													<html lang="en">
													<head>
													<title>Bootstrap Example</title>
													<meta charset="utf-8">
													<meta name="viewport" content="width=device-width, initial-scale=1">
													<link rel="stylesheet"
														href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
													<script
														src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
													<script
														src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
													</head>
													<body>
														<div class="container">
															<div style="width: 65%; display: flex;">
																<div style="width: 90%">tieu de lesson</div>
																<div>
																	<a type="button" class="taga" data-toggle="modal" data-target="#myModal${vs.index}">Preview</a>
																</div>
															</div>
															<div class="modal fade" id="myModal${vs.index}" role="dialog">
																<div class="modal-dialog">
																	<!-- Modal content-->
																	<div class="modal-content">
																		<div class="modal-header">
																			<h4 class="modal-title">${sec.getLesson().getTitle()}</h4>
																			<button type="button" class="close" data-dismiss="modal">&times;</button>
																		</div>
																		<div class="modal-body">
																			<div>
																				<video style="width: 100%" controls>
																					<source
																						src="/learntogether/resources/videos/${sec.getLesson().getUrlVid()}"
																						type="video/mp4">
																				</video>
																			</div>
																			<p>Some text in the modal.</p>
																			<div>
																				<ul>
																					<li>
																						<div class="col-md-4">hinh anh</div>
																						<div class="col-md-4">tieu de</div>
																						<div class="col-md-4">time</div>
																					</li>
																				</ul>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</body>
													</html>
												</li>
											</ul>
										</div>
									</div>
								</c:forEach>
								<script>
									var acc = document
											.getElementsByClassName("accordion");
									var i;

									for (i = 0; i < acc.length; i++) {
										acc[i]
												.addEventListener(
														"click",
														function() {
															this.classList
																	.toggle("active");
															var panel = this.nextElementSibling;
															if (panel.style.maxHeight) {
																panel.style.maxHeight = null;
															} else {
																panel.style.maxHeight = panel.scrollHeight + "px";
															}
														});
									}
								</script>
								</div>
							</div>
							<div class="view instrutor" style="padding: 15px 0; height: 30vh; position: relative;">
								<h2>Instructor</h2>
								<div class="col-md-12" style="padding-top: 20px; border: 1px solid #dcdacb;">
									<div class="col-md-2">
										<div style="display: inline-block; overflow: hidden;">
											<img src="<%=contextPath%>/resources/images/${cour.getUser().getUrlimg()}" alt="" class="img-circle" style="width: 100px; height: 100px;">
										</div>
										<p>${cour.getUser().getFullname()}</p>
									</div>
									<div class="col-md-10" style="display: inline-block; vertical-align: top;">
										<p><i class="fa fa-star" aria-hidden="true"> Ranting: ${cour.getInstructor().getRatevalue()}</i></p>
										<p><i class="fa fa-users" aria-hidden="true"> Student: ${cour.getInstructor().getNumstudent()}</i></p>
										<p><i class="fa fa-play-circle" aria-hidden="true" id="getdata"> Courses: ${sumcour}</i></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div style="padding-top: 10px" class="sticky-top">
								<div class="slidebar"
									style="height: 345px; padding: 8px; border-bottom: 1px solid #dcdacb; box-sizing: border-box; box-shadow: 0 2px 4px rgba(0, 0, 0, .08), 0 4px 12px rgba(0, 0, 0, .08); border-radius: 4px; background-color: #fff;">
									<img
										src="<%=contextPath%>/resources/images/upload/${cour.getCourse().getUrlImg()}"
										style="opacity: 0.9; width: 100%;">
									<p><span style="margin-right: 0.4rem">Price:</span>${cour.course.priceCourse}$</p>
									<ul>
										<li><a href="/learntogether/cartitem/?idcourse=${cour.course.id}" class="border-btn border-btn2">Add Cart</a></li>
									</ul>
									<div>
										<h4>This courses included:</h4>
										<ul>
											<li><i class="fa fa-play" aria-hidden="true"></i><span style="margin-left: 0.5rem">21.5 hours on-demand video</span></li>
											<li><i class="fa fa-battery-full" aria-hidden="true"></i><span style="margin-left: 0.5rem">Full lifetime access</span></li>
											<li><i class="fa fa-mobile" aria-hidden="true"></i><span style="margin-left: 0.5rem">Access on mobile and TV</span></li>
											<li><i class="fa fa-certificate" aria-hidden="true"></i><span style="margin-left: 0.5rem">Certificate of completion</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
	</main>
	<%@ include file="footer.jsp"%>
</body>
<style>
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}

.slider-min{
	display: none;
}



</style>
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
   						readOnly : true	
   				})	
   	}
   	
   	
</script>
</html>