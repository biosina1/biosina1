<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#notice {
	margin-top: 70px;
	margin-bottom: 70px;
	height: 150px;
	background-color: #F8F8F8;
}
</style>
</head>
<body>
	<div class="container" id="notice">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp&nbsp공지사항
			</center>
		</h4>
	</div>
	<div class="container">
		<div class="row">
			<c:forEach var="item" items="${list}" varStatus="status">

				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="${item.p_img}" />
						<div class="caption">
							<center>						
								<p>${item.p_name}</p>
								<p>${item.p_price}</p>
							</center>
							<p>
								<a href="#" class="btn btn-primary" role="button"
									style="width: 100%;">구매하기</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>