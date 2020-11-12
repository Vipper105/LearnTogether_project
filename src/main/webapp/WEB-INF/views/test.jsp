<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="<%=contextPath%>/diep/result" method="get">
		Input 1: <input type="checkbox" name="input1">
		Input 2: <input type="checkbox" name="input2">
		
		<input type="submit" value="submit" name="var">
</form>

</body>
</html>