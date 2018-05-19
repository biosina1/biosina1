<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/jQuery-2.1.4.min.js"></script>
<style>
.navbar {
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
}
</style>
</head>
<body>
	<!--메뉴-->
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/home">Phi Chai Sensor Mall</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li><a href="/board/notice_list">공지사항<span class="sr-only">(current)</span></a></li>
					<li><a href="/board/arduino">아두이노</a></li>
					<li><a href="#">라즈베리파이</a></li>
					<li><a href="#">LED/LCD</a></li>
				</ul>


				<ul class="nav navbar-nav navbar-right">


					<li><a href="/login_Form"><span
							class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
					<li><a href="/join/join_Form"><span
							class="glyphicon glyphicon-user"></span> 회원가입</a></li>

					<li><a href="#">${sessionScope.userid}님 환영합니다.</a></li>
					<li><a href="/logout">로그아웃</a></li>


				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
	<!--/메뉴-->



	<br>
	<br>
	<br>
	<br>
</body>
</html>

