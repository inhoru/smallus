<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
:root { -
	--btn-radius: 2rem; 
	--img-radius: 1rem; 
	--be-color: #F5E7D2; /* 연한 베이지 버튼 */ 
	--ye-color: #FBEFD3; /* 연한 노란색 버튼 */ 
	--dk-color: #E8D6C3; /*진한베이지 버튼 */ 
	--main-col-lt: #FFFCF5; /* main primary */ 
	--border-color: #F6E9DF; /*border  연한 컬러*/ 
	--font-small: 0.8rem; /* button 폰트 사이즈 */ 
	--btn-padding: 0.4rem 0.6rem; /* button padding 값 */ 
	--btn-bold: bolder;
}

.h-modalNickName, .h-modalPassword, .h-modalPhone, .h-modalEmail {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
	text-align:center;
}

 .modal-content{
	background-color: var(--main-col-lt);
	margin: 15% auto;
	width: 40%;
	text-align:center;
	padding: 2rem;
}

.modal-content button, .h-updateEmail button {
	background-color:var(--be-color);
	padding: var(--btn-padding);
	font-size: var(--font-small);
	border-radius: var(--btn-radius);
	border: 0;
	margin-left:1rem;
	margin-top:2rem;
}
.modal-content table{
	width: 100%;
	border: 1px solid red;
	display:flex;
	justify-content: space-between;
}

.modal-content button:hover, .modal-content button:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.modal-content input {
	border-radius: var(--btn-radius);
	margin:0.5rem 0;
	padding:var(--btn-padding);
}

.hiddenMsg, .hiddenMsgP, .hiddenMsgPP{
margin:0.2rem 0; font-size: 0.6rem;}
</style>
<%@ include file="/views/common/hostHeader.jsp"%>
<!--main-->
<div id="mainOpacity h-host-main">
	 <section class="h-main h-profile">
     	<h2>내 프로필 정보 보기</h2>
        <hr>
        <!--프로필 사진 분기처리-->
        	<img src="<%=request.getContextPath()%>/img/<%=loginHost.getHostImg()%>" id="h-hostImg" name="h-hostImg">
        	<a href=""><img src="<%=request.getContextPath()%>/img/edit.svg" id="h-edit-pf"></a>
        	<input type="file" style="display:none" id="h-profileInput" accept="image/*" name="h-upFile">
		<div class="h-profile-info">
			<table>
				<tr>
					<th>아이디</th>
					<td><label for=""><input type="text" placeholder="id" value="<%=loginHost.getHostId()%>" readonly disabled></label></td>
					<td></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><label for="updateNickname"><input type="text" id="h-hostNickname" placeholder="닉네임은 2글자 이상~20글자 이하" value="<%=loginHost.getHostNickname()%>"></label></td>
					<td><button id="h-updateNickname">변경</button></td>
				</tr>
				<tr>
					<td class="h-profile-explanation" colspan="3"><small>닉네임은 클래스 판매 페이지에서 상호명으로 노출 됩니다.</small></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><label for="updatePassword"><input type="password" id="h-hostPassword" placeholder="비밀번호는 영어+숫자 8글자 ~32글자 이하로 입력해주세요" value="••••••••"></label></td>
					<td><button id="h-updatePassword">변경</button></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><label for=""><input type="text" value="<%=loginHost.getHostEmail()%>" id="h-hostEmail"></label></td>
					<td><button id="h-updateEmail">변경</button></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><label for=""><input type="text" value="<%=loginHost.getHostPhone()%>" disabled></label></td>
					<td></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><label for="updatePhone"><input type="text" id="h-hostHomePhone" placeholder="전화번호는 클래스 판매 페이지에서 대표 번호로 노출 됩니다." value="<%=loginHost.getHostHomephone()%>"></label></td>
					<td><button id="h-updatePhone">변경</button></td>
				</tr>
				<tr>
					<td class="h-profile-explanation" colspan="3"><small>전화번호는 클래스 판매 페이지에서 대표 번호로 노출 됩니다.</small></td>
				</tr>
			</table>
			<button class="h-submit">등록</button>
		</div>        
	</section>
	<div class="h-modalNickName" style="display: hidden">
		<div class="modal-content h-updateNickname">
			<h4>변경할 닉네임을 입력하세요</h4>
			<input type="text" name="nickName" id="h-checkNickname">
			<div class="hiddenMsg"></div>
			<button id="h-applyNickname">변경</button>
			<button class="h-close-modal">변경 취소</button>
		</div>
	</div>
	
	<div class="h-modalPassword" style="display: hidden">
		<div class="modal-content h-updatePassword">
			<table>
				<tr>
					<td>현재 비밀번호</td>
					<td><input type="password" name="password" id="h-curPw" required></td>
				</tr>
				<tr><td colspan="2" style="display:hidden;" class="hiddenMsgPP"></td></tr>
				<tr>
					<td>변경할 비밀번호</td>
					<td><input type="password" name="password" id="h-newPw" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="password" id="h-checkPw" required></td>
				</tr>
				<tr><td colspan="2" style="display:hidden;" class="hiddenMsgP"></td></tr>
			</table>
			<button id="h-applyHostPwd">변경</button>
			<button class="h-close-modal">변경 취소</button>
		</div>
	</div>
	
	<div class="h-modalEmail" style="display: hidden;">
		<div class="modal-content h-updateEmail">
			<table>
				<tr>
					<td>변경할 이메일 주소</td>
					<td><input type="email" name="hostEmail" id="h-checkEmail" required></td>
					<td><button name="hostEmail_check" id="hostEmail_check" onclick="hsendMail()">인증번호 발송</button>
						<input type="hidden" id="m-timer" value="180">
					</td>
				</tr>
				<tr>
					<td>이메일 인증 번호</td>
					<td><input type="text" name="hostEmailNumber" id="h-checkEmailNum" required></td>
					<td><button value="인증" id="hostEmail_doubleCheck" onclick="hCheckEmail();">인증</button>
						<input type="hidden" name="hostEmail_doubleCheck">
					</td>
				</tr>
			</table>
			<button id="h-applyHostEmail">변경</button>
			<button class="h-close-modal">변경 취소</button>
		</div>
	</div>
	
	<div class="h-modalPhone" style="display: hidden">
		<div class="modal-content h-updatePhone">
			<h4>변경할 전화번호를 입력하세요</h4>
			<input type="text" name="hostPhone" id="h-checkPhone">
			<button id="h-applyhostPhone">변경</button>
			<button class="h-close-modal">변경 취소</button>
		</div>
	</div>
	<script>
	// 프로필이미지를 선택했을 때 이미지를 변경할 수 있는 파일을 선택하는 이벤트
	$("#h-edit-pf").click(e => {
		$("#h-profileInput").click();
	});
	
	// input의 이미지가 변경되었을 때 발생하는 이벤트
	$("#h-profileInput").change(e => {
		const reader = new FileReader();
	 	// input 속성의 accept를 이용해서 원하는 형식의 파일만 받을 수 있다 -> 분기처리 필수 
	 	reader.onload=(e)=> {
	 		$("#h-hostImg").attr({"src":e.target.result});
	 	}
	 	reader.readAsDataURL(e.target.files[0]); // 읽은 data URL로 바꿔주는 함수
	});
 	
 

// 프로필 수정 사항 
let inputs = document.querySelectorAll(".h-profile-info input");
$(".h-submit").click(e => {
	if ($(".h-profile-info input").val() != null) {
		//console.log(inputs[0].value);
		$.ajax({
			url: "<%=request.getContextPath()%>/host/updateProfile.do",
			data: {
				"hostNickname": $("#h-hostNickname").val(),
				"hostPw": $("#h-hostPassword").val(),
				"hostHomePhone": $("#h-hostHomePhone").val(),
				"hostEmail":$("#h-hostEmail").val(),
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


		
		
		
	</script>
	<script src="<%=request.getContextPath() %>/js/hostProfile.js"></script>
	<%@ include file="/views/common/hostFooter.jsp"%>
        