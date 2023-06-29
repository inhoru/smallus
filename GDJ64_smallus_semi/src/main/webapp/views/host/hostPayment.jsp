<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%@ page import="com.smallus.payment.model.vo.PaymentCompleted" %>
<%
	PaymentCompleted paymentC=(PaymentCompleted)request.getAttribute("payment");
%>
<div id="mainOpacity" class="h-main">
	<!-- main 배너 -->
	<section class="i-mypageCommonbackground">
			<div class="i-mypageCommon">
				<h3>결제상세 내역</h3><hr>
				<div class="i-paymentCompletedList">
					<div class="i-paymentimg">
						<% if(paymentC!=null){
							%>
						<img class="hMoveToClass"
							src="<%=request.getContextPath()%>/upload/class/<%=paymentC.getClasses().getClassThumbnail()%>"
							alt="" width="150px" height="150px">
						<div class="i-patmentcontent">
							<h3 class="hMoveToClass"><%=paymentC.getClasses().getClassTitle()%></h3>
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
			<button id="hMoveTolistPayment" onclick="location.assign('<%=request.getContextPath()%>/host/viewHostRsv.do')">목록으로</button>
			</div>
<style>
.i-mypageCommon h3{
	padding:2rem 0;
}
.hMoveToClass:hover{
	font-weight:bold;
	text-decoration:underline;
}
 #hMoveTolistPayment{
	width: 6rem;
	margin:2rem 0;
	font-weight: var(--btn-bold);
	background-color: var(--ye-color);
	border:0px;
	border-radius: var(--btn-radius);
	padding: var(--btn-padding);
	font-size: var(--font-small);
 }
</style>
<script>
	$(".hMoveToClass").click(e=>{
		location.assign("<%=request.getContextPath()%>/class/viewHostClassDetail.do?title=<%=paymentC.getClasses().getClassTitle()%>");
	})
</script>
		</section>
<%@ include file="/views/common/footer.jsp"%>