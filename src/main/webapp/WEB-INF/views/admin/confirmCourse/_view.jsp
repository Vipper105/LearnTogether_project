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
<div id="confirmCourse">
	<div id="popupContact">
		<div class="confirm">
			<img id="close" src="<%=contextPath%>/resources/images/close.jpg"
				onclick="submit_hide()">
			<h3>INFORMATION COURSE</h3>
			<p>
				- Course Title: <b class="coursetitle"></b>
			</p>
			<p>
				- Description: <b class="description"></b>
			</p>
			<p>
				- Price Course: <b class="pricecourse"></b>
			</p>
			<p>
				- Language: <b class="language"></b>
			</p>
			<p>
				- Course Lever: <b class="courseLevel"></b>
			</p>
			<p>
				- Create Date: <b class="createdate"></b>
			</p>
			<p>
				- Lasted Update: <b class="lasteupdate"></b>
			</p>
			<p>
				- Instructor: <b class="instructor"></b>
			</p>
			<p>
				- Category: <b class="category"></b>
			</p>
			<p>
				- UrlImg: <b class="urlimg"></b>
			</p>
			<h4>SECTION</h4>
			<div id="accordion"></div>
		</div>
	</div>
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<img id="popup-img" src="" alt="">
			</div>
		</div>
	</div>
</div>