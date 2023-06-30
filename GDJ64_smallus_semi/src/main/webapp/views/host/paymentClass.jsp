<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
   import="java.util.*, com.smallus.member.model.vo.Member, 
   com.smallus.host.model.vo.Host,
   com.smallus.classes.model.vo.Classes,
   com.smallus.payment.model.vo.PaymentInfo,
   com.smallus.classes.model.vo.ClassDetail,
   com.smallus.coupon.model.vo.Coupon"%>
 <%
	Member m= (Member) session.getAttribute("loginMember");
	List<Coupon> coupon = (List)request.getAttribute("coupon");
	PaymentInfo p=(PaymentInfo)request.getAttribute("paymentInfo");
	int personnel=Integer.parseInt((String)request.getAttribute("personnel"));
	
	int remainPer=p.getClassDetail().getRemainingPersonnel();
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/payment.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<%@ include file="/views/common/myHeader.jsp"%>
<div id="mainOpacity">
<section class="h-payment-container">
		<div class="h-payment">
			<div class="h-payment-title">
				<h3>결제 클래스 정보</h3>
		    </div><hr>
		    <div class="h-payClass-list h-class-list-n">
		    	<a href="" class="h-class-list-img">
		    		<img src="<%=request.getContextPath()%>/upload/class/<%=p.getClasses().getClassThumbnail()%>" >
				</a>
				<table>
					<tr><th></th></tr>
					<tr><th><%=p.getHost().getHostNickname()%></th></tr>
					<tr>
						<th>[<%=p.getCategory().getCategoryTitle()%>]</th>
						<th colspan="4" id="h-pay-classTitle"><%=p.getClasses().getClassTitle() %></th>
					</tr>
					<tr>
						<td><%=p.getClassDetail().getBookingTimeStart()%></td>
						<td><%=p.getClassDetail().getBookingTimeEnd()%></td>
						<td></td>
						<td>수강 신청 인원</td>
						<td><%=personnel%> 명</td>
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
			<div class="h-payment-title h-payment-coupon">
				<h4>쿠폰</h4>
			    <select id="h-selectCoupon" name="h-selectCoupon">
				    <option id="h-couponNone"selected disabled>쿠폰 선택</option>
			    	<%if(coupon!=null&&!coupon.isEmpty()){
			    		for(Coupon cp: coupon){
			    			if(cp.getCouponId().equals("NONE")){%>
			    			<%}else{ %>
				    	<option value="<%=cp.getCouponPrice()%>"><%=cp.getCouponName() %>&nbsp;&nbsp;(할인 금액 : <%=cp.getCouponPrice()%>원)</option>
				    	<option id="h-usedCoupon" value="<%=cp.getCouponId()%>" style="display:none;">
			    			<%}
			    		}
			    	}else{ %>
				    	<option value="0">보유한 쿠폰이 없습니다.</option>
			    	<%} %>
			    </select>
		    	<button onclick="applyCouponPrice()">쿠폰 적용</button>
		    </div>
		    <div class="h-payClass-list h-payClass-member">
				<table>
					<tr>
						<th>금액(클래스 금액 * 수강 인원)</th>
						<td id="h-payPrice"><%=p.getClasses().getClassPrice()%> * </td>
						<td id="h-payPersonnel"><%=personnel%> 명</td>
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
						<th id="h-totalPrice"></th>
					</tr>
				</table>
			</div>
		</div>
		<div class="h-payment">
			<div class="h-payment-title">
			    <button id="h-kakaoButton" value="kakaopay" onclick="payment('kakaopay','card')">카카오페이 결제하기</button>
		    	<!-- <button value="inicis"onclick="payment('inicis','card')">i 결제하기</button> -->
		    	<button value="kcp"onclick="payment('kcp','card')">결제하기</button>
		    	<button onclick="moveToClassDetail()">뒤로 가기</button>
		    </div>
		</div>
	</section>
	<script>
	//
	function moveToClassDetail(e){
		location.assign('<%=request.getContextPath()%>//maintoclass.do');
	}
	//select 옵션 변경하면 이동하는 함
	
	let couponId;
	let classTitle ='<%=p.getClasses().getClassTitle()%>'
	let remainPer='<%=p.getClassDetail().getRemainingPersonnel()%>';
	let coupon;
	let price='<%=p.getClasses().getClassPrice()%>';
	let	person='<%=personnel%>';
	let sum = price*person;
	let total;
	
	// 쿠폰 선택 안 했을 때	
	if($("#h-couponNone:selected")){
		coupon=0;
		$("#h-totalPrice").text( sum + " 원");
		console.log("total : "+total);
		couponId="NONE";
	}else{
		applyCouponPrice();
	}
	// 쿠폰 선택 하면 금액 변경
	function applyCouponPrice(){
		coupon = $("#h-selectCoupon option:selected").val();
		console.log(coupon);
		$("#h-couponPrice").text("- " + coupon + " 원");
		
		console.log("price : "+price);
		console.log("person : "+person);
		console.log("sum : "+sum);
		total = sum-coupon;
		$("#h-totalPrice").text(total + " 원")
		console.log("total : "+total);
		couponId=$("#h-usedCoupon").val();
	}
	
	
	const today = new Date();
	const year = today.getFullYear();
	const month = ('0' + (today.getMonth() + 1)).slice(-2);
	const day = ('0' + today.getDate()).slice(-2);

	const dateString = year + '' + month + '' + day;


	const hours = ('0' + today.getHours()).slice(-2);
	const minutes = ('0' + today.getMinutes()).slice(-2);
	const seconds = ('0' + today.getSeconds()).slice(-2);

	const timeString = hours + '' + minutes + '' + seconds;
	const makeMerchantUid = dateString + timeString;
	let name = '<%=m.getMemberName()%>'
	let email = '<%=m.getMemberEmail()%>'
	let phone = '<%=m.getMemberPhone()%>'
	let classDetailId='<%=p.getClassDetail().getClassDetailId()%>';
	let payment_id = "RSV" + makeMerchantUid;

	function payment(pg_provider, payment_method) {
			var IMP = window.IMP;
			IMP.init("imp33310440");
			var pg_mid;
			if (pg_provider == 'inicis') {
				pg_mid = 'html5_inicis';
			} else if (pg_provider == 'kakaopay') {
				pg_mid = 'kakaopay.TC0ONETIME';
			} else if (pg_provider == 'kcp') {
				pg_mid = 'kcp.A52CY';
			}
			const data = {
				pg: pg_mid,//pg : 'html5_inicis',
				pay_method: 'card',
				merchant_uid: 'RSV' + makeMerchantUid, // 상점에서 관리하는 주문 번호
				name: classTitle,
				amount : total,
				buyer_email : email,
				buyer_name : name,
				buyer_tel : phone
		};
			IMP.request_pay(data, response => {
				console.log(couponId)
			      $.ajax({
			         url: "<%=request.getContextPath()%>/payments/callback_receive.do", 
			         type: 'POST',
			         header: {'Content-Type': 'application/json' },
			         data: {
			            "data": JSON.stringify(response),
			            "classDetailId":classDetailId,
			            "couponId": couponId,
			            "price": price,
			            "classPersonnel": person,
			            "totalPrice": total,
			            "remainingPersonnel": remainPer
			         }
			      }).done(function(data) {
			         if (response.success) {
			            var msg = '결제가 완료되었습니다.';
			            /* msg += '\n고유ID : ' + response.imp_uid;
			            msg += '\n상점 거래ID : ' + response.merchant_uid;
			            msg += '\결제 금액 : ' + response.paid_amount;
			            msg += '카드 승인번호 : ' + response.apply_num; */
			            console.log(response);
			            let jsonData=JSON.parse(data);
			            let pId=jsonData.merchant_uid;
			            console.log(pId)
			            alert(msg);
			            location.assign('<%=request.getContextPath()%>/paymentResult.do?paymentId='+pId)
									            

			         } else {
			            var msg = '결제에 실패하였습니다.';
			            msg += '에러내용 : ' + response.error_msg;
			            console.log(response);
			            alert(msg);
			         }
			      });// end ajax
			   }); // end request_pay
	}
	</script>
</div>
<%@ include file="/views/common/footer.jsp"%>
