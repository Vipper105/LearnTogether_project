<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% 
/**
 * @author Nam
 *
 */
String contextPath=request.getContextPath(); 
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Session ended, please try again</h1>
	<a href="<%=contextPath%>/login-page">Return</a>
</body>
</html>