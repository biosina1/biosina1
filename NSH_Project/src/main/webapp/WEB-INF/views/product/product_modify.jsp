<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("crlf", "\r\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
#notice {
	margin-top: 70px;
	margin-bottom: 70px;
	height: 150px;
	background-color: #F8F8F8;
}
</style>
<body>
	<div class="container" id="notice">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;상품 수정
			</center>
		</h4>
	</div>
	<c:set var="category" value="${product.p_category}" />
	<div class="container">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm" align="center">
					<form class="form-horizontal" action="/product/update"
						method="post" enctype="multipart/form-data">
						<fieldset>
							<div class="form-group ">
								<div class="col-md-12">
									<select class="selectpicker form-control" name="p_category">
										<option
											<c:if test="${category eq 'arduino'}">selected="selected"</c:if>>arduino</option>
										<option
											<c:if test="${category eq 'raspberrypi'}">selected="selected"</c:if>>raspberrypi</option>
										<option
											<c:if test="${category eq 'sensor'}">selected="selected"</c:if>>sensor</option>
									</select>

								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<input id="p_name" name="p_name" type="text" placeholder="상품이름"
										class="form-control" value="${product.p_name}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<input id="p_price" name="p_price" type="text"
										placeholder="상품단가" class="form-control"
										value="${product.p_price}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<input id="p_count" name="p_count" type="text"
										placeholder="상품수량" class="form-control"
										value="${product.p_count}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<input type="text" class="form-control"
										placeholder="이미지를 수정하지 않으면 이전에 등록된 이미지가 사용됩니다." readonly>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<input type="file" name="file" class="form-control"
										placeholder="상품 이미지" id="img">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<input type="file" name="file2" class="form-control"
										placeholder="상세 상품 이미지" id="img2">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<textarea class="form-control" id="p_content" rows="10"
										placeholder="상품내용" name="p_content">${product.p_content}</textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="등록" class="btn btn-outline-primary btn-lg"
										width="150px">&nbsp;등록&nbsp;</button>
									<button type="취소" class="btn btn-outline-warning btn-lg"
										width="150px">&nbsp;취소&nbsp;</button>
								</div>
							</div>
						</fieldset>
						<input type="hidden" name="seq" value="${product.seq}"> <input
							type="hidden" name="p_img" value="${product.p_img}"> <input
							type="hidden" name="p_img2" value="${product.p_img2}">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>