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
			<form:input path="id" id="idUser" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Email</label>
				<form:input path="email" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Username</label>
				<form:input path="username" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Password</label>
				<form:input path="password" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Fullname</label>
				<form:input path="fullname" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Address</label>
				<form:input path="address" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Amount</label>
				<form:input path="amount" required="required" class="form-control"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Birthdate</label>
				<form:input type="date" path="birthdate" class="form-control" />
			</div>

			<div class="form-group">
				<label>Role</label>
				<form:select path="role.id" id="role_id">
					<c:forEach var="r" items="${listRole}">
						<form:option value="${r.id}"> ${r.roleName}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group">
				<label>Urlimg</label>
				<form:input path="urlimg" required="required" class="form-control"
					readonly="true" />
			</div>

			<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/user/update">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/user">Reset</a>
			</div>
		</form:form>
	</div>
</div>