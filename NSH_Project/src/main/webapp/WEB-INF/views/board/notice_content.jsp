<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("cn", "\n");
	pageContext.setAttribute("br", "<br/>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action","/board/notice_modify_form");
		formObj.attr("method","get");
		formObj.submit();
	});
	
	$(".btn-info").on("click", function(){
		formObj.attr("action","/board/notice_delete");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		self.location="/board/notice_list";
	});
});
</script>
<body>
	<form role="form" method="post">
		<input type="hidden" name="seq" value=${notice_content.seq}>
	</form>
	<div class="row">
		<div class="container col-md-6 col-md-offset-3">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th width="70%">제목 :${notice_content.title}</th>
						<th>조회 :${notice_content.hits}</th>
					</tr>
				</thead>

				<thead>
					<tr>
						<th>이름 :${notice_content.writer}</th>
						<th>날짜 :${notice_content.wdate}</th>
					</tr>
				</thead>
				<tr>
					<th colspan=2><center>내용</center></th>
				</tr>
				<tr>
					<th colspan=2>${fn:replace(notice_content.content,cn,br)}</th>
				</tr>
				<tr>
					<th colspan=2>

						<button type="button" class="btn btn-warning">수정</button>
						<button type="button" class="btn btn-info">삭제</button>
						<button type="button" class="btn btn-primary">목록</button>

					</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>