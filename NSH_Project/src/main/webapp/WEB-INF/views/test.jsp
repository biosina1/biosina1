<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resources/jQuery-2.1.4.min.js"></script>
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
		var bno = 3;

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

			console.log("aaaaa");
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

		/* 	$(document).ready(function() {
				$("#replyLi").on("click", ".replyLi button", function() {
					var reply = $(this).parent();
					console.log(reply);
					var seq = reply.attr("data-seq");
					console.log("seq :: " + seq);
					var replytext = reply.text();
					console.log("replytext :: " + replytext);

					$(".modal-title").html(seq);
					$("#replytext").html(replytext);
					$("#modDiv").show("show");
				});
			}); */
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
</body>
</html>