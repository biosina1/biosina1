<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("crlf", "\r\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="/product/insert"
						method="post" enctype="multipart/form-data">


						<fieldset>
							<div class="form-group ">
								<div class="col-md-12">
									<select class="selectpicker form-control" name="p_category">
										<option>arduino</option>
										<option>Ketchup</option>
										<option>Relish</option>
										</optgroup>
									</select>

								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<input id="p_name" name="p_name" type="text" placeholder="상품이름"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<input id="p_price" name="p_price" type="text"
										placeholder="상품단가" class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-12">
									<input id="p_count" name="p_count" type="text"
										placeholder="상품수량" class="form-control">
								</div>
							</div>
							

							<div class="form-group">
								<div class="col-md-12">
									<input type="file" name="file" class="form-control"
										placeholder="상품 이미지" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<input type="file" name="file2" class="form-control"
										placeholder="상세 상품 이미지" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<textarea class="form-control" id="p_content" rows="10"
										placeholder="상품내용" name="p_content"></textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="등록" class="btn btn-primary btn-lg">&nbsp;등록&nbsp;</button>
									<button type="취소" class="btn btn-warning btn-lg">&nbsp;취소&nbsp;</button>
								</div>
							</div>
						</fieldset>

						
						 <input
							type="hidden" name="type" value="공지사항">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>