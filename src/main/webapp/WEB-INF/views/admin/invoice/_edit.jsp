<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
/**
 * @author Nam
 *
 */
	String contextPath = request.getContextPath();
%>
<div id="edit">
	<div id="popupContact">
		<form:form modelAttribute="form">
			<img id="close" src="<%=contextPath%>/resources/images/close.jpg"
				onclick="edit_hide()">
			<form:input path="id" id="idInvoice" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Create Date</label>
				<form:input path="createdate" required="required"
					class="form-control" />
			</div>
			<div class="form-group">
				<label>User gmail</label>
				<form:input path="order.user.id" id="order" required="required"
					class="form-control" />
			</div>
			<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/invoice/update">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/invoice">Reset</a>
			</div>
		</form:form>
	</div>
</div>