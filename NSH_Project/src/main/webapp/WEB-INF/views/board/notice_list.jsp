<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<div class="container" id="notice">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;공지사항
			</center>
		</h4>
	</div>

	<div class="container">
		<table class="table table-striped" style="text-align: center;">
			<thead>
				<tr>
					<td scope="col"><b>번호</b></td>
					<td scope="col"><b>제목</b></td>
					<td scope="col"><b>날짜</b></td>
					<td scope="col"><b>조회</b></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${notice_list}" varStatus="status">
					<tr>
						<td scope="row">${item.seq}</td>
						<td><a href="/board/notice_content?seq=${item.seq}">${item.title}</a></td>
						<td>${item.wdate}</td>
						<td>${item.hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>

	<div class="container">
		<center>
			<nav>
			<ul class="pagination">
			
			

			
				<c:if test="${pageMaker.prev}">
					<li><a href="notice_list?page=${pageMaker.startPage-1 }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				
				
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li
					<c:out value="${pageMaker.pagevo.page == idx?'class = active':''}"/>>
						<a href="notice_list?page=${idx}">${idx}</a>
					</li>
				</c:forEach>
				
				
				
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li><a href="notice_list?page=${pageMaker.endPage +1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				
				
				
			</ul>
			</nav>
		</center>
	</div>


</body>
</html>