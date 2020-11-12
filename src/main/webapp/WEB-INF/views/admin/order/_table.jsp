<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!--  @author NguyenDoanNam -->
<table id="example" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>User gmail</th>
			<th>Create Date</th>
			<th>Total Amount</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" varStatus="i" items="${listOrder}">
			<tr>
				<td>${i.index + 1}</td>
				<td>${c.user.email}</td>
				<td>${c.createdate}</td>
				<td>${c.totalamount}</td>
				<td><a href="#" class="edit"><i class="fa fa-id-card"
						aria-hidden="true" onclick="edit_show()"></i></a><%--  <a
					href="<%=contextPath%>/admin/order/delete/${c.id}"><i
						class="fa fa-trash" aria-hidden="true"></i></a> --%> <input type="hidden"
					id="id" value="${c.id}"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

