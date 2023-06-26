// // 프로필이미지를 선택했을 때 이미지를 변경할 수 있는 파일을 선택하는 이벤트
// $("#h-edit-pf").click(e => {
// 	$("#h-profileInput").click();
// });

// // input의 이미지가 변경되었을 때 발생하는 이벤트
// $("#h-profileInput").change(e => {
// 	console.log(e.target.result);
// 	const reader = new FileReader();
// 	// input 속성의 accept를 이용해서 원하는 형식의 파일만 받을 수 있다 -> 분기처리 필수 
// 	reader.onload = e => {
// 		// e.target.result 속성에 변경된 파일이 나온다.
// 		$("#h-hostImg").attr("src", e.target.result);
// 	}
// 	reader.readAsDataURL(e.target.files[0]); // 읽은 data URL로 바꿔주는 함수
// });

// 프로필 수정 사항 
let inputs = document.querySelectorAll(".h-profile-info input");
$(".h-submit").click(e => {
	if ($(".h-profile-info input").val() != null) {
		//console.log(inputs[0].value);
		$.ajax({
			url: "<%=request.getContextPath()%>/host/updateHostProfile.do",
			data: {
				"hostNickname": $("#h-hostNickname").val(),
				"hostPw": $("#h-hostPassword").val(),
				"hostHomePhone": $("#h-hostHomePhone").val(),
				"hostImg": $("#h-hostImg").val(),
			},
			success: (data) => {
				console.log(data, typeof data);
				if (data > 0) {
					alert("변경 완료 :)");
				} else {
					alert("변경 실패 :<");
				}
			}, error: (e, m) => {
				console.log(data);
			}
		});
	}
});

// 닉네임 변경 모달창 열기
$("#h-updateNickname").click(e => {
	$(".h-modalNickName").css('display', 'block');
	$("document").css('overflow', 'hidden');
});

// 닉네임 중복 체크 
let hostrNicknameReg = /^[a-zA-Z0-9가-힣]{2,}$/;
$("#h-checkNickname").keyup(e => {
	console.log(e.target.value.length)
	if (e.target.value.length >= 2 &&hostrNicknameReg.test(e.target.value)) {
		$.ajax({
			url: "<%=request.getContextPath()%>/host/duplicateNickname.do",
			data: { "nickname": (e.target.value) },
			success: (data) => {
				console.log(data, typeof data);
				let msg = ""; let color = "";
				if (data == 0) {
					msg = "사용 가능한 닉네임입니다";
					color = "green";
				} else {
					msg = "사용 불가능한 닉네임입니다";
					color = "red";
				}
				$(".hiddenMsg").text(msg).css("color", color);
			}, error: function(jqXHR, textStatus, errorThrown) {
					console.log("에러 발생: " + textStatus, errorThrown);
				}
		});
	} 
	// else {
	// 	let msg = ""; let color = "";
	// 	msg = "두 글자 이상 입력하세요";
	// 	color = "red"
	// 	$(".hiddenMsg").text(msg).css("color", color);
	// };
});

// 닉네임 변경 버튼 클릭 
$("#h-applyNickname").click(e => {
	document.querySelector("#h-hostNickname").value = ($("#h-checkNickname").val());
	alert('변경 완료 ;)')
	closeNick();
})

// 닉네임 변경모달창 닫기
$(".h-close-modal").click(e => {
	closeNick();
})
const passwordReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
// 변경할 비밀번호 체크 
$("#h-checkPw").keyup(e => {
	let pw = $("#h-newPw").val();
	let checkPw = e.target.value;
	console.log(checkPw);
	let color = ""; let msg = "";
	if (pw == checkPw) {
		color = "green"; msg = "비밀번호가 일치합니다 :)";
	} else if (!passwordReg.test(password)) {
		color = "#996F51";
		msg = "*비밀번호는 영문과 숫자로 이루어진 8글자 이상이어야 합니다.";
		e.preventDefault();
	} else {
		color = "red"; msg = "비밀번호가 불일치합니다 :<";
	}
	$(".hiddenMsgP").text(msg).css("color", color);
})

// 비밀번호 변경 버튼 클릭 
$("#h-applyHostPwd").click(e => {
	document.querySelector("#h-hostPassword").value = ($("#h-checkPw").val());
	closePw();
	
})




// 비밀번호 변경 모달창 열기
$("#h-updatePassword").click(e => {
	$(".h-modalPassword").css('display', 'block');
	$("document").css('overflow', 'hidden');
});

// 비밀번호 변경모달창 닫기
$(".h-close-modal").click(e => {
	closePw();
})
// 전화번호 변경 버튼 클릭 
$("#h-applyhostPhone").click(e => {
	document.querySelector("#h-hostHomePhone").value = ($("#h-checkPhone").val());
	alert('변경 완료 ;)')
	$(".h-modalPhone").css('display', 'none');
	$("document").css('overflow', 'auto');
})

// 전화번호 변경 모달창 열기
$("#h-updatePhone").click(e => {
	$(".h-modalPhone").css('display', 'block');
	$("document").css('overflow', 'hidden');
});

// 전화번호 변경모달창 닫기
$(".h-close-modal").click(e => {
	$(".h-modalPhone").css('display', 'none');
	$("document").css('overflow', 'auto');
})

// 비밀번호 모달창 닫기 
function closeNick(e) {
	$(".h-modalNickName").css('display', 'none');
	$("document").css('overflow', 'auto');
}
function closePw(e) {
	$(".h-modalPassword").css('display', 'none');
	$("document").css('overflow', 'auto');
}