<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	var totalprice;
		$("document").ready(function() {
			totalprice = 0;
			var price_length = "${fn:length(list)}";
			for (var i = 0; i < price_length; i++) {
				var price = $("#p_" + i).html();
				var count = $("#count_"+ i).val();
				price = parseInt(price);
				totalprice = totalprice + price * count;
				price2 = price.toLocaleString();
				$("#p_" + i).text(price2 + " 원");
			}

			$("#totalprice").text(totalprice.toLocaleString() + " 원");
			$("#totalprice2").text(totalprice.toLocaleString() + " 원");
		});

		function setbtn(num,seq,count) {
			var form = document.forms.updateForm;
			if (num == 1) {
				$("#updateForm").attr("action", "/product/updatecart");
				var cnt = $("#count_"+count).val();
				$("#seqnum").val(seq);
				$("#count").val(cnt);
				alert(form.getAttribute('action'));
			}
			if (num == 2) {
				$("#updateForm").attr("action", "/product/deletecart");
				$("#seqnum").val(seq);
				alert(form.getAttribute('action'));
			}

			form.submit();
 	}
	
		function submitbtn(){
			$("#price").val(totalprice);
			$(".orderForm").submit();
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
				<form id="updateForm" name='updateForm' method="post">
					<c:forEach var="item" items="${list}" varStatus="status">
						<!-- PRODUCT -->
						<div class="row">
							<hr>
							<div class="col-12 col-sm-12 col-md-2 text-center">
								<img class="img-responsive" src="${item.p_img}" alt="prewiew"
									width="120" height="80">
							</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<h4 class="product-name">상품 명</h4>
								<h4>
									<small>${item.p_name}</small>
								</h4>
							</div>
							<div
								class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
								<div class="col-3 col-sm-3 col-md-6 text-md-right"
									style="padding-top: 5px">
									<h6 id="p_${status.index}">${item.p_price}</h6>
								</div>
								<div class="col-4 col-sm-4 col-md-4">
									<div class="quantity">
										<input type="number" step="1" max="99" min="1"
											value="${item.count}" title="Qty" class="qty" size="4"
											id="count_${status.index}"> <input type="hidden"
											name="seq" value="" id="seqnum" /> <input type="hidden"
											name="count" value="" id="count" />
									</div>
								</div>
								<div class="col-2 col-sm-2 col-md-2 text-right">
									<input type="button" value="수정"
										onclick="setbtn(1,${item.seq},${status.index})"> <input
										type="button" value="삭제" onclick="setbtn(2,${item.seq})">
								</div>
							</div>
						</div>
						<hr>
					</c:forEach>
				</form>
				<!-- END PRODUCT -->
			</div>
			<div class="card-footer">
				<div class="pull-right" style="margin: 10px">
					<div class="pull-right" style="margin: 5px">
						총 가격 : <b id="totalprice"></b>&nbsp;&nbsp;&nbsp;
					</div>
				</div>
			</div>





			<div class="card-header bg-dark text-light">
				<i class="fa fa-shopping-cart" aria-hidden="true"></i> 배송 정보
				<div class="clearfix"></div>
			</div>
			<div class="card-body">
				<div class="card-body">
					<form action="/product/addorder" method="post" class="orderForm"
						name="orderForm">

						<c:forEach var="item" items="${list}" varStatus="status">
							<input type="hidden" name="p_seq" value="${item.p_seq}">
							<input type="hidden" name="count" value="${item.count}">
						</c:forEach>



						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">성명</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<input type="text" name="name" value="${user.username}" size=20>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">휴대폰</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<input type="tel" name="phone" value="${user.phone}" size="20">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">우편번호</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<input type="text" value="${user.addrcode}" size="20"
									id="addrcode" name="addrcode" readonly><input
									type="button" value="우편번호 검색"
									onclick="sample6_execDaumPostcode()">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">주소</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<input type="text" name="addr" id="addr" value="${user.addr}"
									size="37" readonly>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">상세주소</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<input type="text" name="addr2" id="addr2" value="${user.addr2}"
									size="37">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">주문메시지</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<input type="text" name="message" size="37">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">결제수단</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<select name="payment">
									<option value="카드결제">카드 결제</option>
									<option value="무통장 입금">무통장 입금</option>
									<option value="무통장 입금">휴대폰 결제</option>
								</select> <input type="hidden" name="price" id="price">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="card-footer">
				<center>
					<button type="button" class="btn btn-outline-info"
						style="width: 150px" onclick="submitbtn()">구매하기</button>
				</center>

			</div>
		</div>
	</div>


	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('addrcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('addr').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('addr2').focus();
				}
			}).open();
		}
	</script>
</body>
</html>