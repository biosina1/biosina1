<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
#notice {
	margin-top: 70px;
	margin-bottom: 70px;
	height: 150px;
	background-color: #F8F8F8;
}
</style>
</head>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/board/notice_modify_form");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-info").on("click", function() {
			formObj.attr("action", "/board/notice_delete");
			formObj.submit();
		});

		$(".btn-primary").on("click", function() {
			self.location = "/board/notice_list";
		});
	});
</script>
<body>

	<script>
		$(function() {
			var replyPage = 1;
			var bno = "${notice_content.seq}";
			getPageList(1);

			function getAllList() {

				$
						.getJSON(
								"/reply/all/" + bno,
								function(data) {
									var str = "";
									$(data)
											.each(
													function() {
														str += "<li data-seq='"+this.seq+"' class='replyLi'>"
																+ this.seq
																+ ":"
																+ this.replytext
																+ "<button>MOD</button></li>";
													});

									$("#replies").html(str);
								});
			}

			$("#replyAddBtn").on("click", function() {

				var replyer = $("#newReplyWriter").val();
				var replytext = $("#newReplyText").val();

				$.ajax({
					type : 'post',
					url : '/reply',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						bno : bno,
						replyer : replyer,
						replytext : replytext
					}),
					success : function(result) {

						if (result == 'SUCCESS') {

							alert("성공");
							getPageList(1);

						}
					}
				});
			});

			$("#replies").on("click", ".replyLi button", function() {

				var reply = $(this).parent();

				var seq = reply.attr("data-seq");
				var replytext = reply.text();

				$(".modal-title").html(seq);
				$("#replytext").val(replytext);
				$("#modDiv").show("slow");

			});

			$("#replyDelBtn").on("click", function() {
				alert("삭제");
				var seq = $(".modal-title").html();
				var replytext = $("#replytext").val();
				$.ajax({
					type : 'delete',
					url : '/reply/delete/' + seq,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					success : function(result) {

						if (result == 'SUCCESS') {
							alert("삭제되었습니다.");
							$("#modDiv").hide("slow");
							getPageList(1);

						}
					}
				});
			});

			$("#replyModBtn").on("click", function() {
				var seq = $(".modal-title").html();
				var replytext = $("#replytext").val();
				$.ajax({
					type : 'put',
					url : '/reply/update/' + seq,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					dataType : 'text',
					data : JSON.stringify({
						replytext : replytext
					}),
					success : function(result) {

						alert("수정되었습니다.");
						$("#modDiv").hide("slow");
						getPageList(1);

					}
				});
			});

			function getPageList(page) {

				$
						.getJSON(
								"/reply/" + bno + "/" + page,
								function(data) {
									var str = "";

									$(data.list)
											.each(
													function() {
														str += "<li data-seq='"+this.seq+"' class='replyLi'>"
																+ this.seq
																+ ":"
																+ this.replytext
																+ "<button>MOD</button></li>";
													});

									$("#replies").html(str);
									printPaging(data.pageMaker);

								});

			}

			function printPaging(pageMaker) {
				var str = "";

				if (pageMaker.prev) {
					str += "<li><a href='" + (pageMaker.startPage - 1)
							+ "'> << </a></li>";
				}

				for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.pagevo.page == i ? 'class=active'
							: '';
					str += "<li "+strClass+"><a href='"+i+"'> " + i
							+ "</a></li>";
				}

				if (pageMaker.next) {
					str += "<li><a href='" + (pagePaker.endPage + 1)
							+ "'> >> </a></li>'"
				}

				$(".pagination").html(str);
			}

			$(".pagination").on("click", "li a", function(event) {
				event.preventDefault();
				replyPage = $(this).attr("href");
				getPageList(replyPage);
			});

		});
	</script>
	<form role="form" method="post">
		<input type="hidden" name="seq" value=${notice_content.seq}>
	</form>
	
	<div class="container" id="notice">
		<br> <br> <br>
		<h4>
			<center>
				<span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;공지사항
			</center>
		</h4>
	</div>
	
	<div class="row">
		<div class="container col-md-6 col-md-offset-6">
			<table class="table table-bordered" width=100%>
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
					<center>
						<button type="button" class="btn btn-warning"  style="width: 150px;">수정</button>
						<button type="button" class="btn btn-info"style="width: 150px; ">삭제</button>
						<button type="button" class="btn btn-primary"style="width: 150px;">목록</button>
				</center>
					</th>
				</tr>

				<tr>
					<td colspan=2>REPLYER</td>
				<tr>
				<tr>
					<td colspan=2><input type='text' name='replyer'
						id='newReplyWriter' size='60'></td>
				<tr>
				<tr>
					<td colspan=2>REPLY TEXT</td>
				<tr>
				<tr>
					<td colspan=2><input type='text' name='replytext'
						id='newReplyText' size='60'></td>
				<tr>
				<tr>
					<td colspan=2><button id="replyAddBtn">ADD REPLY</button></td>
				<tr>
				<tr>
					<td colspan=2><ul id="replies"></ul></td>
				<tr>
				<tr>
					<td colspan=2><ul class='pagination'></ul></td>
				<tr>
			</table>
		</div>
	</div>


	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
</body>
</html>