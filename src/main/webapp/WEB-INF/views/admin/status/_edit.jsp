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
			<form:input path="id" id="idStatus" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Status Name</label>
				<form:input path="statusName" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<%-- <button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/user/update">Save</button> --%>
				<a class="btn btn-info" href="<%=contextPath%>/admin/status">Reset</a>
			</div>
		</form:form>
	</div>
</div>