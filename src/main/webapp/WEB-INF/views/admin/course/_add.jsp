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
			<form:input path="id" class="form-control" type="hidden" />
			<div class="form-group">
				<label>Course Title</label>
				<form:input path="coursetitle" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Description</label>
				<form:input path="description" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Price Course</label>
				<form:input path="pricecourse" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Language</label>
				<form:input path="language" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Course Lever</label>
				<form:input path="courseLevel.levelName" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Num Student</label>
				<form:input path="numstudent" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Create Date</label>
				<form:input path="createdate" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Lasted Update</label>
				<form:input path="lasteupdate" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Instructor</label>
				<form:input path="instructor.user.email" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Category</label>
				<form:input path="category.categoryName" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>UrlImg</label>
				<form:input path="urlimg" class="form-control" readonly="true" />
			</div>

			<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/course/update">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/course">Reset</a>
			</div>
		</form:form>
	</div>
</div>