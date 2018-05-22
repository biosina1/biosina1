<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.panel-login>.panel-heading a {
	text-decoration: none;
	color: #32cd32;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

#register-submit {
	background-color: #ffffff;
	outline: none;
	color: #32cd32;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #32cd32;
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
	border-color: #32cd32;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #32cd32;
	border-color: #32cd32;
}

.container {
	margin-bottom: 50px;
	text-align: center;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<script type="text/javascript">
		function loginCheck() {

			if ($("#userid").val().length == 0) {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return;
			}

			if ($("#userpw").val().length == 0) {
				alert("비밀번호를 입력하세요.");
				$("#userid").focus();
				return;
			}

			$("#register-form").submit();
		}
	</script>

	<div class="container ">
		<center>
			<div class="row justify-content-center align-items-center">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-login">
						<div class="panel-heading">
							<div class="row justify-content-center align-items-center">
								<div class="col-xs-12 ">
									<a href="#" id="register-form-link">Login</a>
								</div>
							</div>
							<hr>
						</div>
						<div class="panel-body">
							<div class="row justify-content-center align-items-center">
								<div class="col-lg-12">
									<form id="register-form" action="/login" method="post"
										role="form" style="display: block;">
										<div class="form-group">
											<input type="text" name="userid" id="userid" tabindex="1"
												class="form-control" placeholder="아이디" value="">
										</div>

										<div class="form-group">
											<input type="password" name="userpw" id="userpw" tabindex="2"
												class="form-control" placeholder="비밀번호">
										</div>

										<div class="form-group">
											<div class="row justify-content-center align-items-center">
												<div class="col-sm-6 col-sm-offset-3">
													<input type="button" name="register-submit"
														id="register-submit" tabindex="4"
														class="form-control btn btn-register" value="로그인"
														onclick="javascript:loginCheck()">
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
		</center>
	</div>
</body>
</html>