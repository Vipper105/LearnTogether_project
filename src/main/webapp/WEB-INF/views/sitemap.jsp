<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sitemap</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=contextPath%>/resources/assets/img/favicon.ico">
<link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/style.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/custom.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/customeIndex.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/slicknav.css">
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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/customeIndex.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/jquery.rateyo.min.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<div class="main-content" style="padding: 80px 0;">
			<div class="sitemap container">
				<div class="row">
					<h1>Sitemap</h1>
				</div>
				<div class="row">
					<h2>Local homepages</h2>
				</div>
				<div class="row">
					<div class="col-md-3"><a href="/">home</a></div>
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<h2>Categore</h2>
				</div>
				<div class="row">
					<c:forEach var="cate" items="${cate}">
						<c:set var="a" value="${cate.categoryName}"></c:set>
						<c:set var= "b" value="${fn:replace(a, '_', ' ')}"></c:set>
					<div class="col-md-3"><a href="<%=contextPath%>/courses/${cate.categoryName}">${fn:replace(b, "and", "&")}</a></div>
					</c:forEach>
				</div>
				<div class="row">
					<h2>All Courses</h2>
				</div>
				<div class="row">
					<div class="col-md-3"><a href="/learntogether/courses">Courses</a></div>
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
				</div>
				<div class="row"></div>
			</div>
		</div>
	
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<style>
	.header-transparent{
		position: relative;
		background: #4255a4;
	}
	a{color: black;}
</style>
</html>