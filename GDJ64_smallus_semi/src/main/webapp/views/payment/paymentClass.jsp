<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
   import="java.util.*, com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,com.smallus.classes.model.vo.Classes"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember");
	Map<String, String> data=(Map)request.getAttribute("data");
	List<Coupon> couponList = (List)request.getAttribute("couponList");
	int price=Integer.parseInt(data.get("classPrice"));
	int personnel=Integer.parseInt(data.get("classPersonnel"));
	int sumPrice=price*personnel;
	int couponPrice=10000;
	int totalPrice=sumPrice-couponPrice;
	
	String memberName=loginMember.getMemberName();
	String memberEmail=loginMember.getMemberEmail();
	String memberPhone=loginMember.getMemberPhone();
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/test.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.coupon.model.vo.Coupon" %>
<div id="mainOpacity">
	<section class="h-payment-container">
		<div class="h-payment">
			<div class="h-payment-title">
				<h3>결제 클래스 정보</h3>
		    </div><hr>
		    <div class="h-payClass-list h-class-list-n">
		    	<a href="" class="h-class-list-img">
		    		<img src="<%=request.getContextPath()%>/img/main-img2.jpg" >
				</a>
				<table>
					<tr>
						<th>[<%=data.get("classCategoryTitle") %>]</th>
						<th>[<%=data.get("classCategoryTitle") %>]</th>
						<th colspan="3"><%=data.get("classTitle") %></th>
					</tr>
					<tr>
						<td><%=data.get("bookingTimeStart") %></td>
						<td><%=data.get("bookingTimeEnd") %></td>
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
						<td><%=loginMember.getMemberName() %></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=loginMember.getMemberEmail() %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=loginMember.getMemberPhone() %></td>
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
			    	<option value="10000">ㅊㅋㅊㅋ&nbsp;&nbsp;(할인 금액 : 10,000원)</option>
			    	<option value="3000">평양냉면&nbsp;&nbsp;(할인 금액 : 3,000원)</option>
			    </select>
		    	<button>쿠폰 적용</button>
		    </div>
		    <div class="h-payClass-list h-payClass-member">
				<table>
					<tr>
						<th>금액(클래스 금액 * 수강 인원)</th>
						<td><%=price %> 원 * <%=personnel %> 명</td>
						<th><%=sumPrice %> 원</th>
					</tr>
					<tr>
						<th>쿠폰 적용 금액</th>
						<td></td>
						<th><%=couponPrice %> 원</th>
					</tr>
					<tr>
						<th>최종 결제 금액</th>
						<td></td>
						<th><%=totalPrice %> 원</th>
					</tr>
				</table>
			</div>
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
const today = new Date();   
const hours = today.getHours(); // 시
const minutes = today.getMinutes();  // 분
const seconds = today.getSeconds();  // 초
const milliseconds = today.getMilliseconds();
const makeMerchantUid = hours +  minutes + seconds + milliseconds;
let name='<%=memberName%>'
let email='<%=memberEmail%>'
let phone='<%=memberPhone%>'
let payment_id="RSV"+makeMerchantUid;

const amount=<%=totalPrice%>

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
        merchant_uid: payment_id, // 상점에서 관리하는 주문 번호
        name : '[<%=data.get("classCategoryTitle") %>] [<%=data.get("classCategoryTitle") %>] <%=data.get("classTitle") %>',
        amount : amount, 
        buyer_email : email,
        buyer_name : name,
        buyer_tel : phone
};
IMP.request_pay(data, response => {
	alert("callback!: "+JSON.stringify(response));
	
    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
jQuery.ajax({
		url: "/payments/callback_receive.do", //cross-domain error가 발생하지 않도록 주의해주세요
        type: 'POST',
        header:{'Content-Type':'application/json'},
        data: JSON.stringify(response)
	}).done(function (data){
		alert('Please, Check your payment result page');
		 $( "#mainOpacity" ).html(data);
	    if (rsp.success) {
	      var msg = '결제가 완료되었습니다.';
	      alert(msg);
	      location.href = "결제 완료 후 이동할 페이지 url"
	    } else {
	      var msg = '결제에 실패하였습니다.';
	      msg += '에러내용 : ' + response.error_msg;
	      alert(msg);
	    }
	})
	});
}
<%-- function(rsp) {
    if ( rsp.success ) {
        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        jQuery.ajax({
            url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
            type: 'POST',
            dataType: 'json',
            data: {
                imp_uid : rsp.imp_uid
                //기타 필요한 데이터가 있으면 추가 전달
            }
        }).done(function(data) {
            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            if ( everythings_fine ) {
                msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + rsp.imp_uid;
                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                alert(msg);
            } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
            }
        });
        //성공시 이동할 페이지
        location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
    } else {
        msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        //실패시 이동할 페이지
        location.href="<%=request.getContextPath()%>/order/payFail";
        alert(msg);
    } --%>
</script>
