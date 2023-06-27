const hsendMail = () => {
	let hostEmailReg = /\S+@\S+\.\S+/;
	let hostEmail = $("#h-checkEmail").val();
	//timecheck();
	console.log(hostEmail)
	if (hostEmailReg.test(hostEmail)) {
		alert("인증번호를 발송했습니다.");
		$.ajax({
			url: '<%=request.getContextPath()%>/MailSendServlet2.do',
			data: { hostEmail: hostEmail },
			dataType: "text",
			success: function(data) {
				console.log(data);
				if (data != 'null') {
					epw = data;
					$("#h-checkEmailNum").focus();
				} else {
					alert("유효하지 않은 메일주소입니다. 다시 시도하세요");
				}
			},
			error: (r, m, e) => {
				console.log(r);
				console.log(m);
			}
		});
	} else {
		alert("이메일 형식이 잘못됐습니다. 메일양식을 확인해주세요");
	}
}

function hCheckEmail() {
	let emailcheck = $("#h-checkEmailNum").val();
	console.log(emailcheck, typeof emailcheck)
	console.log(epw, typeof epw);
	if (epw == emailcheck) {
		$("#hostEmail_doubleCheck").val('Y');
		alert("인증 성공 :)");
	} else {
		$("#hostEmail_doubleCheck").val('N');
		alert("인증번호를 다시 확인해주세요.");
	}
}



// 이메일 변경 버튼 클릭 
$("#h-applyHostEmail").click(e => {

	let val = $("#hostEmail_doubleCheck").val();
	console.log(val)
	if (val == 'Y') {
		document.querySelector("#h-hostEmail").value = ($("#h-checkEmail").val());
		$(".h-modalEmail").css('display', 'none');
		$("document").css('overflow', 'auto');
	} else {
		alert("이메일 인증을 진행해주세요 :<");
	}
})




// 닉네임 변경 모달창 열기
$("#h-updateNickname").click(e => {
	$(".h-modalNickName").css('display', 'block');
	$("document").css('overflow', 'hidden');
});

// 닉네임 중복 체크 
let hostrNicknameReg = /^[a-zA-Z0-9가-힣]{2,}$/;
$("#h-checkNickname").keyup(e => {
	console.log(e.target.value.length)
	if (e.target.value.length >= 2 && hostrNicknameReg.test(e.target.value)) {
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
	else {
		let msg = ""; let color = "";
		msg = "두 글자 이상 입력하세요";
		color = "red"
		$(".hiddenMsg").text(msg).css("color", color);
	};
});

// 닉네임 변경 버튼 클릭 
$("#h-applyNickname").click(e => {
	document.querySelector("#h-hostNickname").value = ($("#h-checkNickname").val());
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
		if (!passwordReg.test(pw)) {
			color = "red";
			msg = "*비밀번호는 영문과 숫자로 이루어진 8글자 이상이어야 합니다.";
			e.preventDefault();
		}
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




// 이메일 변경 모달창 열기
$("#h-updateEmail").click(e => {
	$(".h-modalEmail").css('display', 'block');
	$("document").css('overflow', 'hidden');
});

// 이메일 변경 모달창 닫기
$(".h-close-modal").click(e => {
	$(".h-modalEmail").css('display', 'none');
	$("document").css('overflow', 'auto');
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