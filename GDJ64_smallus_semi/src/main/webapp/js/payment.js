
        const today = new Date();   
        const hours = today.getHours(); // 시
        const minutes = today.getMinutes();  // 분
        const seconds = today.getSeconds();  // 초
        const milliseconds = today.getMilliseconds();
        const makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
        
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
    	        merchant_uid: "RSV"+makeMerchantUid, // 상점에서 관리하는 주문 번호
    	        name : '[<%=data.get("classCategoryTitle") %>] [<%=data.get("classCategoryTitle") %>] <%=data.get("classTitle") %>',
    	        amount : totalPrice, 
    	        buyer_email : '<%=loginMember.getMemberEmail()%>',
    	        buyer_name : '<%=loginMember.getMemberName()%>',
    	        buyer_tel : '<%=loginMember.getMemberPhone()%>'
		};
    	IMP.request_pay(data, response => {
    		alert("callback!: "+JSON.stringify(response));
    		
    	    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    		jQuery.ajax({
    			url: "/payments/callback_receive", //cross-domain error가 발생하지 않도록 주의해주세요
    	        type: 'POST',
    	        header:{'Content-Type':'application/json'},
    	        data: JSON.stringify(response)
    		}).done(function (data){
    			alert('Please, Check your payment result page');
    		})
    		});
		}
		
		/* AuthResponse {
			code (integer, optional): 0이면 정상적인 조회, 0아닌 값이면 message를 확인해봐야 합니다 ,
			message (string, optional): code값이 0이 아닐 때, '존재하지 않는 결제정보입니다'와 같은 오류 메세지를 포함합니다 ,
			response (AuthAnnotation, optional)
			}
		AuthAnnotation {
			access_token (string): 인증이 필요한 REST API요청에 사용할 access_token ,
			expired_at (integer): token만료시각. UNIX timestamp ,
			now (integer): 현재시각 UNIX timestamp. token만료시각을 정확히 계산하기 위해 사용
			} */
		
		
		
		// https://api.iamport.kr/users/getToken
		// request Body
		/* {
		  "code": 0,
		  "message": null,
		  "response": {
		    "access_token": "df138e66f8ea99f10397cb9b0bd67f78ccf32279",
		    "now": 1687088449,
		    "expired_at": 1687090249
		  }
		} */
		
		// 결제 완료 수신url
		//https://myservice.com/payments/complete?imp_uid=결제건을_특정하는_포트원_번호&merchant_uid=가맹점_고유_주문번호&imp_success=true
				
				//결제 성공(결제 상태: paid, imp_success: true)
/* 					결제 실패(결제 상태: failed, imp_success: false)
					PG 모듈 설정이 올바르지 않아, 결제 창이 열리지 않음
					사용자가 임의로 X 버튼이나 취소 버튼을 눌러 결제를 종료함
					카드 정보 불일치, 한도 초과, 잔액 부족 등의 사유로 결제가 중단됨
					가상계좌 **발급 완료(**결제 상태: ready, imp_success: true) *

					
					
					// 주문번호 만들기
					/* function createOrderNum(){
						const date = new Date();
						const year = date.getFullYear();
						const month = String(date.getMonth() + 1).padStart(2, "0");
						const day = String(date.getDate()).padStart(2, "0");
						
						let orderNum = year + month + day;
						for(let i=0;i<10;i++) {
							orderNum += Math.floor(Math.random() * 8);	
						}
						return orderNum;
					}


					// 카드 결제
					function paymentCard(data) {
						// 모바일로 결제시 이동페이지
						const pathName = location.pathname;
						const href = location.href;
						const m_redirect = href.replaceAll(pathName, "");
							
						IMP.init("가맹점 식별코드"); 
							
						IMP.request_pay({ // param
							pg: "html5_inicis",
						  	pay_method: data.payMethod,
						  	merchant_uid: data.orderNum,
						  	name: data.name,
						  	amount: data.amount,
						   	buyer_email: "",
						   	buyer_name: "",
						  	buyer_tel: data.phone,
						  	buyer_addr: data.deleveryAddress2 + " " + data.deleveryAddress3,
						  	buyer_postcode: data.deleveryAddress1,
						  	m_redirect_url: m_redirect, 
					  	}, 
						function (rsp) { // callback
							if (rsp.success) {
					         // 결제 성공 시 로직,
						        data.impUid = rsp.imp_uid;
						        data.merchant_uid = rsp.merchant_uid;
						        paymentComplete(data);  
								
							} else {
					          // 결제 실패 시 로직,
							}
						});
					}

					// 계산 완료
					function paymentComplete(data) {
						
						 $.ajax({
							url: "/api/order/payment/complete",
					        method: "POST",
					        data: data,
						})
						.done(function(result) {
							messageSend();
					        swal({
								text: result,
								closeOnClickOutside : false
							})
							.then(function(){
								location.replace("/orderList");
							})
						}) // done 
					    .fail(function() {
							alert("에러");
							location.replace("/");
						}) 
					}   */ 
		
		
				
