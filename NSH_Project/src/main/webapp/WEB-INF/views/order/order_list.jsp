<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;주문정보
			</center>
		</h4>
	</div>

	<div class="container">
		<c:forEach var="item" items="${order}" varStatus="status">
			<c:set var="orderNum" value="${item.orderNum}" />
			<table class="table">
				<thead>
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">상품이미지</th>
						<th scope="col">상품이름</th>
						<th scope="col">수량</th>
						<th scope="col">결제금액</th>
						<th scope="col">주문상태</th>
						<th scope="col">결제방법</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item2" items="${orderp}" varStatus="status">
						<c:set var="orderNum2" value="${item2.orderNum}" />
						<c:choose>
							<c:when test="${orderNum eq orderNum2}">
								<tr>
									<th scope="col">${item2.orderNum}</th>
									<th scope="col"><img src="${item2.p_img}" width="80"
										height="80"></th>
									<th scope="col">${item2.p_name}</th>
									<th scope="col">${item2.order_count}</th>
									<th scope="col">${item.price}</th>
									<th scope="col">${item.status}</th>
									<th scope="col">${item.payment}</th>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
			<br>
		</c:forEach>
	</div>
</body>
</html>