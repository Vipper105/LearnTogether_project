
<!--  @author NguyenDoanNam -->
<%
	String contextPath = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div class="header-area ">
		<div class="header-top_area">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-6 col-md-6 ">
						<div class="social_media_links">
							<a href="#" style="text-decoration: none;"><img
								src="<%=contextPath%>/resources/images/logo.png" width="50px"> Admin</a>
						</div>
					</div>
					<div class="col-xl-6 col-md-6">
						<div class="short_contact_list">
							<ul>
								<li onmouseleave="mouseleave('info')"><a href="#"
									onclick="info('info')">Nam <i class="fa fa-caret-down"
										aria-hidden="true"></i></a>
									<ul id="info">
										<li><a href="#">> Info</a></li>
										<li><a href="<%=contextPath%>/logout">> Log out</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>