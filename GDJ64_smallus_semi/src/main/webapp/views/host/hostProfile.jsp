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

.h-modalNickName, .h-modalPassword, .h-modalPhone {
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

.modal-content, .h-changeNickname, .h-changePassword {
	background-color: #FFFBF5;
	margin: 15% auto;
	padding: 3rem;
	width: 40%;
	text-align:center;
}

.modal-content button {
	background-color:var(--be-color);
	padding: var(--btn-padding);
	font-size: var(--font-small);
	border-radius: var(--btn-radius);
	border: 0;
	margin-left:1rem;
	margin-top:2rem;
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
        	<img src="<%=request.getContextPath()%>/img/<%=loginHost.getHostImg()%>" id="h-hostImg">
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
					<td><label for="updatePassword"><input type="text" id="h-hostPassword" placeholder="비밀번호는 영어+숫자 8글자 ~32글자 이하로 입력해주세요" value="••••••••"></label></td>
					<td><button id="h-updatePassword">변경</button></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><label for=""><input type="text" value="<%=loginHost.getHostEmail()%>" disabled></label></td>
					<td></td>
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
				<tr><td colspan="2" display="hidden" class="hiddenMsgPP"></td></tr>
				<tr>
					<td>변경할 비밀번호</td>
					<td><input type="password" name="password" id="h-newPw" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="password" id="h-checkPw" required></td>
				</tr>
				<tr><td colspan="2" display="hidden" class="hiddenMsgP"></td></tr>
			</table>
			<button id="h-applyHostPwd">변경</button>
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
		$("#h-edit-pf").click(e=>{
			$("#h-profileInput").click();
		});
		
		
		// input의 이미지가 변경되었을 때 발생하는 이벤트
		$("#h-profileInput").change(e=>{
			const reader= new FileReader();
			// input 속성의 accept를 이용해서 원하는 형식의 파일만 받을 수 있다 -> 분기처리 필수 
			reader.onload=e=>{
				// e.target.result 속성에 변경된 파일이 나온다.
				$("#h-hostImg").attr("src",e.target.result);
			}
			reader.readAsDataURL(e.target.files[0]); // 읽은 data URL로 바꿔주는 함수
		});
		
		
		// 프로필 수정 사항 
		let inputs= document.querySelectorAll(".h-profile-info input");
		$(".h-submit").click(e=>{
			if($(".h-profile-info input").val()!=null){
				//console.log(inputs[0].value);
				$.ajax({
					url:"<%=request.getContextPath()%>/host/updateHostProfile.do",
					data:{
						"hostNickname":$("#h-hostNickname").val(),
						"hostPw":$("#h-hostPassword").val(),
						"hostHomePhone":$("#h-hostHomePhone").val(),
						"hostImg":$("#h-hostImg").val(),
					},
					success:(data)=>{
						console.log(data, typeof data);
						if(data>0){
							alert("변경 완료 :)");
						}else{
							alert("변경 실패 :<");
						}
					},error: (e,m)=>{
						console.log(data);
						}
				});
			}
		});
	
		
		// 비밀번호 모달창 닫기 
		function closeNick(e){
			$(".h-modalNickName").css('display','none');
			$("document").css('overflow','auto'); 
		}
		function closePw(e){
			$(".h-modalPassword").css('display','none');
			$("document").css('overflow','auto'); 
		}
	
	
		// 변경할 비밀번호 체크 
		$("#h-checkPw").keyup(e=>{
			let pw=$("#h-newPw").val();
			let checkPw=e.target.value;
			console.log(checkPw);
			let color=""; let msg="";
			if(pw==checkPw){
				color="green"; msg="비밀번호가 일치합니다 :)";
			}else{
				color="red"; msg="비밀번호가 불일치합니다 :<";
			}
			$(".hiddenMsgP").text(msg).css("color",color);
		})
		
		// 닉네임 변경 버튼 클릭 
		$("#h-applyHostPwd").click(e=>{
			/* let new=($("#h-checkNickname").val()); */
			document.querySelector("#h-hostPassword").value=($("#h-checkPw").val());
			$.ajax({
				url:"<%=request.getContextPath()%>/host/updateNickname.do",
				data:{"nickname":(e.target.value)},
				success:(data)=>{
					console.log(data, typeof data);
					if(data==0){
						alert('변경 완료 :)');
						closeNick();
					}else {
						alert('변경 실패 ;<');
					}
				},error: (e,m)=>{
					console.log(data);
					}
				});
		})

		// 닉네임 변경 모달창 열기
		$("#h-updateNickname").click(e=>{
			$(".h-modalNickName").css('display','block');
			$("document").css('overflow','hidden'); 
		});
		
		// 닉네임 중복 체크 
		$("#h-checkNickname").keyup(e=>{
			let hostrNicknameReg = /^[a-zA-Z0-9가-힣]{2,}$/;
			console.log(e.target.value.length)
			if(e.target.value.length>2 && e.target.value.length<21){
				$.ajax({
					url:"<%=request.getContextPath()%>/host/duplicateNickname.do",
					data:{"nickname":(e.target.value)},
					success:(data)=>{
						console.log(data, typeof data);
						let msg=""; let color="";
						if(data==0){
							msg="사용 가능한 닉네임입니다";
							color="green";
						}else {
							msg="사용 불가능한 닉네임입니다";
							color="red";
						}
						$(".hiddenMsg").text(msg).css("color",color);
					},error: (e,m)=>{
						console.log(data);
						}
					});
			}else{
				let msg=""; let color="";
				msg="두 글자 이상 입력하세요";
				color="red"
				$(".hiddenMsg").text(msg).css("color",color);
			};
		});
		
		// 닉네임 변경 버튼 클릭 
		$("#h-applyNickname").click(e=>{
			/* let new=($("#h-checkNickname").val()); */
			document.querySelector("#h-hostNickname").value=($("#h-checkNickname").val());
			alert('변경 완료 ;)')
			closeNick();
		})
		
		// 닉네임 변경모달창 닫기
		$(".h-close-modal").click(e=>{
			closeNick();
		})
		
		
		// 비밀번호 변경 모달창 열기
		$("#h-updatePassword").click(e=>{
			$(".h-modalPassword").css('display','block');
			$("document").css('overflow','hidden'); 
		});
		
		// 비밀번호 변경모달창 닫기
		$(".h-close-modal").click(e=>{
			closePw();
		})
		
		// 전화번호 변경 버튼 클릭 
		$("#h-applyhostPhone").click(e=>{
			/* let new=($("#h-checkNickname").val()); */
			document.querySelector("#h-hostHomePhone").value=($("#h-checkPhone").val());
			alert('변경 완료 ;)')
			$(".h-modalPhone").css('display','none');
			$("document").css('overflow','auto'); 
		})
		
		// 전화번호 변경 모달창 열기
		$("#h-updatePhone").click(e=>{
			$(".h-modalPhone").css('display','block');
			$("document").css('overflow','hidden'); 
		});
		
		// 전화번호 변경모달창 닫기
		$(".h-close-modal").click(e=>{
			$(".h-modalPhone").css('display','none');
			$("document").css('overflow','auto'); 
		})
		
		
		
	</script>
	<%@ include file="/views/common/hostFooter.jsp"%>
        