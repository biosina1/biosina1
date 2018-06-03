<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#notice {
	margin-top: 70px;
	margin-bottom: 70px;
	height: 150px;
	background-color: #F8F8F8;
}
</style>
</head>

<body>
	<script>
		function submitbtn(num,status){
			var a = $("#u_seq_"+status).text();
			alert(a);
			 if(num == 1){
				$("#u_seq").val(a);
				$("#locationform").submit();
			}else if(num == 2){
				$("#seq").val(a);
				$("#locationform").attr("action","/member/userdelete");
				$("#locationform").submit();
			} 
		}
	</script>
	<div class="container" id="notice">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;회원 관리
			</center>
		</h4>
	</div>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">휴대폰</th>
					<th scope="col">가입날짜</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<th scope="col" id="u_seq_${status.index}">${item.seq}</th>
						<th scope="col">${item.userid}</th>
						<th scope="col">${item.username}</th>
						<th scope="col">${item.email}</th>
						<th scope="col">${item.phone}</th>
						<th scope="col">${item.regdate}</th>
						<th scope="col">
							<button type="button" class="btn btn-outline-primary"
								onclick="submitbtn(1,${status.index})">수정</button>
							<button type="button" class="btn btn-outline-primary"
								onclick="submitbtn(2,${status.index})">탈퇴</button>
						</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<form id="locationform" action="/member/modifyform">
		<input type="hidden" name="seq" id="seq"> <input type="hidden"
			name="u_seq" id="u_seq">
	</form>
</body>
</html>