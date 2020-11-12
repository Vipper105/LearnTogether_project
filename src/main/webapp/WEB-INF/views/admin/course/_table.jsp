<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!--  @author NguyenDoanNam -->
<table id="example" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>Course Title</th>
			<th>Description</th>
			<th>Price Course</th>
			<th>Language</th>
			<th>Course Lever</th>
			<th>Num Student</th>
			<th>Create Date</th>
			<th>Lasted Update</th>
			<th>Instructor</th>
			<th>Category</th>
			<th>UrlImg</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" varStatus="i" items="${listCourse}">
			<tr>
				<td>${i.index + 1}</td>
				<td>${c.coursetitle}</td>
				<td>${c.description}</td>
				<td>${c.pricecourse}</td>
				<td>${c.language}</td>
				<td>${c.courseLevel.levelName}</td>
				<td>${c.numstudent}</td>
				<td>${c.createdate}</td>
				<td>${c.lasteupdate}</td>
				<td>
				  <a href="#editUser" class="editUser" onclick="form_view()">${c.instructor.user.email}</a>
				  <input type="hidden" id="idUser" value="${c.instructor.user.id}">
				
				</td>
				<td>${c.category.categoryName}</td>
				<td>${c.urlimg}</td>
				<td><a href="#edit" class="edit"><i
						class="fa fa-id-card" aria-hidden="true" onclick="edit_show()"></i></a>
				<%-- 	<a href="#delete" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a> --%>
						 <input type="hidden" id="id" value="${c.id}"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

