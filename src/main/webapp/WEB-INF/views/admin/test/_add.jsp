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
				<label>Number question</label>
				<form:input path="numquestion" required="required" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Score</label>
				<form:input path="score" required="required" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Section title</label>
				<form:input path="section.id" required="required" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label>Update date</label>
				<form:input path="updatedate" required="required" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Type test</label>
				<form:input path="testtype.id" required="required" class="form-control"/>
			</div>
				<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/test/add">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/test">Reset</a>
			</div>
		</form:form>
	</div>
</div>