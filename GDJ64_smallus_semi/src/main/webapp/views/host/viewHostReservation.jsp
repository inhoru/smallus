<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<PaymentCalc> rsvList =(List)request.getAttribute("rsvList"); 
	List<PaymentCalc> sortStatusList=(List)request.getAttribute("sortStatusList");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/js/calendar.js"></script>
<%@ page import="java.util.List, 
				com.smallus.payment.model.vo.PaymentCalc,
				com.smallus.payment.model.vo.Payment,
				com.smallus.classes.model.vo.Classes,
				com.smallus.classes.model.vo.ClassDetail,
				com.smallus.host.model.vo.Calc
" %>
<div id="mainOpacity h-host-main">
	<section class="h-main h-rsv">
     	<div class="h-main-title">
			<h3>5월 예약 내역</h3><hr>
        </div><hr>
		<div class="h-r-callendar" id="h-main-calendar"></div>
        
	</section>
	<section class="h-main h-main-rsvList">
            <div>
                <div class="h-main-title"> 
                    <h3>전체 예약 내역</h3>
	                <select name="h-selectPaymentStatus" id="h-selectPaymentStatus" onchange="selectOption()">
	                	<option>결제 상태(전체)</option>
	                	<option value="Y" <%=request.getParameter("paymentStatus")!=null&&request.getParameter("paymentStatus").equals("Y")?"selected":""%>>결제 완료</option>
	                	<option value="N" <%=request.getParameter("paymentStatus")!=null&&request.getParameter("paymentStatus").equals("N")?"selected":""%>>결제 취소</option>
	                </select>
                </div>
                <table id="h-main-rsv-tbl">
                    <tr>
                        <th>결제 번호</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>예약자 아이디</th>
                        <th>예약 인원</th>
                        <th>결제 일</th>
                        <th>결제 상태</th>
                    </tr>
                    <%if(rsvList!=null && !rsvList.isEmpty()){
                    	for(PaymentCalc p: rsvList){
                        %>
		                    <tr>
		                        <td><%=p.getPayment().getPaymentId()%></td>
		                        <td><%=p.getClasses().getClassTitle()%></td>
		                        <td><%=p.getClassDetail().getBookingTimeStart()%> - <%=p.getClassDetail().getBookingTimeEnd()%></td>
		                        <td><%=p.getPayment().getMemberId()%> 님 예약</td>
		                        <td><%=p.getClasses().getClassPersonnel()%> 명</td>
		                        <td><%=p.getPayment().getPaymentDate()%></td>
		                        <td><%=p.getPayment().getPaymentStatus()%></td>
	                   		</tr>
	                 <% }
                    }else if(sortStatusList!=null && !sortStatusList.isEmpty()){
                    	for(PaymentCalc p: sortStatusList){%>
                        <tr>
		                        <td><%=p.getPayment().getPaymentId()%></td>
		                        <td><%=p.getClasses().getClassTitle()%></td>
		                        <td><%=p.getClassDetail().getBookingTimeStart()%> - <%=p.getClassDetail().getBookingTimeEnd()%></td>
		                        <td><%=p.getClasses().getClassPersonnel()%> 명</td>
		                        <td><%=p.getPayment().getMemberId()%> 님 예약</td>
		                        <td><%=p.getPayment().getPaymentDate()%></td>
		                        <td><%=p.getPayment().getPaymentStatus()%></td>
	                   		</tr>
	                   <% }
                    }else{ %>
                    <tr>
                        <td colspan="8">조회된 예약이 없습니다.</td>
                    </tr>
                    <%} %>
                </table>
            </div>
	            <div class="pageBar">
	            	<%=request.getAttribute("pageBar") %>
	            </div>
        </section>
<script>

//select 옵션 변경하면 이동
function selectOption(){
	let statusIndex = $("#h-selectPaymentStatus option").index($("#h-selectPaymentStatus option:selected"));
	// index =1 -> W / 2:Y/3:N
	//console.log(index);
	if(statusIndex==0){
		location.assign('<%=request.getContextPath()%>/host/viewHostRsv.do?');
	}else if(statusIndex==1){
		location.assign('<%=request.getContextPath()%>/host/sortingHostRsv.do?paymentStatus=Y');

	}else if(statusIndex==2){
		location.assign('<%=request.getContextPath()%>/host/sortingHostRsv.do?paymentStatus=N');
	}
}
</script>
<%@ include file="/views/common/hostFooter.jsp"%>


        