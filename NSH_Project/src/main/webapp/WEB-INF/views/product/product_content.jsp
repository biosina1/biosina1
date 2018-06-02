<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
<title>Insert title here</title>
<style>
img {
	max-width: 100%;
}
</style>
</head>
<body>
	<script>
		function click3() {
			var count = $("#count").val();
			if (count == null) {
				alert("수량을 알맞게 입력하세요.");
			}

			else {
				document.getElementById("myform").submit();
			}
		}
		function click2() {
			location.href = "http://localhost:8090/home";
		}
		function click4(num) {
			if (num == 1) {
				$("#modForm").attr("action", "/product/modify");
				$("#modForm").submit();
			} else {
				$("#modForm").attr("action", "/product/delete");
				$("#modForm").submit();
			}
		}
	</script>
	<br>
	<br>
	<br>
	<div class="container">
		<hr>
		<div class="row justify-content-center align-items-center">
			<div class="col-sm-5">
				<img src="${product.p_img}">
			</div>
			<div class="col-sm-5">
				<hr>
				&emsp;&emsp;&emsp;&emsp;조회&nbsp;&nbsp;:&nbsp;${product.p_hit}
				<hr>
				&emsp;&emsp;&emsp;&emsp;상품&nbsp;&nbsp;:&nbsp;${product.p_name}
				<hr>
				&emsp;&emsp;&emsp;&emsp;설명&nbsp;&nbsp;:&nbsp;${product.p_content}
				<hr>
				&emsp;&emsp;&emsp;&emsp;가격&nbsp;&nbsp;:&nbsp;${product.p_price}
				<hr>
				<form action="/product/insertcart" method="post" id="myform">
					&emsp;&emsp;&emsp;&emsp;수량&nbsp;:&nbsp; <input type="number"
						name="count" id="count" value=1 min="1"> <input
						type="hidden" name="p_seq" value="${product.seq}"> <input
						type="hidden" name="u_seq" value="${sessionScope.u_seq}">
					<hr>
					<center>
						<button type="button" class="btn btn-outline-info"
							style="width: 150px" onclick="click3()">장바구니</button>
						<button type="button" class="btn btn-outline-primary"
							style="width: 150px" onclick="click2()">목록으로</button>
						<br><br>
						<button type="button" class="btn btn-outline-danger"
							style="width: 150px" onclick="click4(1)">수정</button>
						<button type="button" class="btn btn-outline-danger"
							style="width: 150px" onclick="click4(2)">삭제</button>
					</center>
					<hr>
				</form>
			</div>
		</div>
	</div>
	<form id="modForm">
		<input type="hidden" value="${product.seq}" name="seq">
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<center>
			<img src="${product.p_img2}" width="80%" height="100%"> <br>
			<br> <br> <img src="${product.p_img2}" width="80%"
				height="100%">
		</center>
	<div>
</body>
</html>