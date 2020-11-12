<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<% 
/**
 * @author PhungDinhHuy
 *
 */
String contextPath=request.getContextPath(); 
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello,Tui là admin</h1>
<a href="<%=contextPath %>/logout">Logout</a>
</body>
</html>