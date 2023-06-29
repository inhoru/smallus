<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%
	
%>
<div id="mainOpacity" class="h-main">
	<!-- main 배너 -->
	<section class="i-mypageCommonbackground">
			<div class="i-mypageCommon">
				<h2 class="i-mypageh2">결제상세 내역</h2>
				<div class="i-paymentCompletedList">
					<div class="i-paymentimg">
						<% if(paymentC!=null){
							%>
						<img
							src="<%=request.getContextPath()%>/img/<%=paymentC.getClasses().getClassThumbnail()%>"
							alt="" width="150px" height="150px">
						<div class="i-patmentcontent">
							<h3 ><%=paymentC.getClasses().getClassTitle()%></h3>
							<span><%=paymentC.getClassDetail().getBookingTimeStart()%> || <%=paymentC.getClassDetail().getBookingTimeEnd()%></span>
							<span><%=paymentC.getHost().getHostName()%></span>
						</div>
					</div>

				</div>
				<div class="i-paymentTypeDate i-completed">
					<span><%=paymentC.getPayment().getPaymentStatus()%> </span><span><%=paymentC.getPayment().getPaymentDate()%></span><br />
				</div>
				<div class="i-paymentPrice">
					<span>수량 : <%=paymentC.getPayment().getClassPersonnel()%></span> <span><%=paymentC.getClasses().getClassPrice()*paymentC.getPayment().getClassPersonnel()%>원</span>
				</div>
				<div class="i-paymentInformation i-paymentInfo">
					<h3>결제정보</h3>
					<div class="i-paymentInformationDetails">
						<span>할인 쿠폰</span><span><%=paymentC.getCoupon().getCouponPrice()%>원</span>
					</div>
					<div class="i-paymentInformationDetails">
						<span><%=paymentC.getPaymentType().getPaymentName()%>결제</span><span><%=paymentC.getClasses().getClassPrice() * paymentC.getPayment().getClassPersonnel()%>원</span>
					</div>
					<div class="i-paymentInformationDetails">
						<span>총 결제금액</span><span><%=paymentC.getClasses().getClassPrice() - paymentC.getCoupon().getCouponPrice()%>원</span>
					</div>
				</div>



			<%}%>
				<button class="i-storage" onclick=location.assign("<%=request.getContextPath()%>/memberpayment.do")>확인</button>
			</div>

		</section>
<%@ include file="/views/common/footer.jsp"%> --%>