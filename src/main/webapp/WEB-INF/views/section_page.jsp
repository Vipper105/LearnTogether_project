<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
/**
 * @author PhungDinhHuy
 *
 */
String contextPath=request.getContextPath(); 
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Create test -->
<a href="<%=contextPath %>/test/create-test-page">Create Test</a><br/>


<!-- Do test -->
<a href="<%=contextPath %>/test/show-all-test-by-sectionID/1">Section 1</a><br/>
<a href="<%=contextPath %>/test/show-all-test-by-sectionID/2">Section 2</a><br/>
<a href="<%=contextPath %>/test/show-all-test-by-sectionID/3">Section 3</a><br/>
 
</body>
</html>