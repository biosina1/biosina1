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
				<%-- <tr>
					<th colspan=4 align="center">
					<select name="searchType">
						<option value = "n" <c:out value="${cri.searchType == null? 'selected' : ''}"/>>---------</option>
						<option value = "t" <c:out value="${cri.searchType eq 't'? 'selected' : ''}"/>>제목</option>
						<option value = "c" <c:out value="${cri.searchType eq 'c'? 'selected' : ''}"/>>내용</option>
						<option value = "w" <c:out value="${cri.searchType eq 'w'? 'selected' : ''}"/>>작성자</option>
						<input type="text" name="keyword" id="keyword" value="${cri.keyword }">
						<button id="searchBtn">검색</button>
					</select>
					</th> --%>
				</tr>
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
		<div class="row justify-content-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="/board/notice_list?page=${pageMaker.startPage-1 }">Previous</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li class="page-item"
						<c:out value="${pageMaker.pagevo.page == idx?'class = active':''}"/>><a
							class="page-link" href="/board/notice_list?page=${idx}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li class="page-item"><a class="page-link" href="/board/notice_list?page=${pageMaker.endPage+1 }">Next</a></li>
					</c:if>
				</ul>
		</div>
	</div>

</body>
</html>