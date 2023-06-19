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
				<td class="i-myInfo"><a href="">프로필관리</a></td>
				<td><a href="./mypagePayment.html">결제내역</a></td>
				<td class="i-customerService"><a href="">공지사항</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
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
	<form action="<%=request.getContextPath()%>/member/insertMember.do" id="memberFrm" method="post" enctype="multipart/form-data">
		<div class="i-profiletotal">
			<section class="i-proFile">
				<h2 class="i-proFileh2">프로필 수정</h2>
				<div class="i-proFileInfo">
					<img src="<%=request.getContextPath()%>/upload/mypageprofile/<%=infoMember.getMemberImg()%>"
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
						<input type="text" value="<%=infoMember.getMemberId()%>"
						 disabled name="memberId" class="i-memberId"> <input type="text"
							value="<%=infoMember.getMemberNickname()%>" id="i-nickName" name="memberNickname" readonly> <input
							type="text" value="******" readonly> <input type="text"
							value="<%=infoMember.getMemberEmail()%>" disabled> <input
							type="text" value="<%=infoMember.getMemberPhone()%>" disabled>
					</div>
					<div class="i-proFile3">
						<button class="i-nonebutton">변경</button>
						<button onclick="fn_updateNickname();">변경</button>
						<button onclick="fn_updatePassword();">변경</button>
						<button class="i-nonebutton" >변경</button>
						<button class="i-nonebutton">변경</button>
					</div>
				</div>
				<button class="i-storage">저장</button>
			</section>
		</div>
	</form>
</div>

<%@ include file="/views/common/footer.jsp"%>