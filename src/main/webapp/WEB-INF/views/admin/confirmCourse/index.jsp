<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<%
	String contextPath = request.getContextPath();
%>

<!--  @author NguyenDoanNam -->

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="article">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../navagation.jsp" />
				<div class="col-xl-10 col-lg-10">
					<div class="content">
						<div class="row top">
							<h3 class="col-xl-10 col-lg-10">Confirm Course</h3>
						</div>
						<c:if test="${not empty message }">
							<div class="alert alert-${alert}" role="alert">${message}</div>
						</c:if>
						<div class="table_style">
							<jsp:include page="_table.jsp" />
						</div>
						<jsp:include page="_view.jsp" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('table .edit').on('click', function() {	
		var id = $(this).parent().find('#id').val();
			$.ajax({
				type : 'GET',
				dataType: 'json',
				url : "<%=contextPath%>/admin/course/" + id,
				success : function(data) {
					$(".idCourse").html(data.id);
					$(".coursetitle").html(data.coursetitle);
					$(".description").html(data.description);
					$(".pricecourse").html(data.pricecourse);
					$(".language").html(data.language);
					$(".courseLevel").html(data.courseLevel.levelName);
					$(".numstudent").html(data.numstudent);
					$(".createdate").html(data.createdate);
					$(".lasteupdate").html(data.lasteupdate);
					$(".instructor").html(data.instructor.user.email);
					$(".category").html(data.category.categoryName);
					$(".urlimg").html(data.urlimg);
				}
			});
		});
		$('table .edit').on('click', function() {	
			var id = $(this).parent().find('#id').val();
				$.ajax({
					type : 'GET',
					dataType: 'json',
					url : "<%=contextPath%>/admin/sectionByCourseId/" + id,
					success : function(data) {
						$("#accordion").html(loadData(data));
						$('#accordion .showLession').on('click', function() {	
							var idSection = $(this).parent().find('.sectionId').val();
							$.ajax({
								type : 'GET',
								dataType: 'json',
								url : "<%=contextPath%>/admin/lessonBySectionId/" + idSection,
								success : function(dataLesson) {
									var x = ".lesson" + idSection;
									$(x).html(loadLesson(dataLesson));
								}
							});
							$.ajax({
								type : 'GET',
								dataType: 'json',
								url : "<%=contextPath%>/admin/testBySectionId/" + idSection,
								success : function(dataTest) {
									$(".test").html(loadTest(dataTest));
									$('.test .showQuestion').on('click', function() {
										var idType = $(this).parent().find('.typeId').val();
										var idTest = $(this).parent().find('.testId').val();
										if(idType == 1)
											{
											$.ajax({
												type : 'GET',
												dataType: 'json',
												url : "<%=contextPath%>/admin/multiByTestId/" + idTest,
												success : function(dataMulti) {
													var t = ".question" + idTest;
													$(t).html(loadMulti(dataMulti));
												}
											});
											}
										else
											{
											$.ajax({
												type : 'GET',
												dataType: 'json',
												url : "<%=contextPath%>/admin/essayByTestId/" + idTest,
												success : function(dataEssay) {
													var t = ".question" + idTest;
													$(t).html(loadEssay(dataEssay));
												}
											});
											}
									});
								}
							});
							});
					}
				});
			});
		$('.urlimg').on('click', function() {	
			var src = $(this).text();
			$('.modal').modal('show');
			img = "<%=contextPath%>/resources/images/upload/" + src;
			$('#popup-img').attr('src', img);
		});
		function loadData(data){
			 var card= "";
			 if(data.length==0)
				 {
				 card += "<p style='color:red'>No data</p>";
				 }
			 else
				 {
				 $.each(data, function (index) {
					 card += "<div class='card'>";
					 card += "<div class='card-header' id='heading"+ data[index].id + "'>";
					 card += "<h5 class='mb-0'>";
					 card += "<button class='showLession btn btn-link' data-toggle='collapse' data-target='#collapse"+ data[index].id + "' aria-expanded='false' aria-controls='collapse" + data[index].id + "'>";
					 card += "Secsion " + parseInt(index+1);
					 card += "</button>";
					 card += "<input type='hidden' class='sectionId' value="+ data[index].id +">";
					 card += "</h5>";
					 card += "</div>";
					 card += "<div id='collapse"+ data[index].id + "' class='collapse' aria-labelledby='heading"+ data[index].id + "' data-parent='#accordion'>";
					 card += "<div class='card-body'>";
					 if(data[index].title == "" || data[index].title==null)
					 {
			          card += "<p style='color:red'>Title: No data</p>";
					 }
				     else {
				    	 card += "<p>Title: " + data[index].title + "</p>";
			         }
					 if(data[index].description==null)
						 {
				     card += "<p style='color:red'> Description: No data</p>";
						 }
					 else {
						 card += "<p> Description: " + data[index].description + "</p>";
					}
					 card += "<h5>LESSON</h5>";
					 card += "<div class='lesson" + data[index].id + "'>"; //lesson1
					 card += "</div>";
					 card += "</br>";
					 card += "<h5>TEST</h5>";
					 card += "<div class='test'>";
					 card += "</div>";
					 card += "</div>";
					 card += "</div>";
					 card += "</div>";
	                });
				 
				 }
		
			 return card;
		}
		function loadLesson(dataLesson){
			 var lesson= "";
			 if(dataLesson.length==0 || dataLesson == null)
				 {
				 lesson += "<p style='color:red'>No data</p>";
				 }
			 else
				 {
				 $.each(dataLesson, function (index) {
					 lesson += "<div class='card'>";
					 lesson += "<div class='card-header' id='headingTwo"+ dataLesson[index].id + "'>";
					 lesson += "<h5 class='mb-0'>";
					 lesson += "<button class=' btn btn-link' data-toggle='collapse' data-target='#collapseTwo"+ dataLesson[index].id + "' aria-expanded='false' aria-controls='collapseTwo" + dataLesson[index].id + "'>";
					 lesson += "Lesson " + parseInt(index+1);
					 lesson += "</button>";
					 lesson += "</h5>";
					 lesson += "</div>";
					 lesson += "<div id='collapseTwo"+ dataLesson[index].id + "' class='collapse' aria-labelledby='headingTwo"+ dataLesson[index].id + "' data-parent='.lesson"+ dataLesson[index].section.id + "'>";
					 lesson += "<div class='card-body'>";
					 if(dataLesson[index].title == "" || dataLesson[index].title==null)
					 {
						 lesson += "<p style='color:red'>Title: No data</p>";
					 }
				     else {
				    	 lesson +="<p>Title: " + dataLesson[index].title + "</p>";
			         }
					 if(dataLesson[index].urlvid == "" || dataLesson[index].urlvid==null)
					 {
						 lesson += "<p style='color:red'>Url: No data</p>";
					 }
				     else {
				    	 lesson += "<p> Url: " + dataLesson[index].urlvid + "</p>";
			         }
					 lesson += "</div>";
					 lesson += "</div>";
					 lesson += "</div>";
	                });
				 
				 }
			 return lesson;
		}
		function loadTest(dataTest){
			var test = "";
			if(dataTest.length==0 || dataTest == null)
				{
				test += "<p style='color:red'>No data</p>";
				}
			else
			{
				 $.each(dataTest, function (index) {
					 test += "<div class='card'>";
					 test += "<div class='card-header' id='headingTest"+ dataTest[index].id + "'>";
					 test += "<h5 class='mb-0'>";
					 test += "<button class='showQuestion btn btn-link' data-toggle='collapse' data-target='#collapseTest"+ dataTest[index].id + "' aria-expanded='false' aria-controls='collapseTest" + dataTest[index].id + "'>";
					 test += "Test " + parseInt(index+1);
					 test += "</button>";
					 test += "<input type='hidden' class='typeId' value="+ dataTest[index].testtype.id +">";
					 test += "<input type='hidden' class='testId' value="+ dataTest[index].id +">";
					 test += "</h5>";
					 test += "</div>";
					 test += "<div id='collapseTest"+ dataTest[index].id + "' class='collapse' aria-labelledby='headingTest"+ dataTest[index].id + "' data-parent='.test'>";
					 test += "<div class='card-body'>";
					 if(dataTest[index].title == "" || dataTest[index].title==null)
					 {
						 test += "<p style='color:red'>Title: No data</p>";
					 }
				     else {
				    	 test += "<p>Title: " + dataTest[index].title + "</p>";
			         }
					 test += "<p> Test type: " + dataTest[index].testtype.type + "</p>";
					 test += "<h5>QUESTION</h5>";
					 test += "<div class='question" + dataTest[index].id + "'>";
					 test += "</div>";
					 test += "</div>";
					 test += "</div>";
					 test += "</div>";
	                });
				 
				 }
			return test;
		}
		function loadEssay(dataEssay){
			var essay = "";
			if(dataEssay.length==0)
				{
				essay += "<p style='color:red'>No data</p>";
				}
			else
			{
				 $.each(dataEssay, function (index) {
					 essay += "<div class='card'>";
					 essay += "<div class='card-header' id='headingEssay"+ dataEssay[index].id + "'>";
					 essay += "<h5 class='mb-0'>";
					 essay += "<button class='btn btn-link' data-toggle='collapse' data-target='#collapseEssay"+ dataEssay[index].id + "' aria-expanded='false' aria-controls='collapseEssay" + dataEssay[index].id + "'>";
					 essay += "Question " + parseInt(index+1);
					 essay += "</button>";
					 essay += "</h5>";
					 essay += "</div>";
					 essay += "<div id='collapseEssay"+ dataEssay[index].id + "' class='collapse' aria-labelledby='headingEssay"+ dataEssay[index].id + "' data-parent='.question" + dataEssay[index].test.id + "'>";
					 essay += "<div class='card-body'>";
					 if(dataEssay[index].title == "" || dataEssay[index].title==null)
					 {
						 essay += "<p style='color:red'>Title: No data</p>";
					 }
				     else {
				    	 essay += "<p>Title: " + dataEssay[index].title + "</p>";
			         }
					 essay += "</div>";
					 essay += "</div>";
					 essay += "</div>";
	                });
				 
				 }
			return essay;
		}
			function loadMulti(dataMulti){
				var multi = "";
				if(dataMulti.length==0)
					{
					multi += "<p style='color:red'>No data</p>";
					}
				else
				{
					 $.each(dataMulti, function (index) {
						 multi += "<div class='card'>";
						 multi += "<div class='card-header' id='headingmulti"+ dataMulti[index].id + "'>";
						 multi += "<h5 class='mb-0'>";
						 multi += "<button class='btn btn-link' data-toggle='collapse' data-target='#collapsemulti"+ dataMulti[index].id + "' aria-expanded='false' aria-controls='collapsemulti" + dataMulti[index].id + "'>";
						 multi += "Question " + parseInt(index+1);
						 multi += "</button>";
						 multi += "</h5>";
						 multi += "</div>";
						 multi += "<div id='collapsemulti"+ dataMulti[index].id + "' class='collapse' aria-labelledby='headingmulti"+ dataMulti[index].id + "' data-parent='.question" + dataMulti[index].test.id + "'>";
						 multi += "<div class='card-body'>";
						 if(dataMulti[index].title == "" || dataMulti[index].title==null)
						 {
							 multi += "<p style='color:red'>Title: No data</p>";
						 }
					     else {
					    	 multi += "<p>Title: " + dataMulti[index].title + "</p>";
				         }
						 multi += "</div>";
						 multi += "</div>";
						 multi += "</div>";
		                });
					 
					 }
				return multi;
		}
		
	</script>
	<script src="<%=contextPath%>/resources/js/custom.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>