<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String type = (String) request.getAttribute("type");
		String page_jsp = "middle.jsp";

		if (type != null) {
			switch (type) {
			case "home":
				page_jsp = "middle.jsp";
				break;
			case "login":
				page_jsp = "login.jsp";
				break;
			case "join":
				page_jsp = "join.jsp";
				break;
			case "notice":
				page_jsp = "notice.jsp";
				break;
			}
		}
	%>

	<jsp:include page="header.jsp" />
	<jsp:include page="<%=page_jsp%>" />
	<jsp:include page="footer.jsp" />
</body>
</html>