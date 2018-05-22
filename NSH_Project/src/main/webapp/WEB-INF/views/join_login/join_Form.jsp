<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.panel-login>.panel-heading a {
	text-decoration: none;
	color: #1e90ff;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

#register-submit {
	background-color: #ffffff;
	outline: none;
	color: #1e90ff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1e90ff;
}

.btn-register {
	background-color: #1e90ff;
	outline: none;
	color: #F8F8F8;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1e90ff;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #1e90ff;
	border-color: #1e90ff;
}

.container {
	margin-bottom: 50px;
}

#userid {
	width: 180px;
}

#addrcode {
	width: 222px;
}

p {
	margin-top: 30px;
	margin-left: 10px;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<script type="text/javascript">
	<!-- 중복 체크-->
		function checkId() {
			if ($('#userid').val().length == null) {
				$("#check_label").css("color", "red");
				$("#check_label").text("사용 불가");
			} else {
				$('#userid').on('input', function() {
					$.ajax({
						type : 'POST',
						url : '/join/checkId',
						data : {
							"userid" : $('#userid').val()
						},
						success : function(data) {
							if ($.trim(data) == 0) {
								$("#check_label").css("color", "green");
								$("#check_label").text("사용 가능")
							} else {
								$("#check_label").css("color", "red");
								$("#check_label").text("사용 불가")
							}
						},
						error : function(xhr, ajaxOptions, thrownError) {
							alert(xhr.status);
							alert(thrownError);
						}
					});
				});
				return;
			}
		}

		function JoinCheck() {

			if ($("#userid").val().length == 0) {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return;
			}

			if ($("#check_label").text() == '사용 불가') {
				alert("사용할 수 없는 아이디 입니다.");
				$("#userid").focus();
				return;
			}

			if ($("#userpw").val().length == 0) {
				alert("비밀번호를 입력하세요.");
				$("#userpw").focus();
				return;
			}

			if ($("#userpw2").val().length == 0) {
				alert("비밀번호를 입력하세요.");
				$("#userpw2").focus();
				return;
			}

			if ($("#userpw").val() != $("#userpw2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#userpw").focus();
				return;
			}

			if ($("#username").val().length == 0) {
				alert("이름을 입력하세요.");
				$("#username").focus();
				return;
			}

			if ($("#addrcode").val().length == 0) {
				alert("주소를 입력하세요.");
				$("#addrcode").focus();
				return;
			}

			if ($("#addr").val().length == 0) {
				alert("주소를 입력하세요.");
				$("#addr").focus();
				return;
			}

			if ($("#addr2").val().length == 0) {
				alert("상세주소를 입력하세요.");
				$("#addr2").focus();
				return;
			}

			if ($("#email").val().length == 0) {
				alert("이메일를 입력하세요.");
				$("#email").focus();
				return;
			}

			if ($("#phone").val().length == 0) {
				alert("전화번호를 입력하세요.");
				$("#phone").focus();
				return;
			}

			$("#register-form").submit();
		}
	</script>

	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row justify-content-center align-items-center">
							<div class="col-xs-12">
								<center>
									<a href="#" id="register-form-link">Register</a>
								</center>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row justify-content-center align-items-center">
							<div class="col-md-12">
								<form id="register-form" action="/join/insert" method="post"
									role="form" style="display: block;">

									<div class="form-group" style="float: left;">
										<input type="text" name="userid" id="userid" tabindex="1"
											class="form-control" placeholder="아이디" value=""
											oninput="checkId()">
									</div>

									<div class="form-group" id="button_size" align="center">
										<p class="text-danger" id="check_label">사용 불가</p>
									</div>

									<div class="form-group">
										<input type="password" name="userpw" id="userpw" tabindex="2"
											class="form-control" placeholder="비밀번호">
									</div>
									<div class="form-group">
										<input type="password" name="userpw2" id="userpw2"
											tabindex="2" class="form-control" placeholder="비밀번호 확인">
									</div>

									<div class="form-group">
										<input type="username" name="username" id="username"
											tabindex="2" class="form-control" placeholder="이름">
									</div>
									<div class="form-group" style="float: left;">
										<input type="text" name="addrcode" id="addrcode" tabindex="1"
											class="form-control" placeholder="우편번호" value="" readonly>
									</div>

									<div class="form-group" id="button_size">
										<button type="button" class="btn"
											onclick="sample6_execDaumPostcode()">우편번호 검색</button>
									</div>

									<div class="form-group">
										<input type="addr" name="addr" id="addr" tabindex="2"
											class="form-control" placeholder="주소" readonly>
									</div>
									<div class="form-group">
										<input type="addr2" name="addr2" id="addr2" tabindex="2"
											class="form-control" placeholder="상세주소">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="2"
											class="form-control" placeholder="이메일">
									</div>
									<div class="form-group">
										<input type="tel" name="phone" id="phone" tabindex="2"
											class="form-control" placeholder="전화번호">
									</div>
									<div class="form-group">
										<div class="row justify-content-center align-items-center">
											<div class="col-sm-6 col-sm-offset-3 btn">
												<input type="button" value="완료"
													onclick="javascript:JoinCheck()"
													class="register-submit form-control  btn btn-outline-primary">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Daum api -->

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