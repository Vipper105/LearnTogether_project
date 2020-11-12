<!--  @author NguyenDoanNam -->
<%
	String contextPath = request.getContextPath();
%>
<div class="col-xl-2 col-lg-2 main-header-area">
	<div>
		<ul class="list-menu">
			<li><a class="sub-one" href="#" onclick="view('table-menu')"><i
					class="fa fa-table" aria-hidden="true"></i> Table</a>
				<ul class="sub-menu" id="table-menu">
					<li><a class="item active" href="<%=contextPath%>/admin/user">User </a></li>
					<li><a class="item" href="<%=contextPath%>/admin/status">Status</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/statusUser">Status User</a></li>
					<li><a class="item" href="">Certificates user</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/instructor">Instructor</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/course">Course</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/courseLevel">Course level</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/rating">Rating</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/category">Category</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/section">Section</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/lesson">Lesson</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/test">Test</a></li>
					<li><a class="item" href="#">Multi choice</a></li>
					<li><a class="item" href="#">Answer multi choice</a></li>
					<li><a class="item" href="#">Result multichoice </a></li>
					<li><a class="item" href="#">Essay</a></li>
					<li><a class="item" href="#">Answer essay</a></li>
					<li><a class="item" href="#">Result essay</a></li>
					<li><a class="item" href="#">Promotion</a></li>
					<li><a class="item" href="#">Promotion course</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/order">Orders</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/courseOrder">Course order</a></li>
					<li><a class="item" href="<%=contextPath%>/admin/invoice">Invoice</a></li>
					<li><a class="item" href="#">Certificate</a></li>
					<li><a class="item" href="#">Certificates user</a></li>
				</ul></li>
			<li><a class="sub-one" href="<%=contextPath%>/admin/statistical"><i
					class="fa fa-tasks" aria-hidden="true"></i> Statistical</a></li>
			<li><a class="sub-one" href="<%=contextPath%>/admin/confirmCourse"><i class="fa fa-check" aria-hidden="true"></i> Confirm Course</a></li>
		</ul>
	</div>
</div>