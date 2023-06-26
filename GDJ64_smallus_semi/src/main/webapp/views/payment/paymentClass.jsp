<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
   import="java.util.*, com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,com.smallus.classes.model.vo.Classes"%>
 <%
	Member m= (Member) session.getAttribute("loginMember");
	/*  Map<String, String> data=(Map)request.getAttribute("data");
	List<Coupon> coupon = (List)request.getAttribute("coupon");
	int price=Integer.parseInt(data.get("classPrice"));
	int personnel=Integer.parseInt(data.get("classPersonnel"));
	int sumPrice=price*personnel;
	int couponPrice=10000;
	int totalPrice=sumPrice-couponPrice; */
	
	String memberName=m.getMemberName();
	String memberEmail=m.getMemberEmail();
	String memberPhone=m.getMemberPhone();
	int total=64000;
	String t="*초보가능*마들렌 만들기";
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/test.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<style>
	th#h-pay-classTitle{
	text-align:left;}
</style>
<!-- iamport.payment.js -->
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.coupon.model.vo.Coupon" %>
<%@ include file="/views/common/myHeader.jsp"%>
<div id="mainOpacity">
	<section class="h-payment-container">
		<div class="h-payment">
			<div class="h-payment-title">
				<h3>결제 클래스 정보</h3>CLA1000 -클래스 아이디 인원 20명 가격 32000원
				CLD1005 23/07/13 - 23/07/13 남은 인원수 20명
		    </div><hr>
		    <div class="h-payClass-list h-class-list-n">
		    	<a href="" class="h-class-list-img">
		    		<img src="<%=request.getContextPath()%>/img/main-img2.jpg" >
				</a>
				<table>
					<%-- <tr><th>[<%=data.get("hostNickname") %>]</th></tr> --%>
					<tr><th>닉네임</th></tr>
					<tr>
						<%-- <th>[<%=data.get("classCategoryTitle") %>]&nbsp;&nbsp;[<%=data.get("classAddress") %>]</th> --%>
						<%-- <th colspan="4" id="h-pay-classTitle"><%=data.get("classTitle") %></th> --%>
						<th colspan="4" id="h-pay-classTitle"><%=t %></th>
					</tr>
					<tr>
						<%-- <td><%=data.get("bookingTimeStart") %></td>
						<td><%=data.get("bookingTimeEnd") %></td> --%>
						<td>23/07/13 3시</td>
						<td>23/07/13 5시</td>
						<td></td>
						<td>수강 신청 인원</td>
						<%-- <td><%=personnel%> 명</td> --%>
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
			<div class="h-payment-title h-payment-coupon">
				<h4>쿠폰</h4>
			    <select id="h-selectCoupon" name="h-selectCoupon">
				    <option selected disabled>쿠폰 선택</option>
			    	<%-- <%if(coupon!=null&&!coupon.isEmpty()){
			    		for(Coupon c: coupon){%>
				    	<option value="<%=c.getCouponPrice()%>"><%=c.getCouponName() %>&nbsp;&nbsp;(할인 금액 : <%=c.getCouponPrice()%>원)</option>
			    	<%}
			    	}else{ %> --%>
				    	<option value="0">보유한 쿠폰이 없습니다.</option>
			    <%-- 	<%} %> --%>
			    </select>
		    	<button onclick="selectOption()">쿠폰 적용</button>
		    </div>
		    <div class="h-payClass-list h-payClass-member">
				<table>
					<tr>
						<th>금액(클래스 금액 * 수강 인원)</th>
						<td id="h-payPrice">32000</td>
						<td id="h-payPersonnel">2</td>
						<th id="h-paySumPrice">64000</th>
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
		
		<div class="h-payment">
			<div class="h-payment-title">
		    	<button value="kakaopay"onclick="payment('kakaopay','card')">k 결제하기</button>
		    	<button value="inicis"onclick="payment('inicis','card')">i 결제하기</button>
		    	<button value="kcp"onclick="payment('kcp','card')">k 결제하기</button>
		    </div>
		</div>
	</section>
	
</div>
<script>
//select 옵션 변경하면 이동하는 함
<%-- function selectOption(){
	let coupon=$("#h-selectCoupon option:selected").val();
	$("#h-couponPrice").text("- "+coupon+" 원")
	let sum='<%=sumPrice %>';
	let total=sum-coupon;
	$("#h-totalPrice").text(total+" 원")
	// index =1 -> W / 2:Y/3:N
	//console.log($("#h-couponPrice"));
} --%>
const today = new Date();   
const year = today.getFullYear();
const month = ('0' + (today.getMonth() + 1)).slice(-2);
const day = ('0' + today.getDate()).slice(-2);

const dateString = year + '' + month  + '' + day;


const hours = ('0' + today.getHours()).slice(-2); 
const minutes = ('0' + today.getMinutes()).slice(-2);
const seconds = ('0' + today.getSeconds()).slice(-2); 

const timeString = hours + '' + minutes  + '' + seconds;
const makeMerchantUid = dateString+timeString;
let name='<%=memberName%>'
let email='<%=memberEmail%>'
let phone='<%=memberPhone%>'
let payment_id="RSV"+makeMerchantUid;
<%-- const amount=<%=totalPrice%> --%>

function payment(pg_provider, payment_method){
	var IMP = window.IMP; 
	IMP.init("imp33310440");
	var pg_mid;
	
	if(pg_provider=='inicis'){
		pg_mid='html5_inicis';
	}else if(pg_provider=='kakaopay'){
		pg_mid='kakaopay.TC0ONETIME';
	}else if(pg_provider=='kcp'){
		pg_mid='kcp.A52CY';
	}

	alert(pg_mid);
	
	const data={
			pg : pg_mid, //pg : 'html5_inicis',
			pay_method : 'card',
	        merchant_uid: 'RSV'+makeMerchantUid, // 상점에서 관리하는 주문 번호
	       <%--  name : '<%=data.get("classTitle") %>', --%>
	       	name:'*초보가능*마들렌 만들기',
	        amount : 64000,
	        buyer_email : email,
	        buyer_name : name,
	        buyer_tel : phone
	};
	IMP.request_pay(data, response => {
		alert("callback!: "+JSON.stringify(response));
		//console.log(response)
		//console.log(data)
		
	    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		jQuery.ajax({
				url: "<%=request.getContextPath()%>/payments/callback_receive.do", /* //cross-domain error가 발생하지 않도록 주의해주세요 */
		        type: 'POST',
		        header:{'Content-Type':'application/json'},
		        data: {"data":JSON.stringify(response), 
		        	"classDetailId":"CLD1005", 
		        	"couponId":"NONE", 
		        	"price":"32000",
		        	"classPersonnel":"2",
		        	"totalPrice":"64000",
		        	"remainingPersonnel":"12"
		        }
			}).done(function (data){
				//const rsp=JSON.parse(data);
				//console.log(rsp);
	//			alert('Please, Check your payment result page');
				console.log(data);
				if ( response.success ) {
	               var msg = '결제가 완료되었습니다.';
	                msg += '\n고유ID : ' + response.imp_uid;
	                msg += '\n상점 거래ID : ' + response.merchant_uid;
	                msg += '\결제 금액 : ' + response.paid_amount;
	                msg += '카드 승인번호 : ' + response.apply_num;
					console.log(response);
	                alert(msg);
	                location.assign('<%=request.getContextPath()%>/payment/afterPayment.do?paymentId='+merchant_uid);
	                
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
