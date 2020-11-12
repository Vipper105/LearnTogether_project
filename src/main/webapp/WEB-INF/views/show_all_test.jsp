<%@page import="tp.kits3.learntogether.utils.Contansts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="tp.kits3.learntogether.user.vo.Test"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>

<%
/**
 * @author PhungDinhHuy
 *
 */
	/* HttpSession httpSession = request.getSession();
	User user = (User) httpSession.getAttribute(Contansts.USER_LOGGED);
	 */
	 String contextPath=request.getContextPath();
	List<Test> listTestByScetionID=(List<Test>)request.getAttribute(Contansts.LIST_TEST_BY_SECTIONID);
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p>Do all test by sectionID</p>

	<!-- show từ DB lên => sử dụng set đối tượng và list -->
	<%
	for(int i=0;i<listTestByScetionID.size();i++){
	%>
	
	<p><a href="<%=contextPath %>/test/do-test-page/<%=listTestByScetionID.get(i).getId() %>">Test <%=listTestByScetionID.get(i).getTitle() %></a></p>
	
	<% 
	}
	%>

</body>
<script src="<%=contextPath%>/resources/js/smoothscroll.js"></script>
</html>