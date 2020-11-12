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
							<h3 class="col-xl-10 col-lg-10">User table</h3>
						<!-- 	<a class="btn btn-success" href="#add" onclick="add_show()">Add New User</a> -->
						</div>
						<c:if test="${not empty message }">
							<div class="alert alert-${alert}" role="alert">${message}</div>
						</c:if>
						<div class="table_style">
							<jsp:include page="_table.jsp" />
						</div>
					<jsp:include page="_edit.jsp" />
					<%-- 		<jsp:include page="_add.jsp" /> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('table .editUser').on('click', function() {
			var id = $(this).parent().find('#id').val();
			$.ajax({
				type : 'GET',
				dataType: 'json',
				url : "<%=contextPath%>/admin/user/" + id,
				success : function(data) {
					$("#idUser").val(data.id);
					$("#email").val(data.email);
					$("#username").val(data.username);
					$("#password").val(data.password);
					$("#fullname").val(data.fullname);
					$("#address").val(data.address);
					$("#amount").val(data.amount);
					$("#birthdate").val(data.birthdate);
					$("#role_id").val(data.role.id);
					$("#urlimg").val(data.urlimg);

				}
			});
		});
	</script>
	<script src="<%=contextPath%>/resources/js/custom.js"></script>
</body>

</html>