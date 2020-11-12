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
		<form >
			<img id="close" src="<%=contextpath%>/resources/images/close.jpg"
				onclick="edit_hide()">
			<input id="id" id="idInstructor" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>User Name</label>
				<input id="user" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Experience Year</label>
				<input id="experienceyear" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Num Student</label>
				<input id="numstudent" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Rate Value</label>
				<input id="ratevalue" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>Skill Level</label>
				<input id="skilllevel" required="required" class="form-control"
					readonly="readonly" />
			</div>
			<div class="form-group">
				<label>About Me</label>
				<input id="aboutMe" required="required" class="form-control"
					readonly="readonly" />
			</div>

		</form>
	</div>
</div>