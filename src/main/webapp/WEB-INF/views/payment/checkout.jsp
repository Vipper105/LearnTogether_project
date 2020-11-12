<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html class="no-js" lang="us">
 
 <%
 	/*
 	**
 	*@author VoDucHoa
 	*/
 %>

<%
	String contextPath = request.getContextPath();
	HttpSession session1 = request.getSession();

	User user1 = (User) session1.getAttribute(Contansts.USER_LOGGED);
%>

<html class="no-js" lang="us">
<head>
	<title>Home</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Checkout</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../resources/assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="../resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="../resources/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="../resources/assets/css/gijgo.css">
    <link rel="stylesheet" href="../resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="../resources/assets/css/animated-headline.css">
    <link rel="stylesheet" href="../resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="../resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="../resources/assets/css/slick.css">
    <link rel="stylesheet" href="../resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="../resources/assets/css/style.css">
    <link rel="stylesheet" href="../resources/assets/css/custom.css">
   	<link rel="stylesheet" href="../resources/assets/css/popup.css">
</head>

<style>
	.img-item{width: 20%; float: left;}
	.img-item a {display: inline-block;}
	.img-item a img{ width: 100%;}
	.content-item{width: 80%; float: left; padding-left: 10px; box-sizing: border-box; vertical-align: middle;}
	.price-item span {font-weight: bold; color: #42554a;}
</style>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
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
	                                <h1 data-animation="bounceIn" data-delay="0.2s">Payment Page</h1>
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
        <!-- Summaray -->
         <div class="courses-area section-padding40 fix">
            <div class="container">
                <div class="courses-actives" style="overflow: hidden;">
                   <div class="col-lg-8 col-md-4 col-sm-8 cnt-check-left">
		              <div class="single-services mb-30">
		                 <div class="features-caption">
		                    <h3> Order Details </h3>
		                    
		                  <%--   <% 
				       	 		if(user != null){
		                    % --%>
			                    <c:forEach var="listDetail" items="${ItemsOrder}">
			                   		<div class="col-xl-12 col-md-12" style=" overflow: hidden; padding: 10px 0;">
			                   		
						                <div class="img-item">
						                    <a href=""><img src="../resources/assets/img/courses/course-01.jpg" alt="" ></a>
						                </div>
						                
						                <div class="content-item">
						                    <div class="title-item">
						                        <h2><c:out value="${listDetail.value.course.courseTitle}"></c:out></h2>
						                    </div>
						                     <div class="price-item">
						                    	<span><c:out value="${listDetail.value.course.priceCourse}"></c:out></span>
						               		</div>
						               		<div class="discount-item">
						                    	<span><c:out value="${listDetail.value.course.priceCourse}"></c:out></span>
						               		</div>
						                </div>
				               
			            			</div>
			                   	</c:forEach>                   	
		                </div>
		             </div>
          			</div>
          			<div class="col-lg-4 col-md-4 col-sm-8 cnt-check-right">
		              	<div class="single-services mb-30">
		                	<div class="features-icon">
		                 	</div>
		                 	<%if(user1 != null){ %>
		                 		<div class="features-caption">
			                       	<h3>Summary</h3>
			                   		<p>Original Price: <span>${TotalPrice} $</span></p>
			                   		<%-- <%if(){%>
			                   			<p>Coupon Discount: <span>0$</span></p>
			                   		<%}else{ %> --%>
			                   			<p>Coupon Discount: <span>0 $</span></p>
			                   		<%-- <%} %> --%>
			                   		<p>Total: <span>${TotalPrice} $</span></p>
		                		</div>
		                 	<%}else{ %>
		                 		<div class="features-caption">
			                       	<h3>Summary</h3>
			                   		<p>Original Price: <span>0 $</span></p>
			                   		<p>Total: <span>0 $</span></p>
		                		</div>
		                 	<%} %>
		                    	
		             		</div>
		             		<div class="features-caption">
			                	<h3>Checkout</h3>
			                	<p>Money Number: <span><%=user1.getAmount()%>$</span></p>
			                	<p>Your Email: <span><%=user1.getEmail() %></span></p>
		                 	</div>
		                 	<div class="features-icon">
			                	<h3 style="text-align: center;  cursor: pointer; background-color: #4255a4;"><a href="/learntogether/payment/paydetail">Proceed to payment</a></h3>			                	
		                 	</div>
          				</div>
                	</div>
            	</div>
       		 </div>  
        <!-- Courses area start -->

        <!-- Services End -->
    </main>
   
    <footer>
        <div class="footer-wrappper footer-bg">
           <!-- Footer Start-->
           <div class="footer-area footer-padding">
               <div class="container">
                   <div class="row justify-content-between">
                       <div class="col-xl-4 col-lg-5 col-md-4 col-sm-6">
                           <div class="single-footer-caption mb-50">
                               <div class="single-footer-caption mb-30">
                                   <!-- logo -->
                                   <div class="footer-logo mb-25">
                                       <a href="index.html"><img src="../resources/assets/img/logo/logo2_footer.png" alt=""></a>
                                   </div>
                                   <div class="footer-tittle">
                                       <div class="footer-pera">
                                           <p>The automated process starts as soon as your clothes go into the machine.</p>
                                       </div>
                                   </div>
                                   <!-- social -->
                                   <div class="footer-social">
                                       <a href="#"><i class="fab fa-twitter"></i></a>
                                       <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                       <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-3 col-md-4 col-sm-5">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle">
                                   <h4>Our solutions</h4>
                                   <ul>
                                       <li><a href="#">Design &amp; creative</a></li>
                                       <li><a href="#">Telecommunication</a></li>
                                       <li><a href="#">Restaurant</a></li>
                                       <li><a href="#">Programming</a></li>
                                       <li><a href="#">Architecture</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle">
                                   <h4>Support</h4>
                                   <ul>
                                       <li><a href="#">Design &amp; creative</a></li>
                                       <li><a href="#">Telecommunication</a></li>
                                       <li><a href="#">Restaurant</a></li>
                                       <li><a href="#">Programming</a></li>
                                       <li><a href="#">Architecture</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle">
                                   <h4>Company</h4>
                                   <ul>
                                       <li><a href="#">Design &amp; creative</a></li>
                                       <li><a href="#">Telecommunication</a></li>
                                       <li><a href="#">Restaurant</a></li>
                                       <li><a href="#">Programming</a></li>
                                       <li><a href="#">Architecture</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
           <!-- footer-bottom area -->
              <!-- Footer End-->
          </div>
      </footer> 
</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>
