<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!--  @author NguyenDoanNam -->
<table id="example" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>Title</th>
			<th>Description</th>
			<th>Course title</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" varStatus="i" items="${listSection}">
			<tr>
				<td>${i.index + 1}</td>
				<td>${c.title}</td>
				<td>${c.description}</td>
				<td>${c.course.coursetitle}</td>
				<td><a href="#" class="edit"><i class="fa fa-id-card"
						aria-hidden="true" onclick="edit_show()"></i><%-- </a> <a
					href="<%=contextPath%>/admin/section/delete/${c.id}"><i
						class="fa fa-trash" aria-hidden="true"></i></a>  --%><input type="hidden"
					id="id" value="${c.id}"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

