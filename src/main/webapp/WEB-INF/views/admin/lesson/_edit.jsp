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
			<form:input path="id" id="idLesson" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Title</label>
				<form:input path="title" required="required" class="form-control" />
			</div>
			<div class="form-group">
				<label>Urlvid</label>
				<form:input path="urlvid" required="required" class="form-control" />
			</div>
			<div class="form-group">
				<label>Section title</label>
				<form:input path="section.id" id="section" required="required"
					class="form-control" />
			</div>
			<div class="form-group">
				<label>Urlimg</label>
				<form:input path="urlimg" required="required"
					class="form-control" />
			</div>
			<div class="form-group">
				<%-- <button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/lesson/update">Save</button> --%>
				<a class="btn btn-info" href="<%=contextPath%>/admin/lesson">Reset</a>
			</div>
		</form:form>
	</div>
</div>