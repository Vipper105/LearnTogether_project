
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="org.springframework.ui.Model" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Payment Detail</title>
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
<%
	String contextPath = request.getContextPath();
	HttpSession session1 = request.getSession();
	User user1 = (User) session1.getAttribute(Contansts.USER_LOGGED);
	if( user1.getAmount() < 1.0 ) { user1.setAmount(100.0); }
%>

<style>
	.method-pay{overflow: hidden; padding: 10px 0;}
	.cus-methodpay{
		float: left;
		cursor: pointer;
		/* background-color: #d4d6d9; */
		padding: 0;
	}
	.cus-methodpay h2{margin-bottom: 0; margin-right: 5px; background-color: #d4d6d9; text-align: center;}
	.cus-methodpay h2 a{box-sizing: border-box; text-align: center; display: inline-block; width: 100%;}
</style>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<main>
		 <section class="slider-area slider-area2">
	        <div class="slider-active">
	            <!-- Single Slider -->
	            <div class="single-slider slider-height2">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-xl-8 col-lg-11 col-md-12">
	                            <div class="hero__caption hero__caption2">
	                                <h1 data-animation="bounceIn" data-delay="0.2s">Payment Method</h1>
	                                <!-- breadcrumb Start-->
	                                <nav aria-label="breadcrumb">
	                                    <ol class="breadcrumb">
	                                        <li class="breadcrumb-item"><a href="/learntogether/">Home</a></li>
	                                        <li class="breadcrumb-item"><a href="#">Payment Method</a></li> 
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
    	  <div class="courses-area section-padding40 fix">
            <div class="container">
                <div class="courses-actives" style="overflow: hidden;">
                   <div class="col-lg-8 col-md-4 col-sm-8 cnt-check-left">
		              <div class="single-services mb-30">
		                <h1>Select Payment Method</h1>
		                
		                <div class="method-pay">
		                	<div class="col-lg-4 col-md-4 col-sm-4 cus-methodpay">
		                		<h2><a href="#">ZaloPay</a></h2>
		                	</div>
		                	<div class="col-lg-4 col-md-4 col-sm-4 cus-methodpay">
		                		<h2><a href="#">Momo E-Wallet</a></h2>
		                	</div>
		                	<div class="col-lg-4 col-md-4 col-sm-4 cus-methodpay">
		                		<h2><a href="#">Paypal</a></h2>
		                	</div>
		                </div>
		                
		                <div class="requeit-pay">
		                	<h3>Ensure you have these ready:</h3>
		                	<p>1. Password for ZaloPay login.</p>
		                	<p>2. Your mobile number registered for ZaloPay is active.</p>
		                	<p>3. Installed ZaloPay mobile app.</p>
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
		             			<%if(user1 != null){ %>
			             		<div class="features-caption">
				                	<h3>Checkout</h3>
				                	<p>Money Number: <span><%=user1.getAmount()%>$</span></p>				                	
			                 	</div>
			                 	<div class="features-icon">
				                	<h3 style="text-align: center;  cursor: pointer; background-color: #4255a4;"><a href="<%=contextPath %>/payment/payment_detail" id="myBtn">Pay Now</a></h3>			                	
			                 	</div>
			                 	<%}else{ %>
			                 		<div class="features-caption">
				                	<h3>Checkout</h3>
				                	<p>Money Number: <span>0 $</span></p>				                	
			                 	</div>
			                 	<div class="features-icon">
				                	<h3 style="text-align: center;  cursor: pointer; background-color: #4255a4;"><a href="<%=contextPath %>/courses">Pay Now</a></h3>			                	
			                 	</div>
			                 	<%} %>
          				</div>
                	</div>
            	</div>
       		 </div>  
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
										<a href="index.html"><img
											src="../resources/assets/img/logo/logo2_footer.png" alt=""></a>
									</div>
									<div class="footer-tittle">
										<div class="footer-pera">
											<p>The automated process starts as soon as your clothes
												go into the machine.</p>
										</div>
									</div>
									<!-- social -->
									<div class="footer-social">
										<a href="#"><i class="fab fa-twitter"></i></a> <a
											href="https://bit.ly/sai4ull"><i
											class="fab fa-facebook-f"></i></a> <a href="#"><i
											class="fab fa-pinterest-p"></i></a>
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
			<div class="footer-bottom-area">
				<div class="container">
					<div class="footer-border">
						<div class="row d-flex align-items-center">
							<div class="col-xl-12 ">
								<div class="footer-copy-right text-center">
									<p>
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
										Copyright &copy;
										<script>
											document.write(new Date()
													.getFullYear());
										</script>
										All rights reserved | This template is made with <i
											class="fa fa-heart" aria-hidden="true"></i> by <a
											href="https://colorlib.com" target="_blank">Colorlib</a>
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer End-->
		</div>
	</footer>
	
	<%
		Double totalprice = (Double) session.getAttribute("TotalPrice");
		Boolean check = (Boolean) session.getAttribute("CheckMailSended");
	%>
	
	<h1><%=check%></h1>
	<h1><%=user1.getAmount() %></h1>
	<h1><%=totalprice %></h1>
	
	<% if(user1.getAmount() < totalprice){ %>
 	 	<jsp:include page="../notification/recharge_notification.jsp"></jsp:include>
 	<%}else{%>
 		<%if(check.equals(true)){ %>
 			<jsp:include page="../notification/payment_success.jsp"></jsp:include>
 		<%}else{ %>
 			<jsp:include page="../notification/payment_unsuccess.jsp"></jsp:include>
 		<%} %>
 	<%} %>
 	 
	<!-- script popups -->
	<script>	
		var modal = document.getElementById("myModal");
		var btn = document.getElementById('myBtn');
		var span = document.getElementsByClassName("close")[0];
<%-- 		var check = "<%=request.getAttribute("checkString")%>"; --%>
// 		console.log(check);
		btn.onclick = function(event) {
			event.preventDefault();
 			event.stopPropagation();
		  	modal.style.display = "block";		 
		}			
		
		span.onclick = function() {
			modal.style.display = "none";
			document.getElementById('link').href = "/learntogether/payment/payment_detail";
			document.getElementById('recharge').href = "/learntogether/courses";
		}
					
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		    window.location.href = "/learntogether/payment/payment_detail";
		  }
		}
	</script>
	
</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>