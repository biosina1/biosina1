function checkId() {
	if ($('#userid').val().length == null) {
		$("#check_label").css("color", "red");
		$("#check_label").text("사용 불가");
	} else {
		$('#userid').on('input', function() {
			$.ajax({
				type : 'POST',
				url : '/join/checkId',
				data : {
					"userid" : $('#userid').val()
				},
				success : function(data) {
					if ($.trim(data) == 0) {
						$("#check_label").css("color", "green");
						$("#check_label").text("사용 가능")
					} else {
						$("#check_label").css("color", "red");
						$("#check_label").text("사용 불가")
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status);
					alert(thrownError);
				}
			});
		});
		return;
	}
}

function JoinCheck() {

	if ($("#userid").val().length == 0) {
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return;
	}

	if ($("#check_label").text() == '사용 불가') {
		alert("사용할 수 없는 아이디 입니다.");
		$("#userid").focus();
		return;
	}

	if ($("#userpw").val().length == 0) {
		alert("비밀번호를 입력하세요.");
		$("#userpw").focus();
		return;
	}

	if ($("#userpw2").val().length == 0) {
		alert("비밀번호를 입력하세요.");
		$("#userpw2").focus();
		return;
	}

	if ($("#userpw").val() != $("#userpw2").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#userpw").focus();
		return;
	}

	if ($("#username").val().length == 0) {
		alert("이름을 입력하세요.");
		$("#username").focus();
		return;
	}

	if ($("#addrcode").val().length == 0) {
		alert("주소를 입력하세요.");
		$("#addrcode").focus();
		return;
	}

	if ($("#addr").val().length == 0) {
		alert("주소를 입력하세요.");
		$("#addr").focus();
		return;
	}

	if ($("#addr2").val().length == 0) {
		alert("상세주소를 입력하세요.");
		$("#addr2").focus();
		return;
	}

	if ($("#email").val().length == 0) {
		alert("이메일를 입력하세요.");
		$("#email").focus();
		return;
	}

	if ($("#tel").val().length == 0) {
		alert("전화번호를 입력하세요.");
		$("#tel").focus();
		return;
	}

	$("#register-form").submit();
}


function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
						: '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('addrcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('addr').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('addr2').focus();
		}
	}).open();
}