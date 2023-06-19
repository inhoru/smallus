<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Payment> rsvList =(List)session.getAttribute("rsvList"); %>
<%@ include file="/views/host/hostHeader.jsp"%>

    <!--main-->
    <div id="mainOpacity h-host-main">
        <!-- host-main reservation -->
        <section class="h-main">
            <div class="h-main-title">
                <h2>5월 예약 내역</h2>
                <!-- 예약내역 상세 페이지로 이동 -->
                <div class="h-viewList"><a href="">+</a></div>
            </div><hr>
            <div class="h-r-callendar" id="h-main-calendar"></div>
        </section>
        <section class="h-main h-main-rsvList">
            <div>
                <div class="h-main-title"> 
                    <h2>새로운 예약 내역</h2>
                    <!-- 예약 내역 상세 페이지로 이동 -->
                    <div class="h-viewList" id="h-main-moveTo-rsv">+</div>
                </div>
                <hr>
                <!-- ajax 통해서 넣을 예약 테이블 -->
                <table id="h-main-rsv-tbl">
                    <tr>
                    	<th>NO</th>
                        <th>결제 번호</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>예약자 아이디</th>
                        <th>예약 인원</th>
                    </tr>
                    <!-- P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, P.MEMBER_ID -->
                    <%if(rsvList!=null && !rsvList.isEmpty()){
                    	int count=1;
                    	for(Payment p: rsvList){
                        %>
		                    <tr>
		                    	<td><%=count %></td>
		                        <td><%=p.getPaymentId()%></td>
		                        <td><%=p.getClassTitle()%></td>
		                        <td><%=p.getBookingTimeStart()%> - <%=p.getBookingTimeEnd()%></td>
		                        <td><%=p.getMemberId()%></td>
                                <td><%=p.getClassPersonnel()%></td>
	                   		</tr>
	                    <%count++;
	                    }
                    
                    }else{ %>
                    <tr>
                        <td colspan="5">조회된 예약이 없습니다.</td>
                    </tr>
                    <%} %>
                </table>
            </div>
        </section>
        <!-- host-main-calc -->
        <section class="h-main">
            <div class="h-main-title">
                <h2>월별 매출 내역</h2>
                <!-- 매출 내역 상세 페이지로 이동 -->
                <div class="h-viewList"><a href="">+</a></div>
            </div><hr>
            <div class="h-r-callendar" id="h-main-chart"></div>
        </section>
        <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
        <script>
 		let rsvList = '<%=(List)session.getAttribute("rsvList")%>';
      	console.log(rsvList.length);
      	console.log(rsvList);
      	let payments=rsvList.split(",");
      	console.log(payments[9])
		/*let payments=rsvList.slice(1,4);
		console.log(payments);
		let p=payments.split(",");
		console.log(p); */
		/* let rsvLength= rsvList.length;
		chunk();
		function chunk(rsvList, size = 5) {
			  const arr = [];
			    
			  for (let i = 0; i < rsvLength; i += size) {
			    arr.push(rsvList.slice(i, i + size));
			  }

			  return arr;
	        console.log(arr);
		} */
           
        </script>
<%@ include file="/views/host/hostFooter.jsp"%>









        