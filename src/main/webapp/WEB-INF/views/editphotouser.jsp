

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"

    
   	import="tp.kits3.learntogether.user.vo.User" 
    
    %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<% String contextPath=request.getContextPath(); %>

<%
/**
 * @author Cong
 *
 */

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style1.css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/slicknav.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/flaticon.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/progressbar_barfiller.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/gijgo.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/animate.min.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/animated-headline.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/themify-icons.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/slick.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/nice-select.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/style.css">
	<link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/custom.css">
	
</head>
<body>
   
    
<!-- --------------------Form edit --------------------------- -->

<%@ include file = "header.jsp" %>
<div class="form-user">
    <div class="pc-layout">
       <div class="row" >
        <div class="col-3">
            <ul>
               <!--  <li><a href="">View public profile</a></li> -->
                               <li style="height: 116px; position: relative; overflow: hidden;"><img src="<%=contextPath1 %>/resources/images/<%=user.getUrlimg() %>" alt="" style="width: 100%;    right: 100px; width: 40%; border-radius: 50%;position: absolute;"></li>
                 	<a style="margin-left: 60px"><%=user.getFullname() %></a>
                <li style="margin:0; padding: 10px 0"><a href="/learntogether/updateUser" style="color: black;padding-right: 233px; padding-left: 10px" >Profile</a></li>
                <li style="margin:0;padding: 10px 0"><a href="/learntogether/update/photoUser" style="color: black;padding-right: 233px; padding-left: 10px">Photo</a></li>
                <li style="margin:0;padding: 10px 0"><a href="<%=contextPath1%>/change-pwd-page" style="color: black;padding-right: 103px; padding-left: 10px">Change Password</a>
				<li style="margin:0;padding: 10px 0"><a href="/learntogether/" style="color: black;padding-right: 233px; padding-left: 10px">Home</a></li>
            </ul>
        </div>
        <div class="col-9">
          
            <div class="info-user">
                
                  
       

                    <h2 style="text-align: center; margin-bottom: 30px;font-size: 3rem">Upload your photo</h2>

				
				<form action="savefile" method="post" enctype="multipart/form-data">  
					Select File: <input type="file" name="file"/>  
					<input type="submit" value="Upload File"/>  
				</form>  
            </div>
        </div>
       </div>
        

    </div>

</div>
</body>
<style>
	.form-user .pc-layout li:hover{
	background-color: #8a92a3
}
.form-user .pc-layout li:hover a{
	color: white !important
}
.form-user .pc-layout li:first-child:hover{
	background-color: white
}
.form-user .pc-layout{
    border: 1px solid #dcdcdc;
    padding: 10px;
}
.form-user .pc-layout .col-3{
    border-right: 1px solid #dcdcdc;
}
</style>
</html>