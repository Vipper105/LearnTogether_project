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
			<form:input path="id" id="idStatusUser" required="required"
				class="form-control" type="hidden" />	
			<div class="form-group">
				<label>User email</label>
				<form:select path="user.id" id="user">
					<c:forEach var="u" items="${listUser}">
						<form:option value="${u.id}"> ${u.email}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group">
				<label>Status</label>
				<form:select path="status.id" id="status">
					<c:forEach var="s" items="${listStatus}">
						<form:option value="${s.id}"> ${s.statusName}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group">
				<button class="btn btn-warning"
					formaction="<%=contextPath%>/admin/statusUser/update">Save</button>
				<a class="btn btn-info" href="<%=contextPath%>/admin/statusUser">Reset</a>
			</div>
		</form:form>
	</div>
</div>