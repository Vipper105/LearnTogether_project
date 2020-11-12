<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%

/**
 * @author Nam
 *
 */
	String contextPath = request.getContextPath();
%>

<table id="example" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>Course Title</th>
			<th>Intructor</th>
			<th>Create Date</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" varStatus="i" items="${listCourse}">
			<tr>
				<td>${i.index + 1}</td>
				<td>
					<a href="#" class="edit" onclick="submit_show()">${c.coursetitle}</a>
					<input type="hidden" id="id" value="${c.id}"> 
				</td>
				<td>${c.instructor.user.email}</td>
				<td>${c.createdate}</td>
				<td><a href="<%=contextPath%>/admin/confirmCourse/${c.id}" onclick="return confirm('Are you sure you want to approve this course')"><i class="fa fa-check" aria-hidden="true"></i></a>
				<a href="<%=contextPath%>/admin/noConfirmCourse/${c.id}" class="delete" onclick="return confirm('Are you sure you want to no approve this course')"><i class="fa fa-ban" aria-hidden="true"></i></a> <input type="hidden"
					id="id" value="${c.id}"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

