<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.quantity {
	float: left;
	margin-right: 15px;
	background-color: #eee;
	position: relative;
	width: 80px;
	overflow: hidden
}

.quantity input {
	margin: 0;
	text-align: center;
	width: 15px;
	height: 15px;
	padding: 0;
	float: right;
	color: #000;
	font-size: 20px;
	border: 0;
	outline: 0;
	background-color: #F6F6F6
}

.quantity input.qty {
	position: relative;
	border: 0;
	width: 100%;
	height: 40px;
	padding: 10px 25px 10px 10px;
	text-align: center;
	font-weight: 400;
	font-size: 15px;
	border-radius: 0;
	background-clip: padding-box
}

.quantity .minus, .quantity .plus {
	line-height: 0;
	background-clip: padding-box;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-background-size: 6px 30px;
	-moz-background-size: 6px 30px;
	color: #bbb;
	font-size: 20px;
	position: absolute;
	height: 50%;
	border: 0;
	right: 0;
	padding: 0;
	width: 25px;
	z-index: 3
}

.quantity .minus:hover, .quantity .plus:hover {
	background-color: #dad8da
}

.quantity .minus {
	bottom: 0
}

.shopping-cart {
	margin-top: 20px;
}
</style>
</head>
<body>
	<script>
		function setbtn(num) {

			var form = document.forms.updateForm;
		
			if (num == 1) {
				$("#updateForm").attr("action", "/product/updatecart");
				alert(form.getAttribute('action'));
			}
			if (num == 2) {
				$("#updateForm").attr("action", "/product/deletecart");
				alert(form.getAttribute('action'));
			}			
			
			form.submit();
		}
	</script>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="card shopping-cart">
			<div class="card-header bg-dark text-light">
				<i class="fa fa-shopping-cart" aria-hidden="true"></i> Shipping cart
				<div class="clearfix"></div>
			</div>
			<div class="card-body">
				<c:forEach var="item" items="${list}" varStatus="status">
					<!-- PRODUCT -->
					<div class="row">
						<div class="col-12 col-sm-12 col-md-2 text-center">
							<img class="img-responsive" src="${item.p_img}" alt="prewiew"
								width="120" height="80">
						</div>
						<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
							<h4 class="product-name">
								<strong>Product Name</strong>
							</h4>
							<h4>
								<small>${item.p_name}</small>
							</h4>
						</div>
						<div
							class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
							<div class="col-3 col-sm-3 col-md-6 text-md-right"
								style="padding-top: 5px">
								<h6>
									<strong>${item.p_price}<span class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-4 col-sm-4 col-md-4">
								<div class="quantity">
									<form id="updateForm" name='updateForm' method="post" >
										<input type="number" name="count" step="1" max="99" min="1"
											value="${item.count}" title="Qty" class="qty" size="4">
										<input type="hidden" name="seq" value="${item.seq}" />
								</div>
							</div>
							<div class="col-2 col-sm-2 col-md-2 text-right">
								<input type="button" value="수정" onclick="setbtn(1)"> <input
									type="button" value="삭제" onclick="setbtn(2)">
								</form>
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>
				<!-- END PRODUCT -->
			</div>
			<div class="card-footer">
				<div class="pull-right" style="margin: 10px">
					<a href="" class="btn btn-success pull-right">Checkout</a>
					<div class="pull-right" style="margin: 5px">
						Total price: <b>50.00€</b>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>