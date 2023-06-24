<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smallus.coupon.model.vo.Coupon"%>
<%
List<Coupon> coupon = (List) request.getAttribute("coupon");
%>
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
				<td><a href="<%=request.getContextPath()%>/memberpayment.do">결제내역</a></td>
				<td class="i-customerService"><a href="">공지사항</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
				<td><a href="<%=request.getContextPath()%>/memberWishList.do">찜관리</a></td>
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/memberInquiry.do">1:1 문의</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="<%=request.getContextPath()%>/mypageCoupon.do">쿠폰관리</a></td>
				<td><a href="">후기관리</a></td>
				<td class="i-customerService"><a href="">Q&A</a></td>
			</tr>
		</table>
	</section>

			<form action="<%=request.getContextPath()%>/insertCoupon.do">
<section class="i-mypagecoupontotal">
	<div class="i-mypagecoupon">
		<h2 class="i-mypageh2">쿠폰</h2>
		<div class="i-couponinput">
			<h3>쿠폰입력</h3>
			<input type="text" name="i-insertcoupon">
			<button>등록</button>
			</form>
		</div>
		<div class="i-possessioncoupon">
			<h3>보유한 쿠폰</h3>
		</div>
		<%
		if (coupon.isEmpty()) {
		%>
		<div class="i-nocoupon">보유한 쿠폰이 없습니다.</div>
		<%
		} else {
		%>
		<div class="i-coiponcontainer">
			<%
			for (Coupon n : coupon) {
			%>
			<div class="i-coupon-card">
				<h2><%=n.getCouponName()%></h2>
				<span><%=n.getCouponPrice() %>원 할인쿠폰</span>
				<p><%=n.getCreated_date()%>~<%=n.getExpiredDate()%></p>
				<div class="i-circle1"></div>
				<div class="i-circle2"></div>
			</div>
			<%
			}
			%>
		</div>
		<%
		}
		%>
		
<%if(coupon.isEmpty()){ %>
 
        <%}else{ %>
        <div class="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
        <%} %>
</section>

</div>


<%@ include file="/views/common/footer.jsp"%>