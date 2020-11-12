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
<div id="add">
	<div id="popupContact">
		<form:form modelAttribute="form">
			<img id="close" src="<%=contextPath%>/resources/images/close.jpg"
				onclick="add_hide()">
			<div class="form-group">
				<label>Create Date</label>
				<form:input path="createdate" required="required"
					class="form-control" />
			</div>
			<div class="form-group">
				<label>User gmail</label>
				<form:input path="order.user.id"  required="required"
					class="form-control" />
			</div>
			<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/courseLevel/add">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/courseLevel">Reset</a>
			</div>
		</form:form>
	</div>
</div>