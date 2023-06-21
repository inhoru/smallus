<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/test.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/payment.js"></script>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.coupon.model.vo.Coupon" %>

<%@ include file="/views/common/myHeader.jsp"%>
<div id="mainOpacity">
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