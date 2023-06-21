<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smallus.email.*"  %>
<%@ include file="/views/common/mainHeader.jsp"%>

<style>
div#m-ernollMember{
	display: flex;
 	justify-content: center;
}
img#m-marketingimg{
 width:12px;
 height:12px;
}
table#m-ernollMemberTable input[type=button]{
	width:4rem;
	font-weight: bold;
	background-color: #E8D6C3;
	border:0px;
	border-radius: 1rem;
	text-align:center;
	font-size: 0.5rem;
	height:25px;
	cursor:pointer;
}
table#m-ernollMemberTable input[type=submit]{
	width:24rem;
	font-weight: bold;
	background-color: #E8D6C3;
	border:0px;
	border-radius: 1rem;
	padding: 0.4rem 0.6rem;
	font-size: 1rem;
	height:40px;
	cursor:pointer;
}
</style>
<body>
	<div>
	<h2 style="text-align: center; margin-top:30px;">회원가입</h2>
		<div id="m-ernollMember">
			<form action="<%=request.getContextPath()%>/member/enrollMember.do" method="post">
				<table id="m-ernollMemberTable">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" placeholder="4글자이상" name="memberId" id="memberId" required>
						</td>
						<td>
							<input type="button" name="memberId_check" id="memberId_check" 
							value="중복확인" onclick="idDuplicate();">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="password" id="password" placeholder="영어+숫자 8글자이상" required>
						</td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td>
							<input type="password" id="password2" placeholder="영어+숫자 8글자이상">
						</td>
					</tr>
					<tr style="height:3px;">
						<td></td>
						<td><b id="passwordcheck"style="text-align:center; font-size:6px;"></b></td>
						<td></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="memberName" id="memberName" required>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input type="text" name="membernickName" id="memberNickname" placeholder="닉네임은 2글자 이상" required>
						</td>
						<td>
							<input type="button" name="nickName_check" id="nickName_check" value="중복확인" onclick="nickDuplicate();">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="email" placeholder="abcde@naver.com"name="memberEmail" id="memberEmail"> 
						</td>
						<td>
							<input type="button" name="memberEmail_check" id="memberEmail_check" value="인증번호발송" onclick="mailSend();">
							<span style="display:none; color:red" id="m-timer">180</span>
						</td>
					</tr>
					<tr>
						<th>이메일인증번호</th>
						<td>
							<input type="text" name="memberEmail_check2" id="memberEmail_check2">
						</td>
						<td>
							<input type="button" name="" value="인증" onclick="emailcheck();">
							<input type="hidden" name="memberEmail_check3" id="memberEmail_check3">
						</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>
						<input type="tel" placeholder="(-없이)01012345678" name="memberPhone" id="memberPhone" maxlength="11" required>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<legend id="m-marketing">
							[선택]마케팅 수신동의  <img src="<%=request.getContextPath()%>/img/부등호2.png" alt="왜안나와" id="m-marketingimg">
							</legend> 
							<textarea name="m-marketing_content" id="m-marketing_content"cols="50" rows="10">
							할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 원데이클래스에서 제공하는 유익한 클래스정보를 SMS나 이메일로 받아보실 수 있습니다. 단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다. 선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
      						</textarea><br>
      						<label><input type="checkbox" name="memberConsent" id="memberConsent">마케팅 수신동의</label>
      					</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="submit" value="회원가입" onclick="return emailcheck2();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
let epw;
	const idDuplicate=()=>{
		const memberId=$("#memberId").val();
		if(memberId.length>=4){
		open("<%=request.getContextPath()%>/member/idDuplicate.do?memberId="+memberId
				,"_blank","width=400, height=200, top=300,left=500");		
		}else{
			alert('아이디는 4글자 이상 입력하세요!');
		}
	}
	$("#password2").keyup(e=>{
		const password=$("#password").val();
		const passwordCheck=$(e.target).val();
		let color,msg;
		if(password==passwordCheck){
			color="green";
			msg="비밀번호가 일치합니다.";
		}else{
			color="red";
			msg="비밀번호가 일치하지않습니다.";
		}
		$("#passwordcheck").css("color",color).text(msg);
	});
	const nickDuplicate=()=>{
		const memberNickname=$("#memberNickname").val();
		if(memberNickname.length>=2){
		open("<%=request.getContextPath()%>/member/nicknameDuplicate.do?memberNickname="+memberNickname
				,"_blank","width=400, height=200, top=300,left=500");		
		}else{
			alert('닉네임은 2글자 이상 입력하세요!');
		}
	}
/* 	const timecheck=setInterval(()=>{
		$("#memberEmail_check").css("display","none");
		$("#m-timer").css("display","inline");
		let timer=$("#m-timer").val();
		console.log(timer);
		$("#m-timer").text(--timer);
		if(timer==0){
			clearInterval(timecheck);
			$("#memberEmail_check").css("display","inline");
			alert("인증시간이 종료되었습니다. 다시 시도해주세요");
		}
	},1000); */
	const mailSend=()=>{
		let memberEmail=$("#memberEmail").val();
		alert("인증번호를 발송했습니다.");
		//timecheck();
		$.ajax({
			url:'<%=request.getContextPath()%>/MailSendServlet.do',
			data:{memberEmail:memberEmail},
			dataType:"text",
			success: function(data){
				console.log(data);
				if(data!='null'){
					epw=data;
					$("memberEmail_check2").focus();
				}else{
					alert("유효하지 않은 메일주소입니다. 다시 시도하세요");
				}
			},
			error:(r,m,e)=>{
				console.log(r);
				console.log(m);
			}
		});
	}
	
	function emailcheck(){
		let emailcheck=$("#memberEmail_check2").val();
		console.log(emailcheck, typeof emailcheck)
		console.log(epw, typeof epw);
		if(epw==emailcheck){
			$("#memberEmail_check3").val('Y');
			alert("인증성공하셨습니다.");
		}else{
			$("#memberEmail_check3").val('N');
			alert("인증번호를 다시 확인해주세요.");
		}
	}
	
	const emailcheck2=()=>{
		let val=$("#memberEmail_check3").val();
		console.log(val);
		if(val=='Y'){
			return true;
		}else{
			alert("이메일 인증을 진행해주세요^^");
			return false;
		}
	}
	
	$(() => {
   		$("#m-marketing_content").hide();
    });
	
    $("#m-marketing>img").click(() => {
    	$("#m-marketing_content").slideToggle(500)
    });
</script>
<%@ include file="/views/common/footer.jsp"%>