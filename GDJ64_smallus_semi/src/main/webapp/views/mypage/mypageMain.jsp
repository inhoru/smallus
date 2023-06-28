a<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<%@ include file="/views/common/mainHeader.jsp"%>
<%
int coupon = (int) request.getAttribute("countCoupon");
int wishCount = (int) request.getAttribute("wishCount");

List<Member> paymentDetails = (List) request.getAttribute("paymentDetails");
List<Classes> wishList = (List) request.getAttribute("wishList");
%>

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
	<div class="i-mypagetotal">
		<section id="i-main">
			<div id="i-proFile">
				<div id="i-proFileImg">
					<img
						src="<%=request.getContextPath()%>/upload/mypageprofile/<%=loginMember.getMemberImg()%>"
						alt="" id="h-go-paypage">
					<div id="i-proFileInfo">
						<h1><%=loginMember.getMemberNickname()%></h1>
						<p><%=loginMember.getMemberEmail()%></p>
					</div>
				</div>
				<div id="i-additional">
					<div class="i-additional-item">
						<img src="<%=request.getContextPath()%>/img/mypage/쿠폰.png" alt=""
							class="i-cs"> <img
							src="<%=request.getContextPath()%>/img/mypage/마이페이지하트.png" alt=""
							class="i-cs"> <img
							src="<%=request.getContextPath()%>/img/mypage/후기.png" alt=""
							class="i-cs">
					</div>
					<div class="i-additional-span">
						<span class="i-hs i-hs1">쿠폰</span> <span class="i-hs i-hs2">찜</span>
						<span class="i-hs i-hs3">후기</span>
					</div>
					<div class="i-additional-a">
						<a href="<%=request.getContextPath()%>/mypageCoupon.do"
							class="i-as1"><%=coupon%></a> <a
							href="<%=request.getContextPath()%>/memberWishList.do"
							class="i-as2"><%=wishCount %></a> <a href="<%=request.getContextPath()%>/review/reviewList.do" class="i-as3">3</a>
					</div>
				</div>
			</div>

			<h1 class="i-reservationh2">예약내역</h1>
			<div id="i-reservation">
				<input type="radio" name="slide" id="slide01" checked> <input
					type="radio" name="slide" id="slide02"> <input type="radio"
					name="slide" id="slide03"> <input type="radio" name="slide"
					id="slide04"> <input type="radio" name="slide" id="slide05">
				<input type="radio" name="slide" id="slide06"> <input
					type="radio" name="slide" id="slide07"> <input type="radio"
					name="slide" id="slide08"> <input type="radio" name="slide"
					id="slide09">
				<%
				if (paymentDetails.isEmpty()) {
				%>
				<div class="i-nopayment">예약내역이 없습니다.</div>
				<%
				} else {
				%>
				<ul class="slidelist">
					<%
					int slide = 0;
					int count = 0;
					for (Member m : paymentDetails) {
						if (count % 2 == 0) {
					%>
					<li>
						<div class="i-reservationListTotal">
							<%
							if (count != 0) {
							%>
							<span id="i-reservationSlick2"> <label
								for="slide0<%=slide%>" class="left"> <img
									src="<%=request.getContextPath()%>/img/부등호.png" alt=""
									width="20px" height="20px">
							</label>
							</span>
							<%
							}
							%>
							<%
							}
							%>

							<div class="i-reservationList">
								<div class="i-reservation-details">
									<div class="bs2">
										<span class="i-reservation-payment"> <%=m.getPayment().getPaymentStatus()%></span>
										<span class="i-reservation-day"><%=m.getPayment().getPaymentDate()%></span>
									</div>
									<div class="i-bs">
										<a href=""><div class="i-reservation-title"><%=m.getClasses().getClassTitle()%></div></a>
									</div>
									<div class="i-bs1">
										<span class="i-reservation-reservationDay"><%=m.getClassDetail().getBookingTimeStart()%>||<%=m.getClassDetail().getBookingTimeEnd()%></span>
										<span class="i-reservation-peopleNum">인원 : <%=m.getPayment().getClassPersonnel()%></span>
									</div>
								</div>
								<img
									src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>"
									alt="" class="i-reservationImg">
							</div>

							<%
							if (count % 2 == 1) {
								slide++;
							%>
							<%
							if (paymentDetails.size() > count + 1) {
							%>
							<span id="i-reservationSlick"> <label
								for="slide0<%=slide + 1%>" class="right"><img
									src="./img/부등호.png" alt="" width="20px" height="20px"></label>
							</span>
							<%
							}
							%>
						</div>
					</li>
					<%
					}

					count++;
					}
					}
					%>
				</ul>
			</div>


			<h1 class="i-wishListh2">찜</h1>
			<div class="i-wishList">
				<input type="radio" name="wishslide" id="wishListSlide01" checked>
				<input type="radio" name="wishslide" id="wishListSlide02"> <input
					type="radio" name="wishslide" id="wishListSlide03"> <input
					type="radio" name="wishslide" id="wishListSlide04"> <input
					type="radio" name="wishslide" id="wishListSlide05"> <input
					type="radio" name="wishslide" id="wishListSlide06"> <input
					type="radio" name="wishslide" id="wishListSlide07"> <input
					type="radio" name="wishslide" id="wishListSlide08"> <input
					type="radio" name="wishslide" id="wishListSlide09">
				<%
				if (wishList.isEmpty()) {
				%>
				<div class="i-nopayment">찜 내역이 없습니다.</div>
				<%
				} else {
				%>
				<ul class="wishslidelist">
					<%
					int wslide = 0;
					int wcount = 0;
					for (Classes w : wishList) {
						if (wcount % 4 == 0) {
					%>
					<li>
						<div class="i-wishListTotal">
							<%
							if (wcount != 0) {
							%>
							<span class="i-wishListSlick2"> <label
								for="wishListSlide0<%=wslide%>"> <img
									src="<%=request.getContextPath()%>/img/부등호.png" alt=""
									width="20px" height="20px">
							</label></span>
							<%
							}
							%>
							<%
							}
							%>
							<section class="i-imgContainer">
								<div class="i-img-list">
									<a href=""> <img
										src="<%=request.getContextPath()%>/upload/class/<%=w.getClassThumbnail()%>"
										alt="no img">
										<h4 class="i-classTitle"><%=w.getClassTitle()%></h4>
										<input type="hidden" value="<%=w.getClassId()%>" class="i-classId">
										<h5>
											category |
											<%=w.getCategory().getCategoryTitle()%></h5>
									</a>
									<div class="i-wish-container">
										<input type="checkbox" checked="checked"
											id="i-favorite<%=wcount%>" name="favorite-checkbox"
											value="favorite-button" class="i-wishCheck"> <label
											for="i-favorite<%=wcount%>" class="i-container"> <svg
												xmlns="http://www.w3.org/2000/svg" width="24" height="24"
												viewBox="0 0 24 24" fill="none" stroke="white"
												stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-heart">
                                                    <path
													d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                                    </path>
                                                </svg>
										</label>
									</div>
								</div>
							</section>
							<%
							if (wcount % 4 == 3) {
								wslide++;
								if (wishList.size() > wcount + 1) {
							%>
							<span class="i-wishListSlick"> <label
								for="wishListSlide0<%=wslide + 1%>"> <img
									src="<%=request.getContextPath()%>/img/부등호.png" alt=""
									width="20px" height="20px">
							</label>
							</span>
							<%
							}
							%>
						</div>
					</li>
					<%
					}
					wcount++;
					}
					}
					%>

				</ul>
			</div>
		</section>
	</div>

</div>
<script>
$(".i-wishCheck").change(e=>{
	var classTitle = $(e.target).closest('.i-imgContainer').find('.i-classId').val();
	var isChecked = $(e.target).is(':checked');
	if(isChecked){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/member/wishCheckAdd.do",
			 data: { title:classTitle},
			success:data=>{
				
			},
			error:(r,m)=>{
				console.log(r);
				console.log(m);
				if(e.status==404) alert("요청한 페이지가 없습니다");
			}
		})
	}else{
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/member/wishCheckRemove.do",
			data: { title:classTitle},
			success:data=>{
				
			},
			error:(r,m)=>{
				console.log(r);
				console.log(m);
				if(e.status==404) alert("요청한 페이지가 없습니다");
			}
		})
	}
})


$("#h-go-paypage").click(e=>{
	location.assign('<%=request.getContextPath()%>/paymentTest.do?memberId=<%=loginMember.getMemberId()%>');
})


</script>

<%@ include file="/views/common/footer.jsp"%>