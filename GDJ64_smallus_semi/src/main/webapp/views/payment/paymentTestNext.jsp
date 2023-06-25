<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/test.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/payment.js"></script>
<%@ page import="java.util.List, com.smallus.coupon.model.vo.Coupon, com.smallus.payment.model.vo.ClassPayment " %>
<%
	List<ClassPayment> list=(List)request.getAttribute("list");
	List<Coupon> coupons=(List)request.getAttribute("coupons");
%>
<%@ include file="/views/common/myHeader.jsp"%>
<div id="mainOpacity">
 <!-- CATEGORY_TITLE, CLASS_TITLE, CLASS_ADDRESS, CLASS_ID, CLASS_DETAIL_ID, 
 BOOKING_TIME_START, BOOKING_TIME_END,  CLASS_PERSONNEL, REMAINING_PERSONNEL, CLASS_PRICE -->
 	<table>
 		<tr>
 			<th>카테고리 이름</th>
			<th>클래스 이름</th>
			<th>주소</th>
			<th>클래스 아이디</th>
		</tr>
		<tr>
		<%if(list!=null&&!list.isEmpty()){ 
			for(ClassPayment cp:list){%>
				<td><%=cp.getCategory().getCategoryTitle()%></td>
				<td><%=cp.getClasses().getClassTitle()%></td>
				<td><%=cp.getClasses().getClassAddress()%></td>
				<td><%=cp.getClasses().getClassId()%></td>
			<%} 
		}%>
		</tr>
 	</table>
	<table>
		<tr>
			<th>detail id</th>
			<th>시작 시간</th>
			<th>종료 시간</th>
			<th>인원 수</th>
			<th>잔여 인원 수</th>
			<th>금액</th>
		</tr>
		<%if(list!=null&&!list.isEmpty()){ 
			for(ClassPayment cp:list){%>
			<tr>
				<td><%=cp.getClassDetail().getClassDetailId()%></td>
				<td><%=cp.getClassDetail().getBookingTimeStart()%></td>
				<td><%=cp.getClassDetail().getBookingTimeEnd()%></td>
				<td><%=cp.getClasses().getClassPersonnel() %></td>
				<td><%=cp.getClassDetail().getRemainingPersonnel() %></td>
				<td><%=cp.getClasses().getClassPrice()%></td>
			</tr>
			<%} 
		}%>
	</table>
			<div class="h-payment-title" id="h-hide">
		    	<button id="h-p">다음</button>
		    </div>
</div>
<script>
	// 결제로 넘어가는 연습페이지
	$("#h-p").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/payment.do?memberId=<%=loginMember.getMemberId()%>",
			dataType:"html",
			success:function(data){
				console.log(data);
				$("#mainOpacity").html(data);
			}
		})
	});
</script>
<%@ include file="/views/common/footer.jsp"%>