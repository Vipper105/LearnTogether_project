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
<div id="form_view">
	<div id="popupContact">
		<form >
			<img id="close" src="<%=contextPath%>/resources/images/close.jpg"
				onclick="form_hide()">
			<input id="id" id="idUser" required="required"
				class="form-control" type="hidden" />
			<div class="form-group">
				<label>Email</label>
				<input id="email" required="required" class="form-control" readonly="readonly"/>
			</div>
			<div class="form-group">
				<label>Username</label>
				<input id="username" required="required" class="form-control" readonly="readonly"	/>
			</div>
			<div class="form-group">
				<label>Fullname</label>
				<input id="fullname" required="required" class="form-control"
					readonly="readonly"/>
			</div>
			<div class="form-group">
				<label>Address</label>
				<input id="address" required="required" class="form-control"
				readonly="readonly"	/>
			</div>
			<div class="form-group">
				<label>Amount</label>
				<input id="amount" required="required" class="form-control"
					readonly="readonly"/>
			</div>
			<div class="form-group">
				<label>Birthdate</label>
				<input type="date" id="birthdate" class="form-control" readonly="readonly"/>
			</div>
		</form>
	</div>
</div>