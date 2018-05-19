/**
 * 
 */	$(function() {
			var bno = "${notice_content.seq}";
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