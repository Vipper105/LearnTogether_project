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
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
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
						<div class="row">
							<div class="col-md-6 col-lg-3">
								<div class="card text-white bg-flat-color-1">
									<div class="card-body">
										<div class="card-left pt-1 float-left">
											<h3 class="mb-0 fw-r">
												<div>
													<span class="currency float-left mr-1">$</span> <span
														class="count"><span data-v-0e38f4aa="">${sumOrder}</span></span>
												</div>
											</h3>
											<p class="text-light mt-1 m-0">Revenue</p>
										</div>
										<div class="card-right float-right text-right">
											<i class="fa fa-shopping-cart icon-sta" aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="card text-white bg-flat-color-3">
									<div class="card-body">
										<div class="card-left pt-1 float-left">
											<h3 class="mb-0 fw-r">
												<div>
													<span class="count"><span data-v-0e38f4aa="">${selectTotalClient}</span></span>
												</div>
											</h3>
											<p class="text-light mt-1 m-0">Total Clients</p>
										</div>
										<div class="card-right float-right text-right">
											<i class="fa fa-users icon-sta" aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="card text-white bg-flat-color-2">
									<div class="card-body">
										<div class="card-left pt-1 float-left">
											<h3 class="mb-0 fw-r">
												<div>
													<!---->
													<span class="count"><span data-v-0e38f4aa="">${selectNewUser}</span></span>
												</div>
											</h3>
											<p class="text-light mt-1 m-0">New Users</p>
										</div>
										<div class="card-right float-right text-right">
											<i class="fa fa-arrow-circle-up icon-sta" aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="card text-white bg-flat-color-6">
									<div class="card-body ">
										<div class="card-left pt-1 float-left">
											<h3 class="mb-0 fw-r">
												<div>
													<span class="count float-left"><span
														data-v-0e38f4aa="">85</span></span> <span>%</span>
												</div>
											</h3>
											<p class="text-light mt-1 m-0">Sales Increase</p>
										</div>
										<div class="card-right float-right text-right">
											<i class="fa fa-line-chart icon-sta" aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
		
						<div class="chart">
							<div class="row">
								<div class="chartOne col-md-6 ">
									<select id="year" onchange="getYear()">
										<c:forEach var="listYear" items="${listYear}">
											<option value="${listYear}">${listYear}</option>
										</c:forEach>
									</select>
									<div class="chartBar">
										<canvas id="myChart"></canvas>
									</div>
								</div>
								<div class="chartTwo col-md-6 ">
									<div class="chartPie">
										<canvas id="myChartPie"></canvas>
									</div>
								</div>
							</div> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		$.ajax({
			type : 'GET',
			dataType: 'json',
			url : "<%=contextPath%>/admin/selectOrderYear/" + 2020,
				success : function(data) {
					$('.chartBar').html("<canvas id='myChart'></canvas>")
					var aData = [];
					$.each(data, function(index) {
						if (data[index] == null) {
							data[index] = 0;
						}
						aData.push(data[index]);
					});
					var myChart = document.getElementById('myChart')
							.getContext('2d');
					Chart.defaults.global.defaultFontFamily = 'Lato';
					Chart.defaults.global.defaultFontSize = 13;
					Chart.defaults.global.defaultFontColor = '#777';
					var massPopChart = new Chart(myChart, {
						type : 'bar',
						data : {
							labels : [ 'January', 'February', 'March', 'April',
									'May', 'June', 'July', 'August',
									'September', 'October', 'November',
									'December' ],
							datasets : [ {
								label : 'Revenue',
								data : aData,
								backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)', ],
								borderWidth : 1,
								borderColor : '#777',
								hoverBorderWidth : 3,
								hoverBorderColor : '#000'
							} ]
						},
						options : {
							title : {
								display : true,
								text : 'Monthly revenue',
								fontSize : 25
							},
							legend : {
								display : true,
								position : 'right',
								labels : {
									fontColor : '#000'
								}
							},
							layout : {
								padding : {
									left : 50,
									right : 0,
									bottom : 0,
									top : 0
								}
							},
							tooltips : {
								enabled : true
							}
						}
					});
				}
			});
		});
	</script>
	<script>
	function getYear() {
		var year = $('#year').val();
		$.ajax({
			type : 'GET',
			dataType: 'json',
			url : "<%=contextPath%>/admin/selectOrderYear/" + year,
				success : function(data) {
					$('.chartBar').html("<canvas id='myChart'></canvas>")
					var aData = [];
					$.each(data, function(index) {
						if (data[index] == null) {
							data[index] = 0;
						}
						aData.push(data[index]);
					});
					var myChart = document.getElementById('myChart')
							.getContext('2d');
					Chart.defaults.global.defaultFontFamily = 'Lato';
					Chart.defaults.global.defaultFontSize = 13;
					Chart.defaults.global.defaultFontColor = '#777';
					var massPopChart = new Chart(myChart, {
						type : 'bar',
						data : {
							labels : [ 'January', 'February', 'March', 'April',
									'May', 'June', 'July', 'August',
									'September', 'October', 'November',
									'December' ],
							datasets : [ {
								label : 'Revenue',
								data : aData,
								backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)',
										'rgba(255, 99, 132, 0.6)', ],
								borderWidth : 1,
								borderColor : '#777',
								hoverBorderWidth : 3,
								hoverBorderColor : '#000'
							} ]
						},
						options : {
							title : {
								display : true,
								text : 'Monthly revenue',
								fontSize : 25
							},
							legend : {
								display : true,
								position : 'right',
								labels : {
									fontColor : '#000'
								}
							},
							layout : {
								padding : {
									left : 50,
									right : 0,
									bottom : 0,
									top : 0
								}
							},
							tooltips : {
								enabled : true
							}
						}
					});
				}
			});
		};
		
	</script>
	<script>
	$(document).ready(function(){
		var internalDataLength = ${quantityList.size()};
		var graphColors = [];
		var i = 0;
		while (i <= internalDataLength ) {
		    var randomR = Math.floor((Math.random() * 130) + 100);
		    var randomG = Math.floor((Math.random() * 130) + 100);
		    var randomB = Math.floor((Math.random() * 130) + 100);
		   
		    var graphBackground = "rgb(" 
		            + randomR + ", " 
		            + randomG + ", " 
		            + randomB + ")";
		    graphColors.push(graphBackground);
		    i++;
		};
		console.log(internalDataLength);
		var chartPie = document.getElementById('myChartPie').getContext('2d');
		var myDoughnutChart = new Chart(chartPie, {
		    type: 'pie',
		    data : {
		    	    datasets: [{
		    	        data:  ${quantityList},
		    	        backgroundColor : graphColors,
		    	        borderWidth : 1,
						borderColor : '#777',
						hoverBorderWidth : 1,
						hoverBorderColor : '#000'
		    	    }],
		    	    labels: ${categoryNameList}
		    	},
		    	options : {
					title : {
						display : true,
						text : 'Revenue by category',
						fontSize : 25
					},
					tooltips : {
						enabled : true
					}
				}
		});
	});
	</script>
	<script src="<%=contextPath%>/resources/js/custom.js"></script>
</body>

</html>