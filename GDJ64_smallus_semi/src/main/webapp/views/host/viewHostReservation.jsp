<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<Payment> rsvList =(List)session.getAttribute("rsvList"); %>
<%@ include file="/views/common/hostHeader.jsp"%>
<script src="<%=request.getContextPath() %>/js/calendar.js"></script>
<%@ page import="java.util.List, com.smallus.payment.model.vo.Payment" %>
<!--main-->
<div id="mainOpacity h-host-main">
	<section class="h-main h-rsv">
     	<div class="h-main-title">
			<h2>5월 예약 내역</h2><hr>
     			<!-- 예약 내역 상세 페이지로 이동 -->
                <!-- <div class="h-viewList"><a href="">+</a></div> -->
        </div><hr>
		<div class="h-r-callendar" id="h-main-calendar"></div>
        
	</section>
	<section class="h-main h-main-rsvList">
            <div>
                <div class="h-main-title"> 
                    <h2>새로운 예약 내역</h2>
                    <!-- 예약 내역 상세 페이지로 이동 -->
                    <!-- <div class="h-viewList"><a href="">+</a></div> -->
                </div>
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
    
<%@ include file="/views/common/hostFooter.jsp"%>


        