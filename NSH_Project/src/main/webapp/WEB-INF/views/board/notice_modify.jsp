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
<div class="container" id="notice">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;공지사항 수정
			</center>
		</h4>
	</div>
	<div class="container">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="/board/notice_modify"
						method="POST">
						<fieldset>
							<div class="form-group">
								<div class="col-md-12">
									<input id="title" name="title" type="text" placeholder="제목"
										class="form-control" value="${notice_content.title}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<textarea class="form-control" id="content" rows="10"
										name="content">${fn:replace(notice_content.content,br,cn)}</textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="등록" class="btn btn-primary btn-lg">&nbsp;등록&nbsp;</button>
									<button type="취소" class="btn btn-warning btn-lg">&nbsp;취소&nbsp;</button>
								</div>
							</div>
						</fieldset>

						<input type="hidden" name="writer" value="관리자"> 
						<input type="hidden" name="type" value="공지사항">
						<input type="hidden" name="seq" value=${notice_content.seq}>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>