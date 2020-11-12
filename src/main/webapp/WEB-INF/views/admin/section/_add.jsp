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
			<form:input path="id" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Title</label>
				<form:input path="title" required="required" class="form-control"/>
			</div>
				<div class="form-group">
				<label>Description</label>
				<form:input path="description" required="required" class="form-control"/>
			</div>
				<div class="form-group">
				<label>Course title</label>
				<form:input path="course.id" required="required" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/section/add">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/section">Reset</a>
			</div>
		</form:form>
	</div>
</div>