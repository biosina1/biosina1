<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
	width: 245px;
}

#addrcode {
	width: 213px;
}

label {
	margin-top: 10px;
	margin-left: 10px;
}
</style>
</head>
<body>

	<script type="text/javascript">
		function checkId() {
			$('#userid').on('input', function() {
				$.ajax({
					type : 'POST',
					url : '/join/checkId',
					data : {
						"userid" : $('#userid').val()
					},
					success : function(data) {
						if ($.trim(data) == 0) {
							$("#check_label").css("color","green");
							$("#check_label").text("사용 가능")
						} else {
							$("#check_label").css("color","red");
							$("#check_label").text("사용 불가")
						}
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert(xhr.status);
						alert(thrownError);
					}
				});
			});
		}
	</script>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">
								<center>
									<a href="#" id="register-form-link">Register</a>
								</center>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<form id="register-form"
									action="http://phpoll.com/register/process" method="post"
									role="form" style="display: block;">

									<div class="form-group" style="float: left;">
										<input type="text" name="userid" id="userid" tabindex="1"
											class="form-control" placeholder="아이디" value="" oninput="checkId()">
									</div>

									<div class="form-group" id="button_size">
										<label id="check_label">필수 항목</label>
										<!-- <button type="button" class="btn" data-target="#layerpop" data-toggle="modal">중복확인</button> -->
									</div>

									<div class="form-group">
										<input type="userpw" name="userpw" id="userpw" tabindex="2"
											class="form-control" placeholder="비밀번호">
									</div>
									<div class="form-group">
										<input type="userpw2" name="confirm-password"
											id="confirm-password" tabindex="2" class="form-control"
											placeholder="비밀번호 확인">
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
										<button type="button" class="btn">우편번호 검색</button>
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
										<input type="tel" name="tel" id="tel" tabindex="2"
											class="form-control" placeholder="전화번호">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit"
													id="register-submit" tabindex="4"
													class="form-control btn btn-register" value="작성완료">
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

	<!-- Modal -->
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">Header</h4>
				</div>
				<!-- body -->
				<div class="modal-body">Body</div>
				<!-- Footer -->
				<div class="modal-footer">
					Footer
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>