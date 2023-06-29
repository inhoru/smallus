<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.smallus.payment.model.vo.PaymentCompleted"%>
<%
List<PaymentCompleted> payment = (List) request.getAttribute("paymentList");
String cPage=(String)request.getAttribute("cPage");
%>
<div id="mainOpacity">
	<div class="i-withdrawalendtotal">
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
				<td><a href="<%=request.getContextPath()%>/ajax/reviewTest.do">후기관리</a></td>
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/ajax/qnaTest.do">Q&A</a></td>
			</tr>
		</table>
		</section>
		<section class="i-mypageCommonbackground">
			<div class="i-mypageCommon">
				<h2 class="i-mypageh2">결제상세 내역</h2>
				<div class="i-paymentCompletedList">
					<div class="i-paymentimg">
						<%
						for (PaymentCompleted p : payment) {
							
						%>
						<img
							src="<%=request.getContextPath()%>/upload/class/<%=p.getClasses().getClassThumbnail()%>"
							alt="" width="150px" height="150px">
						<div class="i-patmentcontent">
							<h3 ><%=p.getClasses().getClassTitle()%></h3>
							<span><%=p.getClassDetail().getBookingTimeStart()%> || <%=p.getClassDetail().getBookingTimeEnd()%></span>
							<span><%=p.getHost().getHostName()%></span>
						</div>
					</div>

				</div>
				<div class="i-paymentTypeDate i-completed">
					<span><%=p.getPayment().getPaymentStatus()%> </span><span><%=p.getPayment().getPaymentDate()%></span><br />
				</div>
				<div class="i-paymentPrice">
					<span>수량 : <%=p.getPayment().getClassPersonnel()%></span> <span><%=p.getClasses().getClassPrice()*p.getPayment().getClassPersonnel()%>원</span>
				</div>
				<div class="i-paymentInformation i-paymentInfo">
					<h3>결제정보</h3>
					<div class="i-paymentInformationDetails">
						<span>할인 쿠폰</span><span><%=p.getCoupon().getCouponPrice()%>원</span>
					</div>
					<div class="i-paymentInformationDetails">
						<span><%=p.getPaymentType().getPaymentName()%>결제</span><span><%=p.getClasses().getClassPrice() * p.getPayment().getClassPersonnel()%>원</span>
					</div>
					<div class="i-paymentInformationDetails">
						<span>총 결제금액</span><span><%=p.getClasses().getClassPrice() * p.getPayment().getClassPersonnel() - p.getCoupon().getCouponPrice()%>원</span>
					</div>
				</div>



			<%
			}
			%>
				<button class="i-storage" onclick=location.assign("<%=request.getContextPath()%>/memberpayment.do?cPage=<%=cPage %>")>목록</button>
			</div>

		</section>
	</div>
</div>
