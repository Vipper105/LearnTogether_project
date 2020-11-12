

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
	User user2 = (User)request.getAttribute("SingleUser");

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

<div class="form-user" style="margin-bottom: 50px">
    <div class="pc-layout">
       <div class="row"style="height: 76vh">
        <div class="col-3">
            <ul>
                <!-- <li><a href="">View public profile</a></li> -->
                <li style="height: 116px; position: relative; overflow: hidden;"><img src="<%=contextPath1 %>/resources/images/<%=user.getUrlimg() %>" alt="" style="width: 100%;    right: 100px; width: 40%; border-radius: 50%;position: absolute;"></li>
                 	<a style="margin-left: 60px"><%=user.getFullname() %></a>
                <li style="margin:0; padding: 10px 0"><a href="/learntogether/updateUser" style="color: black;padding-right: 233px; padding-left: 10px">Profile</a></li>
                <li style="margin:0; padding: 10px 0"><a href="/learntogether/update/photoUser" style="color: black;padding-right: 233px; padding-left: 10px">Photo</a></li>
                <li style="margin:0; padding: 10px 0"><a href="<%=contextPath1%>/change-pwd-page" style="color: black;padding-right: 103px; padding-left: 10px">Change Password</a>
				<li style="margin:0; padding: 10px 0"><a href="/learntogether/" style="color: black; padding-left: 10px">Home</a></li>
            </ul>
        </div>
        <div class="col-9">
            <div class="header-form" style=" border-bottom: 1px solid #dcdcdc">
                <h3 style="text-align: center;font-size: 3rem">Public Profile</h3>
                <p style="text-align: center;font-size: 2rem">Add information about your self</p>
            </div>
            <div class="info-user">
                <%-- <form action="updateUser">
                    <label for="formGroupExampleInput">Basics</label>
                    <div class="form-group">
                      
                      <input value="<%=user.getFullname() %>" type="text" class="form-control" id="formGroupExampleInput" placeholder="Full Name">
                    </div>
                    <div class="form-group">
                      
                      <input value="<%=user.getAddress() %>" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Address">
                    </div>
                  
                    <button type="submit" class="btn btn-danger">Save</button>
                  </form>  --%>
                  
                 <%--  <s:form action="updateUser" modelAttribute="updateUser">
                  <label for="formGroupExampleInput">Basics</label>
                    <div class="form-group">
                    
                    <s:input style="display:none" value="<%=user2.getId() %>" type="text" class="form-control" id="formGroupExampleInput3" placeholder="Full Name" path="id" />
                    <label>Address</label>
                    <s:input value="<%=user2.getAddress() %>" type="text" class="form-control" id="formGroupExampleInput" placeholder="Address" path="address" />
                    <label>Full name</label>
                    <s:input value="<%=user2.getFullname() %>" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Full Name" path="fullname" /> 
                    <label>Birthday</label>
                    <s:input value="<%=user1.getBirthdate() %>" type="date" class="form-control" id="formGroupExampleInput3" placeholder="" path="birthdate" /> 
                    
                    <button type="submit" class="btn btn-danger" style="margin-top: 10px">Save</button>
                    </div>
                  
                  
                  </s:form>  --%>
                  <form action="updateUserProfile" method="get" style="margin-top: 30px; position: relative;height: 600px">
                  <%if(user2.getAddress()==null){
                  	
                  %>
                  		<label>Address</label>
              		  <input value="" type="text" class="form-control" id="formGroupExampleInput" placeholder="Address" name="address" style="margin-bottom: 15px; font-size: 16px; padding: 20px">
                  <%}else{ %>
                  <label>Address</label>
                  <input style="margin-bottom: 15px; font-size: 16px; padding: 20px" value="<%=user2.getAddress() %>" type="text" class="form-control" id="formGroupExampleInput" placeholder="Address" name="address">
                
                  <%} %>
                  
                  <%if(user2.getFullname()==null){
						                  
                  %>
                  
                  <label>Full Name</label>
                  	<input style="margin-bottom: 15px; font-size: 16px; padding: 20px" value="" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Full Name" name="fullName">
                  <%}else{ %>
                  <label>Full Name</label>
                  	<input style="margin-bottom: 15px; font-size: 16px; padding: 20px" value="<%=user2.getFullname() %>" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Full Name" name="fullName">
                  <%} %>
                  
                  
                  	 <%if(user2.getHeadLine()==null){
						                  
                  %>
                  <label>Headline</label>
                 	<input style="margin-bottom: 15px; font-size: 16px; padding: 20px" value="" placeholder="'Engineer at Learntogether' or 'Architect'" class="form-control" id="formGroupExampleInput2" name="headLine"><br>
                  
                  <%}else{ %>
                  <label>Headline</label>
                 	<input style="margin-bottom: 15px; font-size: 16px; padding: 20px" value="<%=user2.getHeadLine() %>" placeholder="'Engineer at Learntogether' or 'Architect'" class="form-control" id="formGroupExampleInput2" name="headLine"><br>
                  
                   <%} %>
                 	
                 	<%if(user2.getBiography()==null){
                 	
                     	           
                  %>
                  	<label>Biography</label>
                  <textarea style="margin-bottom: 15px; font-size: 16px" rows="5" cols="95" placeholder="Write something about yourself ..."class="form-control" id="formGroupExampleInput2" name="biography"></textarea>  
                 	 <%}else{ %>
                 	 <label>Biography</label>
                  <textarea style="margin-bottom: 15px; font-size: 16px" rows="5" cols="95" placeholder="Write something about yourself ..."class="form-control" id="formGroupExampleInput2" name="biography"><%=user2.getBiography() %></textarea>  
                 	   <%} %>
                 	<%if(user2.getBiography()==null){
                 	
                     	           
                  %>
                 	<label>Facebook</label><br>
                 	<input style="margin-bottom: 15px;border: 1px solid #dcdcdc; padding: 15px" type="text" value="http://www.facebook.com/" readonly>
                 	<input style="margin-bottom: 15px; position: absolute; width:650px;border: 1px solid #dcdcdc; padding: 15px" value="" placeholder="Username"     name="userNameFb" >
                 	<br>
                 	<%}else{ %>
                 	<label>Facebook</label><br>
                 	<input style="margin-bottom: 15px;border: 1px solid #dcdcdc; padding: 15px" type="text" value="http://www.facebook.com/" readonly>
                 	<input style="margin-bottom: 15px; position: absolute; width:650px;border: 1px solid #dcdcdc; padding: 15px" value="<%=user2.getUserNameFb() %>" placeholder="Username"     name="userNameFb" >
                 	<br>
                 	 <%} %>
                 	
                 	
                 	
                 	
                 	<button  type="submit" class="btn btn-danger" style="margin-top: 10px;right: 370px;
    					margin-top: 10px;position: absolute;">Save</button>
                  </form>
                  	
                   
                  
                   <%-- <h2>Spring MVC file upload example</h2>

				<form method="POST" action="<c:url value='/upload' />"
				    enctype="multipart/form-data">
				
				
				    Please select a file to upload : <input type="file" name="file" />
				    <input type="submit" value="upload" />
				
				</form> --%>
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
.form-user .pc-layout li:first-child:hover{
	background-color: white
}
.form-user .pc-layout li:hover a{
	color: white !important 
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