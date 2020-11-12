<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <%
 	/*
 	**
 	*@author VoDucHoa
 	*/
 	String contextPath = request.getContextPath();
 %>
 
<html class="no-js" lang="us">
<head>
	<title>Home</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Cart</title>
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
	<link rel="stylesheet"	href="resources/assets/css/progressbar_barfiller.css">
	<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
	<link rel="stylesheet" href="resources/css/customeIndex.css">
	<link rel="stylesheet" href="resources/css/login.css">
</head>

<style>
	.img-item{width: 20%; float: left;}
	.img-item a {display: inline-block;}
	.img-item a img{ width: 100%;}
	.content-item{width: 80%; float: left; padding-left: 10px; box-sizing: border-box; vertical-align: middle;}
</style>

<body>
<%
		Cookie[] cookies = request.getCookies();

		String username = "";
		String password = "";
		String remem = "";
			if (cookies != null) {
				boolean isExistedCookie=false;
				for (Cookie cook : cookies) {
					if(cook.getName().equals(Contansts.COOKIE_REMEMBER)){
						isExistedCookie=true;
						remem=cook.getValue();
					}
					
				}
				 
				if(isExistedCookie){
					for(Cookie cook:cookies){
						if(cook.getName().equals(Contansts.COOKIE_NAME)){
							if(remem.equals("1")){
								username = cook.getValue();
								System.out.println(username);
							}else{
								//System.out.println("Delete cookie");
								cook.setMaxAge(0);
								cook.setValue(null);
								response.addCookie(cook);
							}
						}else if(cook.getName().equals(Contansts.COOKIE_PASSWOD)){
							if(remem.equals("1")){
							   password = cook.getValue();
							}else{
								cook.setMaxAge(0);
								cook.setValue(null);
								response.addCookie(cook);
							}
						}else if(cook.getName().equals(Contansts.COOKIE_PASSWOD)){
							if(remem.equals("1")){
								//remem = cook.getValue();
							}else{
								cook.setMaxAge(0);
								cook.setValue(null);
								response.addCookie(cook);
							}
						}
					}
				}
			}else{
				System.out.println("Cookie is not Existed");
			}
	%>
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
	                                <h1 data-animation="bounceIn" data-delay="0.2s">Cart Page</h1>
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
   		
       <section class="items-area">
		    <div class="container">
		        <div class="row">
		        	
		       	 	<h1><c:out value="${ItemsOrder.value.quantity}"></c:out></h1>
		       	 	<p>${TotalQuantityModel}</p>
		       	 	<%
		       			HttpSession session1 = request.getSession();
						User user = (User) session1.getAttribute(Contansts.USER_LOGGED);
						
		       	 		if(user != null){
		       	 			if(!session1.getId().isEmpty()){
		       	 	%> 
		        	<c:forEach items="${ItemsOrder}" var="listItem" >
		        		<c:url value="/removeCart" var="rmCart">
		        			<c:param name="idcourseRemove" value="${listItem.value.course.id}"></c:param>
		        		</c:url>
		        	
		        		<div class="col-xl-12 col-md-12 padding-bottom">
			                <div class="img-item">
			                    <a href=""><img src="resources/assets/img/courses/course-01.jpg" alt="" ></a>
			                </div>
			                <div class="content-item">
			                    <div class="title-item">
			                        <h2><c:out value="${listItem.value.course.courseTitle}"></c:out></h2>
			                    </div>
			                    <div class="rating-item">
			                        <span><c:out value="${listItem.value.course.description}"></c:out></span>
			                    </div>
			                     <div class="price-item">
			                    	<span>
			                    		<c:out value="${listItem.value.course.priceCourse}"></c:out>
			                    	</span>
			               		</div>
			                </div>
			                <div class="crud-item">
			                    <span class="rm-item">
			                        <a href="${rmCart}" onclick="removeCart">Remove</a>
			                    </span>
			                </div>  
		            	</div> 
		        	</c:forEach>
		        	<div class="col-xl-12 col-md-12 padding-bottom">
			               <div class="checkout-cart">
			               		<p class="total-item">Total : </p>  
			               		<p class="total-price">${TotalPrice}$</p>
			               		<a href="/learntogether/payment/checkout">checkout</a>
		               			 <c:if test="${!empty user}">
		               				<a href="/learntogether/payment/checkout">checkout</a>
		               			</c:if> 
			               </div>
		            </div>
		        	<%}else{%>
		       	 			<h1>none</h1>
		       	 	<%}}%>
		        	
		       	 	<% if(user == null){%>
			        	<c:forEach items="${ItemsOrder}" var="listItem" >
		        		<c:url value="/removeCart" var="rmCart">
		        			<c:param name="idcourseRemove" value="${listItem.value.course.id}"></c:param>
		        		</c:url>
		        	
		        		<div class="col-xl-12 col-md-12 padding-bottom">
			                <div class="img-item">
			                    <a href=""><img src="resources/assets/img/courses/course-01.jpg" alt="" ></a>
			                </div>
			                <div class="content-item">
			                    <div class="title-item">
			                        <h2><c:out value="${listItem.value.course.courseTitle}"></c:out></h2>
			                    </div>
			                    <div class="rating-item">
			                        <span><c:out value="${listItem.value.course.description}"></c:out></span>
			                    </div>
			                     <div class="price-item">
			                    	<span>
			                    		<c:out value="${listItem.value.course.priceCourse}"></c:out>
			                    	</span>
			               		</div>
			                </div>
			                <div class="crud-item">
			                    <span class="rm-item">
			                        <a href="${rmCart}" onclick="removeCart">Remove</a>
			                    </span>
			                </div>  
		            	</div> 
		        	</c:forEach>
		        		<!-- <div style="padding-left: 20px; font-weight: bold;">Cart Item None</div> -->
		        		<div class="col-xl-12 col-md-12 padding-bottom">
			               <div class="checkout-cart">
			               		<p class="total-item">Total : </p>  
			               		<p class="total-price">${TotalPrice}$</p>
			               		
			               		<a href="#" onclick="document.getElementById('show-form').style.display='block'">checkout</a>
			               </div>
		           	 	</div>
		           	 	
		           	 	<!-- Form Login -->
		           	 	
		           	 	<div id="show-form" class="modal" >
						  <form class="modal-content animate cts-form" action="login" method="post">
						    <div class="imgcontainer">
						      <span onclick="document.getElementById('show-form').style.display='none'" class="close" title="Close Modal">&times;</span>
						      <img src="resources/assets/img/logo/loder.png" alt="Avatar" class="avatar">
						    </div>
						
						    <div class="container">
						      <label for="uname"><b>Username</b></label>
						      <input type="text" placeholder="Enter Username/Email" name="uname"
											class="cancelForm disableCopyPaste" id="name"
											onkeypress="return blockSpecialChacter(event)" onclick='cancelForm'
											value="<%=username%>">
							  <p style="color: red;">${resultUserName}</p>
							  
						     <label for="password"><b>Password</b></label> 
						     <input type="password"
											placeholder="Enter Password" name="password"
											class="cancelForm disableCopyPaste" id="password"
											value="<%=password%>">
						      <p style="color: red; text-align: center;">${resultLogin}</p>
						      <button type="submit" id="btn">Login</button>
								<label> <input id="rb-checkbox" type="checkbox"
									name="remember" value="1" checked="checked" onclick="changeValue()" />
									Remember	
								</label>
								
						    </div>
						    
						    <div class="container" style="background-color: #f1f1f1">
								<button type="button" class="cancelbtn" onclick="document.getElementById('show-form').style.display='none'">Cancel</button>
								<span class="psw">Forgot <a href="<%=contextPath%>/forgot-pwd-page">password?</a></span>
								<span class="rgt"><a href="<%=contextPath%>/register-page">Register</a></span>
							</div>
						  </form>
						</div>
		        	<%}%>
		        	
		        </div>
		    </div>
		</section>
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
                                       <a href="/learntogehter/"><img src="resources/assets/img/logo/logo2_footer.png" alt=""></a>
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
      <script>
	// Get the modal
	    var modal = document.getElementById('show-form');
		
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	</script>
	<script src="<%=contextPath%>/resources/js/custom.js"></script>
      <script type="text/javascript">
      	function removeCart() {
			var xhr = new XMLHttpRequest();
			 xhr.open('GET', '/removeCart' , true);
		     xhr.onreadystatechange = function() {
		    	 if (this.readyState == 4 && this.status == 200) {
		      			var itemCart = JSON.parse(this.responseText);
		      			console.log(itemCart);
			         } 
			};
		    xhr.send();
		}
      </script>
</body>
</html>
