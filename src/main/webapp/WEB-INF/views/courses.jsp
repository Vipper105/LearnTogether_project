<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix ="fn" %>
<html class="no-js" lang="us">
<%
	/**
	*@author VoducHoa	
	*/
	
%>
<%
	String contextPath = request.getContextPath();
	HttpSession session1 = request.getSession();
	User user = (User) session1.getAttribute(Contansts.USER_LOGGED);
%>
<head>
	<title>Homeee</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Courses</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--   <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=contextPath%>/resources/assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/gijgo.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/animated-headline.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/slick.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/style.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/custom.css">
	<link rel="stylesheet"	href="<%=contextPath%>/resources/assets/css/progressbar_barfiller.css">
	<link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/animated-headline.css">  
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
                                <img src="/learntogether/resources/assets/img/icon/icon1.svg" alt="">
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
                                <img src="/learntogether/resources/assets/img/icon/icon2.svg" alt="">
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
        
        <!-- Courses area start -->
        <div class="courses-area section-padding40 fix">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8">
                        <div class="section-tittle text-center mb-55">
                            <h2>Our featured courses</h2>
                        </div>
                    </div>
                </div> 
                <div class="courses-actives">
                    <!-- Single -->
                    <form action="<c:url value="search"/>">
                    
						<input placeholder="Search ... " name="text">
						<button style="color: black;">find</button>
						<!-- <select>
							<option value disabled>Sort</option>
							<option value="highest-price">Highest Price</option>
							<option value="lowest-price">Lowest Price</option>
							
						</select>    -->           
                    </form>
                    <c:forEach var="listCs" items="${ListCourses}">
                    	<c:url value="/cartitem" var="addcart">
                    		<c:param name="idcourse" value="${listCs.course.id}"></c:param>
                    	</c:url>  
                    	<div class="col-md-3 properties pb-20" style="overflow: hidden; height: 500px">
                        <div class="properties__card">
                            <div class="properties__img overlay1">
                                <img src="<%=contextPath%>/resources/images/upload/${listCs.course.urlImg}" alt="">
                            </div>
                            <div class="properties__caption" style="height: 300px">
                                <p>User Experience</p>
                                <h3 style="height: 40px"><a href="/learntogether/product/${listCs.course.id}" style="-webkit-box-orient: vertical; -webkit-line-clamp:2; display:-webkit-box; text-overflow:ellipsis; overflow: hidden">${listCs.course.courseTitle}</a></h3>
                                <p>${listCs.getUser().getFullname()}</p>
                                <p style="-webkit-box-orient: vertical;-webkit-line-clamp: 2;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;height: 40px">${listCs.course.description}</p>
                                <div class="properties__footer d-flex justify-content-between align-items-center">
                                    <div class="restaurant-name">
                                        <div class="rating">
											<c:set var="count" scope="session" value="${listCs.course.count}" />
											<c:if test="${count == 0}">
												<p>No comments yet</p>
											</c:if>
											<c:if test="${count != 0}">
												<input type="hidden" value="${listCs.course.average}" id="rateValue${listCs.course.id}" class="rateValue${listCs.course.id}">
												<input type="hidden" value="${listCs.course.id}" id="${listCs.course.id}" class="abcc">
												<div class="rateyo-readonly${listCs.course.id}"></div>
											</c:if>
										</div>
										<p>
											<span style="margin-right: 0.4rem">${listCs.course.average}</span><span>(${listCs.course.count} ratings)</span>
										</p>
                                       
                                    </div>
                                    <div class="price">
                                        <span>${listCs.course.priceCourse}</span>
                                    </div>
                                    
                                </div>
								<a href="/learntogether/cartitem/?idcourse=${listCs.course.id}" class="border-btn border-btn2">Add to cart</a>
                            </div>
                        </div>
                    </div>
                    	 		
                    </c:forEach>
                </div>
                
            </div>
            <nav aria-label="...">
			  <ul class="pagination pagination-lg" style="display: inline-block;">
			  	<c:forEach var="number" begin="1" end="${sumpages}">
				  	<li class="page-item">
				      <a class="page-link" href="/learntogether/courses/pages/<c:out value='${number}'/>" tabindex="-1"><c:out value="${number}"/></a>
				    </li>
            	</c:forEach>
			  </ul>
			</nav>
        </div>
        <!-- Courses area End -->
        <!--? About Area-1 Start -->
        <section class="about-area1 fix pt-10">
            <div class="support-wrapper align-items-center">
            </div>
        </section>
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
						<c:set var= "b" value="${fn:replace(a, '_', ' ')}"></c:set>									
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="single-topic text-center mb-30">
							<div class="topic-img">
								<img src="resources/images/${cate.urlimg}" alt="">
								<div class="topic-content-box">
									<div class="topic-content">
										<h3>
											<a href="<%=contextPath%>/courses/${cate.categoryName}" style="text-decoration: none;">${fn:replace(b, "and", "&")}</a>
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
                            <img src="<%=contextPath%>/resources/assets/img/gallery/team1.png" alt="">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="services.html">Mr. Urela</a></h5>
                            <p>The automated process all your website tasks.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services End -->
    </main>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
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

</html>
