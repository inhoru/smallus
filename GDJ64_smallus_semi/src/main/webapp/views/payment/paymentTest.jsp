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
	<div class="h-payment-title" id="h-hide">
		<button id="h-p">다음</button>
	</div>
	<div class="h-payment-title" id="h-hide">
		<button id="hhhhhhhh">payment</button>
	</div>
</div>
</div>
<script>
	// 결제로 넘어가는 연습페이지
	$("#h-p").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/host/payment.do",
			/* header:{'Content-Type':'application/json'}, */
			//dataType:"html",
			dataType:"json",
			success:function(data){
				console.log(data, typeof data);
				/* console.log(data[0],data[0].category.categoryTitle); */
				//$("#mainOpacity").html(data);
				let arr;
				let classA;
				let category;
				for(arr of data){
		            console.log(arr, typeof arr);
		            classA=[arr.category,arr.classDetail, arr.classes];
		            category=arr.category.categoryTitle;
		            classDetail=arr.classDetail;
		            /* $("#tesst").html(arr); */
		        }
				/* console.log(classA, typeof classA, category);
				console.log(classDetail); */
				
				let a=Object.values(classDetail);
				//let a= Object.entries(classDetail); key;value 형식으로 출
				console.log(a);
		            let p=$("<p>").text(a);
		            $("#tesst").append(p);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("에러 발생: " + textStatus, errorThrown);
			}
		})
	});
	$("#hhhhhhhh").click(e=>{
		<%-- $.ajax({
			url:"<%=request.getContextPath()%>/paymentTest.do",
			/* header:{'Content-Type':'application/json'}, */
			//dataType:"html",
			dataType:"json",
			data:{"classDetail":classDetail}
			success:function(data){
				console.log(data, typeof data);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("에러 발생: " + textStatus, errorThrown);
			}
		}) --%>
		location.assign('<%=request.getContextPath()%>/paymentTest.do');
	});
	
	
	
</script>
<%@ include file="/views/common/footer.jsp"%>