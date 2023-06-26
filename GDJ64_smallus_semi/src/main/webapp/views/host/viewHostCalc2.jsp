<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<Payment> rsvList =(List)session.getAttribute("rsvList"); %>
<%@ include file="/views/common/hostHeader.jsp"%>
<%@ page import="java.util.List, com.smallus.payment.model.vo.Payment" %>
<!--main-->
<div id="mainOpacity h-host-main">
	<section class="h-main h-calc">
     	<!-- 호스트 테이블의 정산 정보 -->
			<h2>정산 정보 관리</h2><hr>
				<table class="h-calc-tbl">
					<tr>
						<td>은행 명</td>
						<td>계좌 번호</td>
						<td>예금주 명</td>
						<td>정산 일</td>
					</tr>
					<tr>
						<td><%=loginHost.getHostAccountBank()!=null&&!loginHost.getHostAccountBank().isEmpty()?loginHost.getHostAccountBank():"-"%></td>
						<td><%=loginHost.getHostAccount()!=null&&!loginHost.getHostAccount().isEmpty()?loginHost.getHostAccount():"-"%></td>
						<td><%=loginHost.getHostAccountName()!=null&&!loginHost.getHostAccountName().isEmpty()?loginHost.getHostAccountName():"-"%></td>
						<td>매달 <%=loginHost.getCalcReqDate()%>일</td>
					</tr>
				</table>
				<div><button id="asdgsdgs">수정</button><hr></div>
				
	</section>
	<!-- main -->
	<section class="h-main h-main-calcList">
		<div class="h-main-title">
			<h2>정산 내역</h2>
	    </div>
	        <hr>
			<div class="h-r-callendar" id="h-main-chart"></div>
                <table id="h-main-calc-tbl">
                    <tr>
                    	<th>NO</th>
                        <th>정산 번호</th>
                        <th>정산 상태</th>
                        <th>정산 신청 일</th>
                        <th>정산 승인 일</th>
                        <th>정산 신청 금액</th>
                        <th>정산 승인 금액</th>
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
                                <td></td>
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
    <!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$("#asdgsdgs").click(e=>{
		$.get("<%=request.getContextPath()%>/host/updateHostCalc.do",data=>{
			console.log(data);
			$(".h-calc").html(data);
		});
	})
    </script>
    <script src="<%=request.getContextPath() %>/js/host.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/views/common/hostFooter.jsp"%>


        