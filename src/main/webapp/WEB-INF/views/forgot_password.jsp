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
	<h1>Forgot password Page</h1>
	<form action="<%=contextPath %>/send-pass">
		<p>Bạn vui lòng nhập địa chỉ email mà bạn đã sử dụng để đăng ký
			ban đầu.</p>
		<input name="email" type="text" placeholder="Email">
		<button type="submit">Submit</button>
	</form>
	<h4>${message}</h4>
</body>
</html>