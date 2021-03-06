<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/jQuery-2.1.4.min.js"></script>
<style type="text/css">
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}
</style>
</head>
<body>
	<script>
		$(function() {
			var bno = 3;
			getPageList(1);

			function getAllList() {

				$
						.getJSON(
								"/reply/all/" + bno,
								function(data) {

									//console.log(data.length);

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
							getAllList();

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
							getAllList();

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
						getAllList();

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
			var replyPage = 1;
			
			$(".pagination").on("click","li a", function(event) {
				event.preventDefault();
				replyPage = $(this).attr("href");
				getPageList(replyPage);
			});

		});
	</script>












	<h2>AJAX PAGE</h2>

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

	<!-- ------------------------------------------------------------------- -->

	<div>
		<div>
			REPLYER <input type='text' name='replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>


	<ul id="replies">
	</ul>

	<ul class='pagination'></ul>
</body>
</html>