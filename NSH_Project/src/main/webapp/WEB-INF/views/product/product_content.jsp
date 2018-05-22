<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/product/cart" method="get">
		<input type="number" name="count">
		<input type="hidden" name="p_seq" value="${product.seq}">
		<input type="hidden" name="u_seq" value=1>
		<input type="submit" value="전송">
	</form>
	
	<form action="/product/cart" method="get">
		<input type="number" name="count">
		<input type="hidden" name="p_seq" value="${product.seq}">
		<input type="hidden" name="u_seq" value=1>
		<input type="submit" value="전송">
	</form>
</body>
</html>