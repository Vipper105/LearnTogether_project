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
				<label>User Name</label>
				<form:input path="user" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Experience Year</label>
				<form:input path="experienceyear" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Num Student</label>
				<form:input path="numstudent" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Rate Value</label>
				<form:input path="ratevalue" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Skill Level</label>
				<form:input path="skilllevel" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>About Me</label>
				<form:input path="aboutMe" required="required" class="form-control"
					readonly="true" />
			</div>

			<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/instructor/add">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/instructor">Reset</a>
			</div>
		</form:form>
	</div>
</div>