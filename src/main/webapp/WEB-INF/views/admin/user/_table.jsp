<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!--  @author NguyenDoanNam -->
<table id="example" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>Email</th>
			<th>Username</th>
			<th>Password</th>
			<th>Fullname</th>
			<th>Address</th>
			<th>Amount</th>
			<th>Birthdate</th>
			<th>Role</th>
			<th>Urlimg</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" varStatus="i" items="${listUser}">
			<tr>
				<td>${i.index + 1}</td>
				<td>${c.email}</td>
				<td>${c.username}</td>
				<td>${c.password}</td>
				<td>${c.fullname}</td>
				<td>${c.address}</td>
				<td>${c.amount}</td>
				<td>${c.birthdate}</td>
				<td>${c.role.roleName}</td>
				<td>${c.urlimg}</td>
				<td><a href="#" class="editUser"><i
						class="fa fa-id-card" aria-hidden="true" onclick="edit_show()"></i></a>
					<a href="<%=contextPath%>/admin/user/delete/${c.id}" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a>
						 <input type="hidden" id="id" value="${c.id}"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

