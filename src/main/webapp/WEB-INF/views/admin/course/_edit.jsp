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
			<form:input path="id" id="idCourse" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Course Title</label>
				<form:input path="coursetitle" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Description</label>
				<form:input path="description" required="required"
					class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Price Course</label>
				<form:input path="pricecourse" required="required"
					class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Language</label>
				<form:input path="language" required="required"
					class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Course Lever</label>
				<form:input path="courseLevel.levelName" id="courseLevel" required="required"
					class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Num Student</label>
				<form:input path="numstudent" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Create Date</label>
				<form:input path="createdate" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Lasted Update</label>
				<form:input path="lasteupdate" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Instructor</label>
				<form:input path="instructor.user.email" id="instructor" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Category</label>
				<form:input path="category.categoryName" id="category" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>UrlImg</label>
				<form:input path="urlimg" required="required" class="form-control"
					readonly="true" />
			</div>
			
			<div class="form-group">
				<%-- <button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/course/update">Save</button> --%>
				<a class="btn btn-info" href="<%=contextPath%>/admin/course">Reset</a>
			</div>
		</form:form>
	</div>
</div>