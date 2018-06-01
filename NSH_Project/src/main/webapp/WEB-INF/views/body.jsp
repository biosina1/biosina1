<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<br>
	<br>
	<div class=container>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img class="d-block img-fluid" width="100%" height="500"
						src="/resources/image/라즈베리파이.JPG" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid" width="100%" height="500"
						src="/resources/image/아두이노.JPG" alt="Second slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<h6>NEW ITEM</h6>
		<br>
		<div class="row">
			<c:forEach var="item" items="${newitem}" varStatus="status">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="${item.p_img}" width="100%" height="100%" />
						<div class="caption">
							<center>
								<p>${item.p_name}</p>
								<p>${item.p_price}</p>
							</center>
							<p>
								<a href="/product/content?seq=${item.seq}"
									class="btn btn-primary" role="button" style="width: 100%;">구매하기</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br>
	<br>

	<div class="container">
		<h6>HIT ITEM</h6>
		<br>
		<div class="row">
			<c:forEach var="item" items="${hititem}" varStatus="status">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="${item.p_img}" width="100%" height="100%" />
						<div class="caption">
							<center>
								<p>${item.p_name}</p>
								<p>${item.p_price}</p>
							</center>
							<p>
								<a href="/product/content?seq=${item.seq}"
									class="btn btn-primary" role="button" style="width: 100%;">구매하기</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>