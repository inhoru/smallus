<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<div id="mainOpacity">
	<section class="i-tablecontent">
		<table class="i-mypageCategories">
			<tr>
				<td class="i-myInfo i-my">내정보</td>
				<td class="i-info">클래스정보</td>
				<td class="i-customerService i-cu">고객센터</td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="./profile.html">프로필관리</a></td>
				<td><a href="./mypagePayment.html">결제내역</a></td>
				<td class="i-customerService"><a href="">공지사항</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="./withdrawal.html">회원탈퇴</a></td>
				<td><a href="./mypageWishlist.html">찜관리</a></td>
				<td class="i-customerService"><a href="">1:1 문의</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="./mypageCoupon.html">쿠폰관리</a></td>
				<td><a href="">후기관리</a></td>
				<td class="i-customerService"><a href="">Q&A</a></td>
			</tr>
		</table>
	</section>
	<form id="memberFrm" method="post">
		<div class="i-profiletotal">
			<section class="i-proFile">
				<h2 class="i-proFileh2">프로필 수정</h2>
				<div class="i-proFileInfo">
					<img src="<%=request.getContextPath()%>/img/mypage/기본프로필.png"
						alt=""> <a href=""><img
						src="<%=request.getContextPath()%>/img/mypage/프로필수정.png" alt=""
						class="i-proFileInfoimg"></a>

				</div>
				<div class=i-proFileModify>
					<div class="i-proFile1">
						<h3>아이디</h3>
						<h3>닉네임</h3>
						<h3>비밀번호</h3>
						<h3>이메일</h3>
						<h3>휴대폰번호</h3>
					</div>
					<div class="i-proFile2">
						<input type="text" value="<%=loginMember.getMemberId()%>"
							disabled> <input type="text"
							value="<%=loginMember.getMemberNickname()%>" readonly> <input
							type="text" value="******" readonly> <input type="text"
							value="<%=loginMember.getMemberEmail()%>" readonly> <input
							type="text" value="<%=loginMember.getMemberPhone()%>" required>
					</div>
					<div class="i-proFile3">
						<button class="i-nonebutton">변경</button>
						<button onclick="fn_updateNickname();">변경</button>
						<button onclick="fn_updatePassword();">변경</button>
						<button >변경</button>
						<button class="i-nonebutton">변경</button>
					</div>
				</div>
				<a href=""><button class="i-storage">저장</button></a>
			</section>
		</div>
	</form>
</div>
<script>
  
  /* 패스워드 변경창 */
    const fn_updatePassword=()=>{
		window.open("<%=request.getContextPath()%>/member/updatePassword.do?userId=<%=loginMember.getMemberId()%>","_blank",'width=500 , height=330, left=450, top=350');
		
	}
    /* 닉네임 변경창 */
    const fn_updateNickname=()=>{
		window.open("<%=request.getContextPath()%>/member/updateNickname.do?userId=<%=loginMember.getMemberId()%>","_blank",'width=500 , height=330, left=450, top=350');
    </script>
<%@ include file="/views/common/footer.jsp"%>