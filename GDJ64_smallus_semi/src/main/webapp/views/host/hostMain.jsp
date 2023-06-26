<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smallus.host.model.vo.Host,com.smallus.payment.model.vo.Payment, 
				java.util.*, com.smallus.payment.model.vo.PaymentCalc, com.smallus.classes.model.vo.Classes"%>
<% 
	List<PaymentCalc> newList=(List)session.getAttribute("newList");
	List<Classes> calendarList=(List)session.getAttribute("calendarList");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<!--main-->
<div id="mainOpacity h-host-main">
	<!-- host-main reservation -->
	<section class="h-main">
		<div class="h-main-title">
			<h2>스케줄 관리</h2>
			<!-- 예약내역 상세 페이지로 이동 -->
			<div class="h-viewList">
				<a href="">+</a>
			</div>
		</div>
		<hr>
		<div class="h-r-callendar" id="h-main-calendar"></div>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<div class="h-main-title">
				<h2>새로운 예약 내역</h2>
				<!-- 예약 내역 상세 페이지로 이동 -->
				<div class="h-viewList" id="h-main-moveTo-rsv"><a href="<%=request.getContextPath()%>/host/viewHostRsv.do">+</a></div>
			</div>
			<hr>
			<table id="h-main-rsv-tbl">
                    <tr>
                    	<th>NO</th>
                        <th>결제 번호</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>예약자 아이디</th>
                        <th>예약 인원</th>
                        <th>결제 일</th>
                        <th>결제 상태</th>
                    </tr>
                    <%if(newList!=null && !newList.isEmpty()){
                    	int count=1;
                    	for(PaymentCalc p: newList){
                        %>
		                    <tr>
		                    	<td><%=count %></td>
		                        <td><%=p.getPayment().getPaymentId()%></td>
		                        <td><%=p.getClasses().getClassTitle()%></td>
		                        <td><%=p.getClassDetail().getBookingTimeStart()%> - <%=p.getClassDetail().getBookingTimeEnd()%></td>
		                        <td><%=p.getPayment().getMemberId()%> 님 예약</td>
		                        <td><%=p.getPayment().getClassPersonnel()%> 명</td>
		                        <td><%=p.getPayment().getPaymentDate()%></td>
		                        <td><%=p.getPayment().getPaymentStatus()%></td>
	                   		</tr>
	                    <%count++;
	                    }
                    }else{ %>
                    <tr>
                        <td colspan="8">조회된 예약이 없습니다.</td>
                    </tr>
                    <%} %>
                </table>
		</div>
	</section>
	<%@ include file="/views/common/hostFooter.jsp"%>