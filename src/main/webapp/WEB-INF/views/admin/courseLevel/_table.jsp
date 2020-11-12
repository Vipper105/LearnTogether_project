<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!--  @author NguyenDoanNam -->
<table id="example" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>Level Name</th>	
			<th>Action</th>	
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" varStatus="i" items="${listCourseLevel}">
			<tr>
				<td>${i.index + 1}</td>
				<td>${c.levelName}</td>
				<td><a href="#" class="edit"><i
						class="fa fa-id-card" aria-hidden="true" onclick="edit_show()"></i></a>
					<a href="<%=contextPath%>/admin/courseLevel/delete/${c.id}" onclick="return ConfirmDelete()"><i class="fa fa-trash" aria-hidden="true"></i></a>
						 <input type="hidden" id="id" value="${c.id}" ></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

