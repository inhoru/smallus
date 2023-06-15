<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<input type="button" name="memberId_check" id="memberId_check" value="중복확인" onclick="">
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
							<input type="password" id="password_2"placeholder="영어+숫자 8글자이상">
						</td>
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
							<input type="text" name="membernickName" id="memberNickname" required>
							<input type="button" name="nickName_check" id="nickName_check" value="중복확인" onclick="">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="email" placeholder="abcde@naver.com"name="memberEmail" id="memberEmail"> 
							<input type="button" name="memberEmail_check" id="memberEmail_check" value="인증번호발송" onclick="">
						</td>
					</tr>
					<tr>
						<th>이메일인증번호</th>
						<td>
							<input type="text" name="memberEmail_check2" id="memberEmail_check2">
							<input type="button" name="" value="인증" onclick="">
						</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>
						<input type="tel" placeholder="(-없이)01012345678" name="memberPhone" id="memberPhone" maxlength="11" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<legend id="m-marketing">
							[선택]마케팅 수신동의  <img src="<%=request.getContextPath()%>/img/부등호2.png" alt="왜안나와" id="m-marketingimg">
							</legend> 
							<textarea name="m-marketing_content" id="m-marketing_content"cols="50" rows="10">
							할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 원데이클래스에서 제공하는 유익한 클래스정보를 SMS나 이메일로 받아보실 수 있습니다. 단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다. 선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
      						</textarea><br>
      						<label><input type="checkbox" placeholder=""name="memberConsent" id="memberConsent">마케팅 수신동의</label>
      					</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="submit" value="회원가입" onclick="fn_validate2();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	$(() => {
   		$("#m-marketing_content").hide();
    });
	
    $("#m-marketing>img").click(() => {
    	$("#m-marketing_content").slideToggle(500)
    });
</script>
<%@ include file="/views/common/footer.jsp"%>