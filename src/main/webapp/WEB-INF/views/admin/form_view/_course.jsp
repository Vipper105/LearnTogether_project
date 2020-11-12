<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
/**
 * @author Nam
 *
 */
	String contextpath = request.getContextPath();
%>
<div id="edit">
	<div id="popupContact">
		<form>
			<img id="close" src="<%=contextpath%>/resources/images/close.jpg"
				onclick="edit_hide()">
			<input id="id" id="idCourse" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Course Title</label>
				<input id="coursetitle" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Description</label>
				<input id="description" required="required"
					class="form-control" readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Price Course</label>
				<input id="pricecourse" required="required"
					class="form-control" readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Language</label>
				<input id="language" required="required"
					class="form-control" readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Course Lever</label>
				<input id="courseLevel.levelName" id="courseLevel" required="required"
					class="form-control" readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Num Student</label>
				<input id="numstudent" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Create Date</label>
				<input id="createdate" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Lasted Update</label>
				<input id="lasteupdate" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Instructor</label>
				<input id="instructor.user.email" id="instructor" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Category</label>
				<input id="category.categoryName" id="category" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>UrlImg</label>
				<input id="urlimg" required="required" class="form-control"
					readonly="readonly" />
			</div>
		
		</form>
	</div>
</div>