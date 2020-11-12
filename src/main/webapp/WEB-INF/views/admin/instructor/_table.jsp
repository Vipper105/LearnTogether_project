<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!--  @author NguyenDoanNam -->
<table id="example" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>User Name</th>
			<th>Experience Year</th>
			<th>Num Student</th>
			<th>Rate Value</th>
			<th>Skill Level</th>
			<th>About Me</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" varStatus="i" items="${listInstructor}">
			<tr>
				<td>${i.index + 1}</td>
				<td>
				  <a href="#editUser" class="editUser" onclick="form_view()">${c.user.email}</a>
				  <input type="hidden" id="idUser" value="${c.user.id}">
				</td>
				<td>${c.experienceyear}</td>
				<td>${c.numstudent}</td>
				<td>${c.ratevalue}</td>
				<td>${c.skilllevel}</td>
				<td>${c.aboutMe}</td>
				<td>
				<a href="#edit" class="edit"><i class="fa fa-id-card" aria-hidden="true" onclick="edit_show()"></i></a>
				<!-- <a href="#delete" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a> -->
				<input type="hidden" id="id" value="${c.id}"> 	
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

