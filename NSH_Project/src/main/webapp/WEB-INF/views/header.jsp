<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<style>
/* .navbar {
	background-color: #FFFFFF;
	border-color: #C4D2E3;
}

.item, img {
	height: 100% !important;
	width: 100% !important;
	border: 1px solid white;
}

.navbar-brand {
	padding-left: 100px;
} */
</style>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="/home">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S
			mall&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="/board/notice_list">&nbsp;&nbsp;공지사항&nbsp;&nbsp;
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item "><a class="nav-link" href="/product/list?p_category=arduino">&nbsp;&nbsp;아두이노&nbsp;&nbsp;</a></li>
				<li class="nav-item "><a class="nav-link" href="/product/list?p_category=raspberrypi">&nbsp;&nbsp;라즈베리파이&nbsp;&nbsp;</a></li>
				<li class="nav-item "><a class="nav-link" href="/product/list?p_category=sensor">&nbsp;&nbsp;센서&nbsp;&nbsp;</a></li>

			</ul>
			<ul class="navbar-nav">
			<c:if test="${empty sessionScope.userid}">
				<li class="nav-item nav-right"><a class="nav-link" href="/member/login_Form">&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<li class="nav-item nav-right"><a class="nav-link" href="/member/join_Form">회원가입</a>
				</li>
			</c:if>
			<c:if test="${!empty sessionScope.userid}">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> ${sessionScope.userid}님 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/member/logout">로그아웃</a> 
								<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="/member/modifyform?u_seq=${sessionScope.u_seq}">정보수정</a> 
						<a class="dropdown-item" href="/product/selectcart?u_seq=${sessionScope.u_seq}">장바구니</a>
						<a class="dropdown-item" href="/product/orderlist">주문정보</a>
						<c:if test="${'admin' eq sessionScope.userid}">
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="/admin/manage">관리자 페이지</a> 
						</c:if>
				
					</div></li>
			</c:if>
			</ul>
		</div>
		</nav>
	</div>
</body>
</html>

