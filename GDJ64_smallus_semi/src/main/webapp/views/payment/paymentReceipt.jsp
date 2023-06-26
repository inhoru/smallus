<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
   import="java.util.*, com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,com.smallus.classes.model.vo.Classes
   com.smallus.payment.model.vo.PaymentCompleted"%>
 <%
	Member m= (Member) session.getAttribute("loginMember");
 	PaymentCompleted p = (List)request.getAttribute("payment");
	
	String memberName=m.getMemberName();
	String memberEmail=m.getMemberEmail();
	String memberPhone=m.getMemberPhone();
	int total=64000;
	String t="*초보가능*마들렌 만들기";
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/test.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	th#h-pay-classTitle{
	text-align:left;}
</style>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.coupon.model.vo.Coupon" %>
<%@ include file="/views/common/myHeader.jsp"%>
<div id="mainOpacity">
	<section class="h-payment-container">
		<div class="h-payment">
			<div class="h-payment-title">
				<h3>결제 클래스 정보</h3>
		    <div class="h-payClass-list h-class-list-n">
		    	<a href="" class="h-class-list-img">
		    		<img src="<%=request.getContextPath()%>/img/main-img2.jpg" >
				</a>
				<table>
					<tr><th>[<%=p.getClasses().getHostNickname()%>]</th></tr>
					<tr><th>닉네임</th></tr>
					<tr>
						<th>[<%=p.getCategory().getClassCategoryTitle()%>]&nbsp;&nbsp;[<%=p.getClasses.getClassAddress()%>]</th>
						<th colspan="4" id="h-pay-classTitle"><%=p.get("classTitle") %></th>
						<th colspan="4" id="h-pay-classTitle"><%=t %></th>
					</tr>
					<tr>
						<td><%=p.getClassDetail().getBookingTimeStart() %></td>
						<td><%=p.getClassDetail().getBookingTimeEnd() %></td>
						<td></td>
						<td>수강 신청 인원</td>
						<td><%=p.getPayment().getClassPersonl()%> 명</td>
						<td>2</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="h-payment">
			<div class="h-payment-title">
				<h3>결제 회원 정보</h3>
		    </div><hr>
		    <div class="h-payClass-list h-payClass-member">
				<table>
					<tr>
						<th>이름</th>
						<td><%=m.getMemberName() %></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=m.getMemberEmail() %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=m.getMemberPhone() %></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="h-payment">
			<div class="h-payment-title">
				<h3>결제 금액</h3>
		    </div><hr>
		    <div class="h-payClass-list h-payClass-member">
				<table>
					<tr>
						<th>금액(클래스 금액 * 수강 인원)</th>
						<td id="h-payPrice"><%=p.getPayment().getPrice() %></td>
						<td id="h-payPersonnel"><%=p.getPayment().getClassPersonnel() %></td>
						<th id="h-paySumPrice"></th>
					</tr>
					<tr>
						<th>쿠폰 적용 금액</th>
						<td></td>
						<th id="h-couponPrice">0</th>
					</tr>
					<tr>
						<th>최종 결제 금액</th>
						<td></td>
						<th id="h-totalPrice"><%=total %></th>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<p>
				
			</p>
		</div>
	</section>
	
</div>
<script>
</script>
