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

<script>
	function modifybtn(index){
		var orderNum = $("#orderNum_"+index).text();
		var status = $("#status_"+index).val();
		$("#orderNum").val(orderNum);
		$("#status").val(status);
		$("#modifyform").submit();
	}
</script>
	<div class="container" id="notice">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;주문 관리
			</center>
		</h4>
	</div>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">이름</th>
					<th scope="col">휴대폰</th>
					<th scope="col">배송지</th>
					<th scope="col">결제방법</th>
					<th scope="col">배송상태</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${order}" varStatus="num">
					<c:set var="status" value="${item.status}" />
					<tr>
						<th scope="col" id="orderNum_${num.index}">${item.orderNum}</th>
						<th scope="col">${item.name}</th>
						<th scope="col">${item.phone}</th>
						<th scope="col">${item.addr}${item.addr2}</th>
						<th scope="col">${item.payment}</th>
						<th scope="col">
						
						<select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="status_${num.index}" name="status">
								<option <c:if test="${status eq '결제완료'}">selected="selected"</c:if> value="결제완료">결제완료</option>
								<option <c:if test="${status eq '배송준비중'}">selected="selected"</c:if> value="배송준비중">배송준비중</option>
								<option <c:if test="${status eq '배송중'}">selected="selected"</c:if> value="배송중">배송중</option>
								<option <c:if test="${status eq '배송완료'}">selected="selected"</c:if> value="배송완료">배송완료</option>
						</select></th>
						<th scope="col">
						<button type="button" class="btn btn-outline-primary" onclick="modifybtn(${num.index})">변경</button>
						</th>
					</tr>
				
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<form id="modifyform" action="/product/orderupdate">
		<input type="hidden" name="orderNum" id="orderNum">
		<input type="hidden" name="status" id="status">
	</form>
</body>
</html>