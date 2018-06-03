<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#admin {
	margin-top: 70px;
	margin-bottom: 70px;
	height: 150px;
	background-color: #F8F8F8;
}
</style>
</head>
<script>
	function submitbtn(num){
		if(num == 0){
			$("#location").attr("action","/board/notice_form");
			$("#location").submit();
		}else if(num == 1){
			$("#location").attr("action","/product/form");
			$("#location").submit();
		}else if(num == 2){
			$("#location").attr("action","/member/userlist");
			$("#location").submit();
		}else if(num == 3){
			$("#location").attr("action","/product/allorderlist");
			$("#location").submit();
		}
	}
</script>
<body>
	<div class="container" id="admin">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;관리자 페이지
			</center>
		</h4>
	</div>

	<div class="container">
		<table class="table">
			<tr>
				<th scope="col"><button type="button" class="btn btn-outline-secondary" style="width:100%; height:150px;" onclick="submitbtn(0)">공지 등록</button></th>
				<th scope="col"><button type="button" class="btn btn-outline-secondary" style="width:100%; height:150px;" onclick="submitbtn(1)">상품 등록</button></th>
				<th scope="col"><button type="button" class="btn btn-outline-secondary" style="width:100%; height:150px;" onclick="submitbtn(2)">회원 관리</button></th>
				<th scope="col"><button type="button" class="btn btn-outline-secondary" style="width:100%; height:150px;" onclick="submitbtn(3)">주문 관리</button></th>
			</tr>
		</table>
	</div>
	
	<form id="location">
	</form>
</body>
</html>