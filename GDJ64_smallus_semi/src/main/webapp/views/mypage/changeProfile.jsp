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
				<td class="i-myInfo"><a
					href="<%=request.getContextPath()%>/memberprofile.do">프로필관리</a></td>
				<td><a href="<%=request.getContextPath()%>/memberpayment.do">결제내역</a></td>
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/admin/noticeListServlet.do">공지사항</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a
					href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
				<td><a href="<%=request.getContextPath()%>/memberWishList.do">찜관리</a></td>
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/memberInquiry.do">1:1 문의</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a
					href="<%=request.getContextPath()%>/mypageCoupon.do">쿠폰관리</a></td>
				<td><a href="<%=request.getContextPath()%>/review/reviewList.do">후기관리</a></td>
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/ajax/qnaTest.do">Q&A</a></td>
			</tr>
		</table>
	</section>
	<form action="<%=request.getContextPath()%>/member/insertMember.do" id="memberFrm" method="post" enctype="multipart/form-data">
		<div class="i-profiletotal">
			<section class="i-proFile">
				<h2 class="i-proFileh2">프로필 수정</h2>
				<div class="i-proFileInfo">
					<img src="<%=request.getContextPath()%>/upload/mypageprofile/<%=loginMember.getMemberImg()%>"
						alt="" class="i-myprofile" name="i-mypageImg"> 
						<img src="<%=request.getContextPath()%>/img/mypage/프로필수정.png" class="i-proFileInfoimg">
						<input type="file" style="display:none" id="profileInput" name="i-upFile">

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
						 disabled name="memberId" class="i-memberId"> <input type="text"
							value="<%=loginMember.getMemberNickname()%>" id="i-nickName" name="memberNickname" readonly> <input
							type="text" value="******" readonly> <input type="text"
							value="<%=loginMember.getMemberEmail()%>" id="i-email" name="memberEmail"> <input
							type="text" value="<%=loginMember.getMemberPhone()%>" disabled>
					</div>
					<div class="i-proFile3">
						<button class="i-nonebutton">변경</button>
						<button onclick="fn_updateNickname();">변경</button>
						<button onclick="fn_updatePassword();">변경</button>
						<button onclick="fn_updateEmail();" >변경</button>
						<button class="i-nonebutton">변경</button>
					</div>
				</div>
				<button class="i-storage">저장</button>
			</section>
		</div>
	</form>
</div>
<script>
const memberId=$(".i-memberId").val();
const fn_updatePassword=()=>{
	 event.preventDefault();
	window.open("<%=request.getContextPath()%>/member/updatePassword.do?userId="+memberId,"_blank",'width=500 , height=330, left=670, top=300')
	
}
/* 닉네임 변경창 */
const fn_updateNickname=()=>{
	window.open("<%=request.getContextPath()%>/updatenickname.do","_blank",'width=500 , height=330, left=670, top=300');
	 event.preventDefault();
	}
	/*이메일 변경창*/
	const fn_updateEmail=()=>{
	window.open("<%=request.getContextPath()%>/updateEmail.do","_blank",'width=550 , height=330, left=670, top=300');
	 event.preventDefault();
	}

</script>

<%@ include file="/views/common/footer.jsp"%>