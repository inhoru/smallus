<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.smallus.member.model.vo.Member,java.util.Date"%>
	<%@ include file="/views/common/mainHeader.jsp"%>
<%

List<Member> payment = (List) request.getAttribute("completedPayment");
int cPage = (int) request.getAttribute("cPage");
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
				<div class="i-paymentContainer">
					<h2 class="i-mypageh2">결제내역</h2>
					<div class="i-paymenclick">
						<span class="i-completedList">결제완료</span><span
							class="i-cancellationList">결제취소</span>
					</div>
				</div>
				<%
				if (payment.isEmpty()) {
				%>
				<div class="i-nocoupon">결제내역이 없습니다.</div>
				<%
				} else {
				%>
				<%
				for (Member p : payment) {
					String paymentStatus = p.getPayment().getPaymentStatus();
					Date endDate = p.getClassDetail().getBookingTimeEnd();
					Date startDate = p.getClassDetail().getBookingTimeStart();
					Date today = new Date(System.currentTimeMillis());
				%>
				<div class="i-paymentList">
					<div class="i-paymentTypeDate">
						<span class="i-paymentStatus"><%=p.getPayment().getPaymentStatus()%>
						</span><span><%=p.getPayment().getPaymentDate()%></span>
					</div>
					<input type="hidden" value="<%=p.getPayment().getPaymentId()%>"
						name="paymentId" class="i-paymentId">
					<div class="i-paymentimg">
						<img
							src="<%=request.getContextPath()%>/upload/class/<%=p.getClasses().getClassThumbnail()%>"
							alt="" width="180px" height="180px">
						<div class="i-paymenttotal">
							<h3 class="i-patmenth3"><%=p.getClasses().getClassTitle()%></h3>
							<span>인원 : <%=p.getPayment().getClassPersonnel()%></span><br />
							<span class="i-booking"><%=p.getClassDetail().getBookingTimeStart()%>
								|| <%=p.getClassDetail().getBookingTimeEnd()%></span>
						</div>
						<div class="i-paymentbutton">
							<%
							if (paymentStatus.equals("결제완료")) {
							%>
							<button class="i-withdrawalbutton1 i-writingreview i-cancel" >예약취소</button>
							<%
							} else if(paymentStatus.equals("수강완료")){
							%>
							<button class="i-withdrawalbutton1 i-writingreview">후기
								작성</button>
							<%
							}
							%>
							<%
							if (paymentStatus.equals("결제취소") || endDate.after(today)) {
							%>
							<%
							} 
							%>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<%
			}
			%>

		</section>
		<%
		if (payment.isEmpty()) {
		%>

		<%
		} else {
		%>
		<div class="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>
		<%
		}
		%>
	</div>
	<script>
	
	$(".i-patmenth3").click(e=>{
	const statu=$(e.target).closest(".i-paymentList").find(".i-paymentStatus").text().trim().toLowerCase();
	const paymentId=$(e.target).closest(".i-paymentList").find(".i-paymentId").val();
	
	console.log(paymentId);
	console.log(statu);
		if(statu=='결제완료'){
			$.ajax({
				type:"get",
				url:"<%=request.getContextPath()%>/paymentCompleted.do",
				 data: {id:paymentId,cPage:<%=cPage%>},
				success:data=>{
					$("#mainOpacity").html(data);
				},
				error:(r,m)=>{
					console.log(r);
					console.log(m);
					if(e.status==404) alert("요청한 페이지가 없습니다");
				}
			})
		}else if(statu=='수강완료'){
			$.ajax({
				type:"get",
				url:"<%=request.getContextPath()%>/paymentCompleted.do",
				 data: {id:paymentId,cPage:<%=cPage%>},
				success:data=>{
					$("#mainOpacity").html(data);
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
				url:"<%=request.getContextPath()%>/memberCancellation.do",
				data: {id:paymentId,cPage:<%=cPage%>},
				success:data=>{
					$("#mainOpacity").html(data);
				},
				error:(r,m)=>{
					console.log(r);
					console.log(m);
					if(e.status==404) alert("요청한 페이지가 없습니다");
				}
			})
		}
	});
	
	
$(".i-completedList").click(e=>{
const completed=$(e.target).text();
location.assign("<%=request.getContextPath()%>/paymentajaxcompleted.do?status="+completed)
});

$(".i-cancellationList").click(e=>{	
	const cancellation=$(e.target).text();
	
	location.assign("<%=request.getContextPath()%>/paymentajaxcancellation.do?status="+cancellation)
});
	
$(".i-cancel").click(function(e) {
	const context="http://localhost:8080/GDJ64_smallus_semi";
	  const paymentId = $(this).closest(".i-paymentList").find(".i-paymentId").val();
	  window.open(context+"/paymentCancel.do?paymentId="+paymentId,"_blank",'width=500 , height=200, left=670, top=300');
});




</script>


	<%@ include file="/views/common/footer.jsp"%>