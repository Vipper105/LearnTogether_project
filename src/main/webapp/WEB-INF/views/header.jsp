<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@page import="tp.kits3.learntogether.user.vo.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<%-- <%@ page session="false"%> --%>

<%
	/*
	*
	*@author Hoa
	*
	*/
%>

<%
	String contextPath1 = request.getContextPath();
	HttpSession ss = request.getSession();


	User user = (User) ss.getAttribute(Contansts.USER_LOGGED);
%>
	
	<header>
		<!-- Header Start -->
		<div class="header-area header-transparent">
			<div class="main-header ">
				<div class="header-bottom  header-sticky">
					<div class="container-fluid">
						<div class="row align-items-center col-xs-12">
							<!-- Logo -->
							<div class="col-xl-2">
								<div class="logo">
									<a href="/learntogether/"><img
										src="/learntogether/resources/assets/img/logo/logo.png" alt=""></a>
								</div>
							</div>
							<div class="col-xl-10">
								<div class="menu-wrapper d-flex align-items-center justify-content-end">
									<!-- Main-menu -->
									<div class="main-menu d-none d-lg-block">
										<nav class="menu">
											<ul id="navigation" style="width: 967px">
												<li><a href="/learntogether/">Home</a></li>
												<li><a href="/learntogether/about">About</a></li>
												<li><a href="/learntogether/courses">Courses</a>
													<ul class="submenu">
														<%
															/*
															*@author pho
															*/
														%>
														<li>
															<c:forEach var="cate" items="${cate}">
																<c:set var="a" value="${cate.categoryName}"></c:set>
																<c:set var= "b" value="${fn:replace(a, '_', ' ')}"></c:set>
                      											<a href="<%=contextPath1%>/courses/${cate.categoryName}">${fn:replace(b, "and", "&")}</a>
                     										</c:forEach>
														</li>
													</ul>
												</li>
												<li><a href="/learntogether/contact">Contact</a></li>
												<!-- cart -->
												<div class="cart-header" id="">
													<a href="/learntogether/cart">
														<i class="fa fa-shopping-cart" aria-hidden="true"></i>
														<c:choose>
															<c:when  test="${ItemsOrder != null }">
																<span>[<c:out value="${TotalQuantity}"></c:out>]</span> 
															</c:when>
															<c:otherwise>
																<span>[0]</span>
															</c:otherwise>
														</c:choose>
														<%-- <%if(${ItemsOrder} != null){ %>
														
														
														<%}else{ %>
														 
														<%} %> --%>
													</a>
												</div> 
												
												<%
													/*
													*@author Huy
													*
													*/
														/* HttpSession ss = request.getSession(); */

														//String username = (String) session2.getAttribute(Contansts.USER_LOGGED);
														/* User user = (User) ss.getAttribute(Contansts.USER_LOGGED); */
														
														if (user != null) {%>
														
															<p style="display: none">
														welcome <span style="color: red;"><%=user.getUsername()%></span>
														login success
													</p>
													<div class="margin-left instructor-header">
														<a href="<%=contextPath1%>/instructor/courses" style="color: white; font-size: 17px">Instructors</a>
													</div>
													<%-- <li class="button-header margin-left "><a href="<%=contextPath1%>/change-pwd-page" class="btn">Change password</a></li> --%>
                                                	<li class="button-header"><a href="<%=contextPath1%>/logout" class="btn btn3" style="height: 52px; line-height: 0px">Logout</a></li>
                                                	<%
	                                                	/*
	                                                	*@author cong
	                                                	*
	                                                	*/
                                                	%>
                                                	<%
                                                		HttpSession sss = request.getSession();
                                                	User user1 = (User) ss.getAttribute(Contansts.USER_LOGGED);
                                                	%>
                                                	<li class="avatar li-menu">
                                                        <a href="/learntogether/updateUser"><img src="<%=contextPath1 %>/resources/images/<%=user.getUrlimg() %>" alt=""></a>
                                                        <div class="dropdown-avatar">
                                                            <ul class="profile">
                                                                <ul class="profile-left">
                                                                    <li class="avatar"><a href="/learntogether/updateUser"><img src="<%=contextPath1 %>/resources/images/<%=user1.getUrlimg() %>" alt=""></a></li>
                                                                </ul>
                                                               
                                                                <ul class="profile-right">
                                                                    <li><div style="width: 150px"><h3><a href="/learntogether/updateUser"style="font-size: 15px ; overflow: hidden; text-overflow: ellipsis; text-transform: none"><%=user.getFullname() %></a></h3></div></li>
                                                                    <li > <div style="width: 150px"><a href="/learntogether/updateUser"style="font-size: 10px ; overflow: hidden; text-overflow: ellipsis;text-transform: none"><%=user.getEmail() %></a></div> </li>
                                                                </ul>
                                                                    
                                                            </ul>
                                                            
                                                            <ul>
                                                                <li><a href="/learntogether/mycourses">My courses</a></li>
                                                                <li><a href="/learntogether/cart">Cart</a> </li>
                                                                <li><a href="#">Whistlist</a></li>
                                                              <!--   <li><a href="">Instructor Dashboard</a></li> -->
                                                            </ul>
                                                            <!-- <ul>
                                                                <li><a href="">Noticifations</a></li>
                                                                <li><a href="">Message</a></li>
                                                            </ul> -->
                                                           <!--  <ul>
                                                                <li><a href="">Account Settings</a></li>
                                                                <li><a href="">Payment method</a></li>
                                                                <li><a href="">Udemy Credits</a></li>
                                                                <li><a href="">Purchase History</a></li>
                                                            </ul> -->
                                                            <ul>
                                                               <!--  <li><a href="">Public Profile</a></li> -->
                                                                <li><a href="/learntogether/updateUser">Edit Profile</a></li>
                                                            </ul>
                                                            <ul>
                                                                <!-- <li><a href="">Help</a></li> -->
                                                                <li><a href="<%=contextPath1%>/logout">Log out</a></li>
                                                            </ul>
                                                        </div>
                                                </li>
													<%
														} else {
													%>
													<li class="button-header margin-left "><a href="<%=contextPath1%>/register-page" class="btn">Sign up</a></li>
                                                	<li class="button-header"><a href="<%=contextPath1 %>/login-page" class="btn btn3"  onclick="document.getElementById('show-form').style.display='block'">Log in</a></li>

													<%
														}
													%>
												  <!-- Button -->
											</ul>	
												
										</nav>
								
										</div>
									
									</div>
								</div>
							</div>
						</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		<!-- Header End -->
	</header>